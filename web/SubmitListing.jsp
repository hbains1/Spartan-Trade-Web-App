<%-- 
    Document   : SubmitListing
    Created on : Mar 24, 2020, 4:09:41 PM
    Author     : harmanbains
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

        <script src="assets/js/Trade.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <title>Submit Listing</title>
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }
        </style>
    </head>
    <!-- This form is for unregistered users submitting a listing.-->
    <body>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content ">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Create</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Create Listing by Unregistered User
                            </h2>
                        </div>
                    </div>
                    <hr class="m-t">
                    <div class="pt-1 ml-1 px-auto" >
                        <div class="card card-5" >
                            <div class="card-heading">
                                <h2 class="title">Create Listing</h2>
                            </div>
                            <div class="card-body">
                                <form action="Trade" method="POST" id="submit_form" class="needs-validation " novalidate>
                                    <input type="hidden" name="code" value="postItemD">                                
                                    <div class="form-row"> 
                                        <div class="col-lg-6">
                                            <div class="mt-2 name float-left" for="email">UNCG Email</div>
                                            <div class="value float-right">
                                                <div class="input-group">
                                                    <input name="email" pattern="[a-z0-9._%+-]+@uncg.edu$" type="email" class="input--style-5" id="email" placeholder="Please enter UNCG email" required>
                                                    <div class="valid-feedback">Valid.</div>
                                                    <div class="invalid-feedback">Please enter a UNCG email.</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="name">Category</div>
                                        <div class="value">
                                            <select class="custom-select" id="categoryList" name="categoryId" required
                                                    style="background: #e5e5e5;padding: 0 22px;
                                                    color: #555; border-radius: 5px;">
                                                <option value="">Please Select a Category:</option>
                                                <option value="1">Textbooks</option>
                                                <option value="2">Services</option>
                                                <option value="3">Roommates</option>
                                                <option value="4">Supplies</option>
                                            </select>
                                            <div class="valid-feedback">Valid.</div>
                                            <div class="invalid-feedback">Please Select a Category</div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div for="title" class="name">Item Title</div>
                                        <div class="value">
                                            <div class="input-group">
                                                <input class="input--style-5" type="text" id="title" name="title" placeholder="Title" required>
                                                <div class="valid-feedback">Valid.</div>
                                                <div class="invalid-feedback">Please enter a title.</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div for="description" class="name">Description:</div>
                                        <div class="value">
                                            <div class="input-group">
                                                <textarea class="input--style-5" rows="4" id="description"
                                                          name="description" required="true" style="line-height:25px!important" placeholder="Description"></textarea>
                                                <div class="valid-feedback">Valid.</div>
                                                <div class="invalid-feedback">Please fill out this field.</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="name" for="price">Price</div>
                                        <div class="value">
                                            <div class="input-group">
                                                <input class="input--style-5" id="price" type="number" min="0" step="0.01"
                                                       name="price" placeholder="Price" required="true">
                                                <div class="valid-feedback">Valid.</div>
                                                <div class="invalid-feedback">Please enter a price.</div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="name">Preferred Contact Method</div>
                                        <div class="value">
                                            <select class="custom-select" id="contactMethod" name="contactMethod" required
                                                    onmouseout="numberToggle()" onchange="numberToggle()" 
                                                    style="background: #e5e5e5;padding: 0 22px;
                                                    color: #555; border-radius: 5px;">
                                                <option value="">Choose a Contact Method:</option>
                                                <option value="call">Call</option>
                                                <option value="email">Email</option>
                                            </select>
                                            <div class="valid-feedback">Valid.</div>
                                            <div class="invalid-feedback">Please Select a Preferred Contact Method</div>
                                        </div>
                                    </div>

                                    <div class="form-row" id="phoneNumber">
                                        <div class="name" for="Number">Phone</div>
                                        <div class="value">
                                            <div class="input-group">
                                                <input placeholder="(XXX-XXX-XXXX)" class="" type="tel"
                                                       pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" id="Number" name="phone" required>
                                                <div class="valid-feedback">Valid.</div>
                                                <div class="invalid-feedback">Please fill out this field.</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <button class="btn1 btn1--red" id="submitItem" type="submit">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="login-modal" class="modal fade" role="dialog"
             style=" background-color: rgba(0,0,0,.5);">
            <div class="modal-dialog modal-lg modal-md">
                <div class="modal-content" style="
                     background-image: url('https://uncgspartans.com/images/2018/12/19/JSMNXIQQMSFNACQ.20181219165618.jpg?width=1920&quality=80&format=jpg');
                     background-repeat: no-repeat;
                     background-position:top;
                     background-size:30rem;
                     background-color:#0f1f43 ;
                     opacity: 0.8;
                     ">
                    <div class="modal-header">
                        <span class="icon sidebar-brand-icon" style="opacity: 0;"><img src="assets/img/spartan_nav_icon.png"
                                                                                       alt=""></span>
                        <a class="close" data-dismiss="modal">×</a>
                    </div>
                    <!--Login form-->
                    <form action="Acc" method="post" class="login100-form validate-form" id="loginForm" name="login" role="form">
                        <input type="hidden" name="code" value="SignIn">
                        <div class="modal-body font-weight-bold mt-3" style="padding-top:120px;">
                            <span class="login100-form-title">
                                MEMBER LOGIN
                            </span>

                            <div class="form-group">
                                <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                                    <input type="email" pattern="[a-z0-9._%+-]+@uncg.edu$" class="input100" id="email" name="email"
                                           placeholder="UNCG Email" required>
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please enter a UNCG email</div>
                                    <span class="focus-input100"></span>
                                    <span class="symbol-input100">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                    </span>
                                </div>

                            </div>

                            <div class="form-group">
                                <div class="wrap-input100 validate-input" data-validate="Password is required">
                                    <input type="password" class="input100" id="password" name="password" placeholder="Password"
                                           required>
                                    <span class="focus-input100"></span>
                                    <span class="symbol-input100">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </span>
                                </div>                              
                            </div>
                            <footer class="screen-login">
                                <a href="#" class="" id="toggle-pwd">Forgot password</a>
                            </footer>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default " id="toggle-login" onclick="reset()">Sign Up</button>
                            <button type="submit" class="btn btn-success" id="submit">Login</button>
                        </div>
                    </form>

                    <!--Sign up form-->
                    <form action="Acc" method="post" id="signUpForm" name="signup" action="Acc" method="post">
                        <input type="hidden" name="code" value="SignUp">
                        <div class="modal-body  font-weight-bold mt-3" style="padding-top:120px;">
                            <span class="login100-form-title">
                                SIGN UP
                            </span>

                            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                                <input title="Please enter a UNCG email" type="email" pattern="[a-z0-9._%+-]+@uncg.edu$"
                                       class="input100" id="emailSignUp" name="email" placeholder="Enter UNCG email address"
                                       pattern="[a-z0-9._%+-]+@uncg.edu$" required>
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                </span>
                            </div>

                            <div class="form-group">
                                <div class="wrap-input100 validate-input" data-validate="Password is required">
                                    <input type="password" class="input100" id="pwd1" name="password" placeholder="Password"
                                           title="Password must contain at least 6 characters, including UPPER/lowercase and numbers."
                                           type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
                                    <span class="focus-input100"></span>
                                    <span class="symbol-input100">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="wrap-input100 validate-input" data-validate="Password is required">
                                    <input type="password" class="input100" id="pwd2" name="password" placeholder="Confirm Password"
                                           title="Please enter the same Password as above."
                                           type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
                                    <span class="focus-input100"></span>
                                    <span class="symbol-input100">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" id="toggle-signUp">Go Back To Login</button>
                            <button type="submit" class="btn btn-success" id="submitSignUp">Sign Up</button>
                        </div>
                    </form>

                    <!-- Forgot Password -->
                    <form id="pwdForm" action="Acc" method="post" name="signup" role="form">
                        <input type="hidden" name="code" value="ForgotPassword">

                        <div class="modal-body  font-weight-bold mt-3" style="padding-top:120px;">
                            <span class="login100-form-title">
                                RESET PASSWORD
                            </span>
                            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                                <input type="email" pattern="[a-z0-9._%+-]+@uncg.edu$" class="input100" id="email" name="email"
                                       placeholder="UNCG Email" oninvalid="setCustomValidity('Please enter a UNCG email')"
                                       onchange="try {
                                                   setCustomValidity('');
                                               } catch (e) {
                                               }"  required>
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" id="toggle-login2">Go Back To Login</button>
                            <button type="submit" class="btn btn-success" id="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function reset() {
                document.getElementById('email').value = '';
                document.getElementById('password').value = '';
                document.getElementById('emailSignUp').value = '';
                document.getElementById('passwordSignUp').value = '';
            }
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
        </script>             

        <script src="assets/js/tether.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/tablesorter.min.js"></script>
        <script src="assets/js/toolkit.js"></script>
        <script src="assets/js/application.js"></script>
        <script>
            // execute/clear BS loaders for docs
            $(function () {
                while (window.BS && window.BS.loader && window.BS.loader.length) {
                    (window.BS.loader.pop())()
                }
            })
            $("document").ready(function () {
                $("#signUpForm").hide();
                $("#pwdForm").hide();
            });

            $("#toggle-login").click(function () {
                $("#loginForm").hide().attr("formnovalidate");
                $("#signUpForm").toggle();
            });

            $("#toggle-signUp").click(function () {
                $("#signUpForm").hide().attr("formnovalidate");
                $("#pwdForm").hide().attr("formnovalidate");
                $("#loginForm").toggle();
            });

            $("#toggle-login2").click(function () {
                $("#pwdForm").hide().attr("formnovalidate");
                $("#loginForm").toggle();
            });

            $("#toggle-pwd").click(function () {
                $("#loginForm").hide().attr("formnovalidate");
                $("#pwdForm").toggle();
            });
            $("#signUp").click(function () {
                $('#loginForm').slideUp(function () {
                    $(this).replaceWith(
                            $("<div style='display:none'>new  html to replace with</div>").slideDown()
                            );
                });
            });
        </script>
    </body>
</html>
