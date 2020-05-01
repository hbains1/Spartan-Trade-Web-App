<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">

        <title>
            Spartan Trade &middot; 
        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="assets/js/HmPageUpdate.js"></script>
        <script src="assets/js/HomepageForm.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <script src="assets/js/main.js"></script>
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <%@page import="Control.Account.Account"%>
        <%@page import="Object.STList_ITEM"%>
        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }
            li a {
                white-space: nowrap; 
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: max-content;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Home Page</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">SPARTAN TRADE</h2>
                        </div>
                    </div>

                    <div class="hr-divider mt-3">
                        <h3 class="hr-divider-content hr-divider-heading">Categories</h3>
                        <br>
                    </div>

                    <!-- FOR LISTING VIEW ON HOME PAGE-->
                    <div role="tabpanel" class="tab-pane" id="list">
                        <div class="row">
                            <%                                String[] top5 = {"Textbooks", "Services", "Roommates", "Supplies"};
                                // For loop for the number of categories.
                                for (int i = 0; i < 4; i++) {
                            %>
                            <div class="col-lg-6 mx-auto my-auto ">
                                <div class="single category hvr-grow-shadow">
                                    <h3 class="side-title"><%= top5[i]%></h3>
                                    <%
                                        // Cycle through 5 items in each category.
                                        for (int j = 1; j < 6; j++) {
                                    %>  
                                    <ul class="list-unstyled">
                                        <li><a id="link_<%= i * 5 + j%>" data-toggle="tooltip" data-placement="bottom" ><span id="title_<%= i * 5 + j%>" >Item</span></a></li>
                                            <%
                                                }
                                            %>
                                        <a class="btn btn-sm btn-outline-primary hvr-glow" href="Search?code=STSR&category=<%= i + 1%>&page=0&To=202" title="">See More <%=top5[i]%></a>
                                    </ul>
                                </div>
                            </div> 
                            <br>
                            <%
                                }
                            %>
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
                    <!--Forgot Password--> 
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
 
        <script src="assets/js/tether.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/tablesorter.min.js"></script>
        <script src="assets/js/toolkit.js"></script>
        <script src="assets/js/application.js"></script>
        <script>
            function reset() {
                document.getElementById('email').value = '';
                document.getElementById('password').value = '';
                document.getElementById('emailSignUp').value = '';
                document.getElementById('passwordSignUp').value = '';
            }
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

