function validateForm() {
  var fn = document.forms["contactForm"]["name"].value;
  var em = document.forms["contactForm"]["email"].value;
  var msg = document.forms["contactForm"]["message"].value;
  if (fn == "") {
    alert("Name must be filled out");
    return false;
    }
   else if (em == "") {
    alert("Email must be filled out");
    return false;
    }
   else if (msg == "") {
    alert("Please Enter Your message");
    return false;
    }
}
