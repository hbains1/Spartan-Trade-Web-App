<%-- 
    Document   : PasswordReset
    Created on : Apr 23, 2020, 6:38:44 PM
    Author     : harmanbains
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Reset Password</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

        <script src="assets/js/Trade.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap"
              rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">

    </head>
    <style>
        body {
            background: rgb(6, 17, 44);
            background: linear-gradient(109deg, rgba(6, 17, 44, 1) 0%, rgba(13, 27, 66, 1) 25%, rgba(17, 37, 91, 1) 51%, rgba(13, 27, 66, 1) 75%, rgba(6, 17, 44, 1) 100%);
        }

        #message {
            display: none;
            color: #000;
            position: relative;
            margin-top: 10px;
        }

        #message p {
            padding: 1px 35px;
            font-size: 18px;
        }

        /* Add a green text color and a checkmark when the requirements are right */
        .valid {
            color: green;
        }

        .valid:before {
            position: relative;
            left: -35px;
            content:"✔";
        }

        /* Add a red text color and an "x" icon when the requirements are wrong */
        .invalid {
            color: red;
        }

        .invalid:before {
            position: relative;
            left: -35px;
            content: "✖";
        }
    </style>

    <body>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content ">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Reset</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Reset Password
                            </h2>
                        </div>
                    </div>
                    <hr class="m-t">
                    <div class="pt-1 ml-1 px-auto">
                        <div class="card card-5">
                            <div class="card-heading">
                                <h2 class="title">Reset Password</h2>
                            </div>
                            <div class="card-body">
                                <form action="Acc" method="POST" id="pwdForm">
                                    <input type="hidden" name="code" value="UpdatePassword">
                                    <input type="hidden" name="ecode" value="<%=request.getParameter("ecode")%>">
                                    <div id="message">
                                        <h3 class="text-dark">Password must contain the following:</h3>
                                        <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                        <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                        <p id="number" class="invalid">A <b>number</b></p>
                                        <p id="length" class="invalid">Minimum <b>6 characters</b></p>
                                        <p id="confirm" class="invalid">Two <b>Passwords are the same</b> </p>
                                    </div>
                                    <div class="form-row">

                                        <div for="password" class="name">New Password</div>
                                        <div class="value">
                                            <div class="input-group">
                                                <input class="input--style-5" id="psw" name="password"
                                                       placeholder="Enter password"
                                                       title="Password must contain at least 6 characters, including UPPER/lowercase and numbers."
                                                       type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                                                       required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div for="password" class="name">Confirm Password</div>
                                        <div class="value">
                                            <div class="input-group">
                                                <input class="input--style-5" id="psw2" name="password2"
                                                       placeholder="Enter the same password"
                                                       title="Please enter the same password"
                                                       type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                                                       required>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <button class="btn1 btn1--red" id="resetPasswordButton"
                                                type="submit">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var myInput = document.getElementById("psw");
            var myInput2 = document.getElementById("psw2");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");
            var confirm = document.getElementById("confirm");
            // validation from w3 shool
            // https://www.w3schools.com/howto/howto_js_password_validation.asp
            // When the user clicks on the password field, show the message box
            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            }

            myInput2.onfocus = function () {
                document.getElementById("message").style.display = "block";
            }

            // When the user clicks outside of the password field, hide the message box
            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            }
            myInput2.onblur = function () {
                document.getElementById("message").style.display = "none";
            }

            // When the user starts to type something inside the password field
            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate capital letters
                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("invalid");
                    number.classList.add("valid");
                } else {
                    number.classList.remove("valid");
                    number.classList.add("invalid");
                }

                // Validate length
                if (myInput.value.length >= 6) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            }

            // Validation Confirm Password
            myInput2.onkeyup = function () {
                // alert(myInput2 + myInput);   
                if (myInput.value == myInput2.value) {
                    confirm.classList.remove("invalid");
                    confirm.classList.add("valid");
                } else {
                    confirm.classList.remove("valid");
                    confirm.classList.add("invalid");
                }
            }
        </script>
    </body>
</html>