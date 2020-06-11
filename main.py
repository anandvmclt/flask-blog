from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from werkzeug.utils import secure_filename
import json
import os
import math
from datetime import datetime

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret_key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL='True',
    MAIL_USERNAME=params['gmail_id'],
    MAIL_PASSWORD=params['gmail_psd']
)
mail = Mail(app)
if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db = SQLAlchemy(app)


class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    phone_num = db.Column(db.String(12), unique=False, nullable=False)
    msg = db.Column(db.String(120), unique=False, nullable=False)

    date = db.Column(db.String(12), unique=False, nullable=True)
    email_id = db.Column(db.String(30), unique=False, nullable=False)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    tag_line = db.Column(db.String(35), unique=False, nullable=False)
    slug = db.Column(db.String(25), unique=False, nullable=False)
    content = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.String(12), unique=False, nullable=True)
    img_file = db.Column(db.String(20), unique=False, nullable=True)


@app.route('/')
def home():
    flash("Welcome to Anand's Blog", "secondary")
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['post_num']))
    # [0:params['post_num']]
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)

    posts = posts[(page - 1) * int(params['post_num']): (page - 1) * int(params['post_num']) + int(params['post_num'])]
    # Pagination Logic
    if page == 1:
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif (page == last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/admin')


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contact(name=name, email_id=email, phone_num=phone, msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from' + name,
        #                   sender=email,
        #                   recipients=[params['blog_usr']],
        #                   body=message + "\n" + phone)

        flash("Thankyou for Contact Us !", "success")
    return render_template('contact.html', params=params)


@app.route('/admin/', methods=['GET', 'POST'])
def dashboard():
    # if 'user' in session and session['user'] == params['admin_user']:
    #     post = Posts.query.all()
    #     return render_template('dashboard.html', params=params, post=post)
    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == params['admin_user'] and userpass == params['admin_pswd']:
            # RSet the session variable
            session['user'] = username
            post = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=post)
    else:
        return render_template('admin_login.html', params=params)


@app.route('/messages/', methods=['GET', 'POST'])
def messages():
    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == params['admin_user'] and userpass == params['admin_pswd']:
            # RSet the session variable
            session['user'] = username
            msg2 = Contact.query.all()
            return render_template('messages.html', params=params, contact=msg2)
    else:
        return render_template('msg_login.html', params=params)


@app.route('/post/<string:postslug>', methods=['GET'])
def post_route(postslug):
    slug2 = str(postslug)
    if slug2:
        post = db.session.query(Posts).filter_by(slug=slug2).first()
        return render_template('post.html', params=params, post=post)
    else:
        return render_template('404.html', params=params)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    # sl = int(sno)
    if 'user' not in session:
        return 'User Note Logined - Session error: requested url is:' + sno
    elif 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            tag_line = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno == '0':
                post = Posts(title=box_title, tag_line=tag_line, slug=slug, content=content, date=date,
                             img_file=img_file)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.tagline = tag_line
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)

        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post)


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delet(sno):
    if 'user' not in session:
        return 'User Note Logined - Session error: requested url is:' + sno
    elif 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/admin')

@app.route("/delmsg/<string:id>", methods=['GET', 'POST'])
def delmsg(id):
    if 'user' not in session:
        return 'User Note Logined - Session error: Message Del ID is:' + id
    elif 'user' in session and session['user'] == params['admin_user']:
        msgid = Contact.query.filter_by(id=id).first()
        db.session.delete(msgid)
        db.session.commit()
    return redirect('/messages')


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return 'Your Upload was Successfull !'


app.run(debug=True)
