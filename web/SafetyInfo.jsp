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
            Safety &middot; 
        </title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap"
              rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/hover.css" rel="stylesheet">
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

    <body>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Safe Meeting Locations at UNCG</h2>
                        </div>
                    </div>

                    <br>
                    <!-- Here is information on safe locations for users to meet. -->
                    <div class="container text-center">
                        <h4 class="text-danger">Safety is our main concern at Spartan Trade. Please only meet at safe,
                            public locations.
                        </h4>
                        <br>
                        <h5>
                            Here are some recommendations:
                        </h5>
                        <div class="hr-divider mt-3">
                            <h3 class="hr-divider-content hr-divider-heading">Jackson Library</h3>
                        </div>
                        <br>
                        <img src="https://upload.wikimedia.org/wikipedia/commons/6/61/UNCG_Jackson_Library.JPG" alt="Jackson Library" width="580" height="350" >
                        <br>
                        <a href="https://library.uncg.edu/" target="_blank">Visit the Jackson Library page.</a>
                        </h5>
                        <br>
                        <div class="hr-divider mt-3">
                            <h3 class="hr-divider-content hr-divider-heading">UNCG Police Department</h3>
                        </div>
                        <br>
                        <img src="https://bloximages.newyork1.vip.townnews.com/greensboro.com/content/tncms/assets/v3/editorial/5/56/5564f0c0-9771-11e4-a102-d71bad6fefd3/54aee26ec043e.image.jpg?resize=1200%2C800" alt="Police Department" width="580" height="350" >
                        <br>
                        <a href="https://police.uncg.edu/" target="_blank">Visit the UNCG Police Department page.</a>
                        </h5>
                        <br>
                        <div class="hr-divider mt-3">
                            <h3 class="hr-divider-content hr-divider-heading">Leonard J. Kaplan Center for Wellness</h3>
                        </div>

                        <br>
                        <img src="https://news.uncg.edu/wp-content/uploads/2018/02/kaplancenter-34324-F.jpg" alt="Kaplan Center" width="580" height="350" >
                        <br>
                        <a href="https://recwell.uncg.edu/kaplan-center/" target="_blank">Visit the Kaplan Center page.</a>
                        </h5>
                    </div>

                    <script src="assets/js/jquery.min.js"></script>
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
                    </script>
                    </body>
                    </html>

