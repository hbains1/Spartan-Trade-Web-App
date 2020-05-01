<%@page import="Object.STList_ITEM"%>
<%@page import="Object.STList_ITEM.Image"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">

        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
        <script src="assets/js/HomepageForm.js"></script>
        <%
            STList_ITEM item = (STList_ITEM) request.getAttribute("ItemDetail");
        %>
        <title><%= item.getTitle()%></title>

        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            .mySlides {
                display: none;
            }

            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }

            .image_list li {
                display: -webkit-box;
                display: -moz-box;
                display: -ms-flexbox;
                display: -webkit-flex;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 165px;
                border: solid 5px #ffb71b;
                box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 15px;
                cursor: pointer;
                padding: 15px;
                -webkit-transition: all 200ms ease;
                -moz-transition: all 200ms ease;
                -ms-transition: all 200ms ease;
                -o-transition: all 200ms ease;
                transition: all 200ms ease;
                overflow: hidden
            }

            .image_list li:last-child {
                margin-bottom: 0
            }

            .image_list li:hover {
                box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.3)
            }

            .image_list li img {
                max-width: 100%
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
                            <h6 class="dashhead-subtitle">Item Page</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Item Information
                            </h2>
                        </div>
                    </div>

                    <div class="hr-divider mt-3">
                        <h3 class="hr-divider-content hr-divider-heading"></h3>
                    </div>
                    <main class="mt-5">
                        <div class=" dark-grey-text">
                            <!--Grid row-->
                            <div class="row wow fadeIn">
                                <!--Grid column-->
                                <div class="col-md-6 mb-4 w3-content w3-display-container">
                                    <%                                        List<Image> images = item.getImages();
                                        if (!images.isEmpty()) {
                                            for (Image img : images) {
                                    %>
                                    <img class="mySlides w3-image" src="/images/<%= img.getFileName()%>" alt="">
                                    <%
                                        }
                                    } else {
                                    %> 
                                    <img class="mySlides w3-image" src="assets/img/icon_placeholder2.png" alt="">
                                    <%
                                        }
                                    %>
                                    <button class="w3-button w3-black w3-display-left"
                                            onclick="plusDivs(-1)">&#10094;</button>
                                    <button class="w3-button w3-black w3-display-right"
                                            onclick="plusDivs(1)">&#10095;</button>
                                </div>
                                <!--Grid column-->
                                <%
                                    String[] top5 = {"Textbooks", "Services", "Roommates", "Supplies"};
                                %>
                                <div class="col-md-6 mb-4">
                                    <!--Content-->
                                    <div class="p-1">
                                        <div class="mb-3">
                                            <a href="">
                                                <span class=" badge-info badge mr-1"><%=top5[item.getCategoryId() - 1]%></span>
                                            </a>
                                            <a href="">
                                                <span class="badge-success badge mr-1">New</span>
                                            </a>
                                            <a href="">
                                                <span class="badge-primary badge mr-1">Deal</span>
                                            </a>
                                        </div>
                                        <p class="lead ">
                                        <h1 class="text-shadow mb-3 text-primary "><%= item.getTitle()%></h1>
                                        <div class="badge-danger badge badge-pill lead font-weight-bolder ">$<%= item.getPrice()%></div>
                                        </p>
                                        <p class="lead">
                                        <h3 class=" font-weight-bold text-info">Description</h3>
                                        </p>
                                        <p class="text-secondary font-weight-light"><%= item.getDescription()%></p>
                                        <%
                                            // Check which contact method user selected.
                                            String contactMethod = item.getEmail();
                                            try {
                                                if (item.getContactMethod().equals("call")) {
                                                    contactMethod = item.getPhone();
                                                }
                                            } catch (Exception e) {
                                                System.out.println("No contact method selected.");
                                                contactMethod = item.getEmail();
                                            }
                                        %>
                                        <button class="btn btn-primary btn-md" data-toggle="popover" title="How to buy?"
                                                data-content="Contact Seller at <%=contactMethod%>">Interested in buying me?
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row d-flex justify-content-center wow fadeIn">
                                <div class="col-md-6 text-center">
                                    <h4 class="my-4 h4 text-info">Seller Information</h4>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="col-md-12">
                                                <tbody>
                                                    <tr class="row mt-10">
                                                        <td class="col-md-4"><span class="p_specification">Contact Method:
                                                            </span> </td>
                                                        <td class="col-md-8">
                                                            <ul>
                                                                <li><a href=""></a><%= item.getContactMethod()%></a></li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                    <tr class="row mt-10">
                                                        <td class="col-md-4"><span class="p_specification">Updated Date:
                                                            </span>
                                                        </td>
                                                        <td class="col-md-8">
                                                            <ul>
                                                                <li><%= item.getUpdatedDate()%></li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
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

                                               function validation() {
                                                   var inputEmailLogin, inputPasswordLogin, inputEmailSignUp, inputPasswordSignUp, responseEmail = "";
                                                   var submitButton = document.getElementById("submitLogin");
                                                   var submitSignUp = document.getElementById("submitSignUp");

                                                   // Check input email against this pattern.
                                                   var pattern = new RegExp("[a-z0-9._%+-]+@uncg.edu$");
                                                   inputEmailLogin = document.getElementById("email").value;
                                                   inputPasswordLogin = document.getElementById("password").value;
                                                   inputEmailSignUp = document.getElementById("emailSignUp").value;
                                                   inputPasswordSignUp = document.getElementById("passwordSignUp").value;

                                                   // Login button
                                                   if (pattern.test(inputEmailLogin) && inputPasswordLogin.length > 1) {
                                                       submitButton.disabled = false;
                                                   } else {
                                                       responseEmail = "Please enter a UNCG email";
                                                       submitButton.disabled = true;
                                                   }

                                                   // Sign up button
                                                   if (pattern.test(inputEmailSignUp) && inputPasswordSignUp.length > 1) {
                                                       submitSignUp.disabled = false;
                                                   } else {
                                                       responseEmail = "Please enter a UNCG email";
                                                       submitSignUp.disabled = true;
                                                   }
                                                   document.getElementById("validationResult").innerHTML = responseEmail;
                                               }


                                               $(document).ready(function () {
                                                   $('[data-toggle="popover"]').popover();
                                               });

                                               var slideIndex = 1;
                                               showDivs(slideIndex);

                                               function plusDivs(n) {
                                                   showDivs(slideIndex += n);
                                               }

                                               function showDivs(n) {
                                                   var i;
                                                   var x = document.getElementsByClassName("mySlides");
                                                   if (n > x.length) {
                                                       slideIndex = 1
                                                   }
                                                   if (n < 1) {
                                                       slideIndex = x.length
                                                   }
                                                   for (i = 0; i < x.length; i++) {
                                                       x[i].style.display = "none";
                                                   }
                                                   x[slideIndex - 1].style.display = "block";
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