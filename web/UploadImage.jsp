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
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <script src="assets/js/Trade.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
        <title>Upload Image</title>
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
    <body>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content ">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Upload</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Upload Images
                            </h2>
                        </div>
                    </div>
                    <hr class="m-t">
                    <div class="pt-1 ml-1 px-auto" >
                        <div class="card card-5" >
                            <div class="card-heading">
                                <h2 class="title">Upload Images</h2>
                            </div>
                            <div class="card-body">
                                <form id="uploadImageForm" enctype="multipart/form-data" action="uploadImage" method="post">
                                    <input type="hidden" name="itemId" value="<%= request.getParameter("itemId")%>">                                

                                    <button id="addImage" class="btn btn-primary" type="button" onclick="addImage()">Add Image</button>

                                    <!--Used for adding new images to listing.--> 
                                    <div id="newImage"></div>
                                    <br>
                                    <input class="btn1 btn1--red" type="submit" value="Submit"></div>
                                    <a href="Search?code=URSR&To=204&page=0" class="btn btn-primary" role="button">Continue without Images</a>
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

        <!-- Add or delete images when the respective button is clicked. --> 
        <script>
                                        // Add image script
                                        $("#addImage").click(function () {
                                            var html = '';
                                            html += '<br>';
                                            html += '<div id="inputImage" class="input-group mb-3">';
                                            html += '<input type="file" id="imageFile" class="form-control" name="imageFile1" accept=".jpg, .jpeg, .png, .gif, .heic">';
                                            html += '<div class="input-group-append">';
                                            html += '<button id="deleteImage" type="button" class="btn btn-danger" onclick="deleteImage()">Delete Image</button>';
                                            html += '</div>';
                                            html += '</div>';

                                            $('#newImage').append(html);
                                        });

                                        $(document).on('click', '#deleteImage', function () {
                                            $(this).closest('#inputImage').remove();
                                        });
        </script>
    </body>
</html>
