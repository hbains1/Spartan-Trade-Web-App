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
            Main Menu &middot;
        </title>
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/hover.css" rel="stylesheet" media="all">
        <link href="assets/css/application.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="assets/js/HomepageForm.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */

            body {
                width: 1px;
                min-width: 100%;
                *width: 100%;
            }

            canvas:hover {
                background-color: #ffb71b;

            }

            svg {
                width: 120px;
                height: 120px;
                margin-bottom: 5px;

            }

            svg:hover {
                fill: #ffb71b;
                ;
            }

            .modal-header {
                border-bottom: 0 none;
            }

            .modal-footer {
                border-top: 0 none;
            }
            a:hover {
                text-decoration: none;
            }

            #step2,
            #step3 {
                display: none;
            }
        </style>
    </head>

    <body>
        <%  Account accCheck = new Account(config, request, response);
            if (!accCheck.checkIsSignIn()) {
                response.sendRedirect("Home.jsp");
            }
        %>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Dashboards</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Main Menu</h2>
                        </div>
                    </div>

                    <!-- Main Menu Section -->
                    <div class="hr-divider mt-3">
                        <h3 class="hr-divider-content hr-divider-heading">Main Menu</h3>
                    </div>

                    <div class="row text-center mt-5">
                        <div class="col-md-3 mb-4 mb-md-3 p-2">
                            <div class="w-3 mx-auto hvr-float-shadow d-flex justify-content-center">
                                <a href="SubmitByUser.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                                                fill="white" width="18px" height="18px">
                                    <path d="M12 2l-5.5 9h11z" />
                                    <circle cx="17.5" cy="17.5" r="4.5" />
                                    <path d="M3 13.5h8v8H3z" />
                                    <path d="M0 0h24v24H0z" fill="none" /></svg></a>
                            </div>
                            <span class="text-muted text-info ">List An Item</span>
                        </div>

                        <div class="col-md-3 mb-4 mb-md-3 p-2">
                            <div class="w-3 mx-auto hvr-float-shadow d-flex justify-content-center">
                                <a href="Search?code=URSR&To=204&page=0"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                                                              fill="white" width="18px" height="18px">
                                    <path d="M0 0h24v24H0V0z" fill="none" />
                                    <path
                                        d="M11 7h6v2h-6zm0 4h6v2h-6zm0 4h6v2h-6zM7 7h2v2H7zm0 4h2v2H7zm0 4h2v2H7zM20.1 3H3.9c-.5 0-.9.4-.9.9v16.2c0 .4.4.9.9.9h16.2c.4 0 .9-.5.9-.9V3.9c0-.5-.5-.9-.9-.9zM19 19H5V5h14v14z" />
                                    </svg></a>
                            </div>
                            <strong class="text-muted text-info">View Listings</strong>

                        </div>

                        <div class="col-md-3 mb-4 mb-md-3 p-2">
                            <div class="w-3 mx-auto hvr-float-shadow d-flex justify-content-center">
                                <span data-toggle="modal" data-target="#deleteAccount"><svg fill="white"
                                                                                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="18px" height="18px">
                                    <path d="M0 0h24v24H0z" fill="none" />
                                    <path
                                        d="M589.6 240l45.6-45.6c6.3-6.3 6.3-16.5 0-22.8l-22.8-22.8c-6.3-6.3-16.5-6.3-22.8 0L544 194.4l-45.6-45.6c-6.3-6.3-16.5-6.3-22.8 0l-22.8 22.8c-6.3 6.3-6.3 16.5 0 22.8l45.6 45.6-45.6 45.6c-6.3 6.3-6.3 16.5 0 22.8l22.8 22.8c6.3 6.3 16.5 6.3 22.8 0l45.6-45.6 45.6 45.6c6.3 6.3 16.5 6.3 22.8 0l22.8-22.8c6.3-6.3 6.3-16.5 0-22.8L589.6 240zM224 256c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z">
                                    </path>
                                    </svg></span>
                            </div>
                            <strong class="text-muted text-info  "><a data-toggle="modal" data-target="#deleteAccount">Delete
                                    Account</a></strong>
                        </div>
                    </div>

                    <!-- Modal Section -->
                    <div id="deleteAccount" class="modal fade">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <form action="Acc" method="post" id="deleteaccount_form">
                                    <input type="hidden" name="code" value="Delete">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Delete Account</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <p>Are you sure you want to delete your account?</p>
                                        <p class="text-warning"><small>This action cannot be undone.</small></p>                                          
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">Cancel</button>
                                        <button type="submit" id="deleteAccountButton" class="btn btn-danger" value="Delete">Delete</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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

            $("#gotostep2").click(function () {
                $("#step1").hide().attr("formnovalidate");
                $("#step2").toggle();

            });

            $("#gotostep3").click(function () {
                $("#step2").hide().attr("formnovalidate");
                $("#step3").toggle();

            });
        </script>
    </body>
</html>