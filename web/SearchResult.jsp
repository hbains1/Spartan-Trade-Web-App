<!DOCTYPE html>
<%@page import="Object.STList_SR"%>
<%@page import="Object.STPagination"%>
<%@page import="Object.STList_ITEM.Image"%>
<%@page import="java.util.List"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">

        <title>
            Category &middot;
        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/w3school-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">

        <%
            STPagination SearchResult = (STPagination) request.getAttribute("SearchResult");
        %>
        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }
            #itemPlaceholder {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.20);
                border-radius:14px;
                background-image: url('assets/img/icon_placeholder.png');
                border: 5px solid #ffb71b;
                background-repeat: no-repeat;
                background-position: center;
            }
            #itemImage {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.20);
                border-radius:14px;
                background-position: center;
                background-size:cover;
            }
            .description{
                max-width: max-content;
                max-height:50px; overflow: hidden;
                text-overflow: ellipsis;
            }
            .description1{
                flex-wrap: nowrap;
                font-size: 19px !important;
                max-height:65px;  overflow: hidden; 
                text-overflow: ellipsis;
                    }

        </style>
    </head>

    <body>
        <div class="with-iconav">
            <div class="container">
                <div class="row">
                    <%@ include file="SideBar.jspf"%>
                    <div class="col-md-9 content">
                        <div class="container">
                            <div class="dashhead">
                                <div class="dashhead-titles">
                                    <h6 class="dashhead-subtitle">Dashboards</h6>
                                    <h3 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Category</h3>
                                </div>
                            </div>
                            <ul class="nav nav-bordered mt-4 mt-md-2 mb-0 clearfix" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a href="#thumb" class="nav-link active" role="tab" data-toggle="tab" aria-controls="thumb">List View</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a href="#gallery" class="nav-link" role="tab" data-toggle="tab" aria-controls="gallery">Gallery View</a>
                                </li>
                            </ul>
                            <hr class="mt-0 mb-5">
                            <!-- Gallery View -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane " id="gallery">
                                    <div class="row ex-graphs text-center mb-5">

                                        <%                                            int totalP = SearchResult.getTotalPages() - 1;
                                            STList_SR s = null;
                                            for (Object o : SearchResult.getContent()) {
                                                STList_SR sr = (STList_SR) o;
                                                s = (STList_SR) o;
                                        %>
                                        <div class="col-sm-4  m-b-md">
                                            <div class="w-lg m-x-auto">
                                                <%
                                                    List<String> images = sr.getImageFiles();
                                                    if (!images.isEmpty()) {
                                                %>
                                                <div id="itemImage"  class="ex-graph"  
                                                     style="background-image:url('/images/<%=images.get(0)%>'); width:150px; height: 150px;  "></div>

                                                <%
                                                } else {
                                                %>
                                                <div id="itemPlaceholder" class="ex-graph"  style="width: 150px; height: 150px;"></div>                                                
                                                <%
                                                    }
                                                %>
                                            </div>
                                            <span><small class="badge badge-danger badge-pill">$<%=sr.getPrice()%></small></span>
                                            <h3 data-toggle="tooltip" data-placement="bottom" class="mb-5 text-shadow description1"><a href="Search?code=STitem&itemid=<%=sr.getItemId()%>&To=203"><%=sr.getTitle()%></a></h3>
                                        </div>

                                        <%
                                            }
                                        %>

                                    </div>
                                </div>
                                <!--List View-->
                                <div role="tabpanel" class="tab-pane active" id="thumb">
                                    <div class="row statcards">
                                        <%
                                            int totalPages = SearchResult.getTotalPages() - 1;
                                            STList_SR x = null;
                                            for (Object o : SearchResult.getContent()) {
                                                STList_SR sr = (STList_SR) o;
                                                x = (STList_SR) o;
                                        %>
                                        <!-- Image -->
                                        <div class="col-lg-12 mb-md-3">
                                            <div class="w-lg m-x-auto" >
                                                <%
                                                    List<String> images = sr.getImageFiles();
                                                    if (!images.isEmpty()) {
                                                %>
                                                <div id="itemImage"  class="ex-graph float-left m-2 mr-4"  
                                                     style="background-image:url('/images/<%=images.get(0)%>'); width:150px; height: 150px;  "></div>

                                                <%
                                                } else {
                                                %>
                                                <div id="itemPlaceholder" class="ex-graph float-left m-2 mr-4"  style="width: 150px; height: 150px;"></div>                                                
                                                <%
                                                    }
                                                %>
                                            </div>
                                            <div class="m-0">
                                                <h2 class=" text-shadow"><%=sr.getTitle()%></h2>
                                                <span><small class="badge badge-danger badge-pill">$<%= sr.getPrice()%></small></span>
                                                <p class=" mt-3 text-muted description"  data-toggle="tooltip" data-placement="bottom" title="<%= sr.getDescription()%>"><%= sr.getDescription()%></p>
                                                <a href="Search?code=STitem&itemid=<%=sr.getItemId()%>&To=203" class="badge badge-primary">See Details</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 mb-md-4 hr-divider"></div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <!-- Pagination for the category page.-->
                                <div class="d-flex justify-content-center">
                                    <nav>
                                        <ul class="pagination">  
                                            <li class="page-item active"><a class="page-link" href="Search?code=STSR&category=<%= x.getCategoryId()%>&page=0&To=202">First</a></li>
                                                <%
                                                    int currentPage = SearchResult.getCurrentPage();
                                                    for (int i = currentPage - 1; i < currentPage + 2; i++) {
                                                        if (i > -1 && i <= totalPages) {
                                                %>
                                            <li class="page-item active"><a class="page-link" href="Search?code=STSR&category=<%= x.getCategoryId()%>&page=<%= i%>&To=202"> <%= i + 1%> </a></li>
                                                <%
                                                        }
                                                    }
                                                %>           
                                            <li class="page-item active"><a class="page-link" href="Search?code=STSR&category=<%= x.getCategoryId()%>&page=<%= totalPages%>&To=202">Last</a></li>
                                        </ul>
                                    </nav>
                                </div>
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