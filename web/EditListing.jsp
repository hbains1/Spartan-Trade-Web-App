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
            Edit Listing &middot; 
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="assets/js/Trade.js"></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/W3schools-edited.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="Object.STList_ITEM"%>
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
        <%
            request.getSession();
            STList_ITEM item = (STList_ITEM) request.getAttribute("SearchResult");
        %>
        <div class="container">
            <div class="row">
                <%@ include file="SideBar.jspf"%>
                <div class="col-md-9 content ">
                    <div class="dashhead">
                        <div class="dashhead-titles">
                            <h6 class="dashhead-subtitle">Update</h6>
                            <h2 class="dashhead-title" style="color: #ffb71b; font-weight: 500;">Update Listing
                            </h2>
                        </div>
                    </div>
                    <hr class="m-t">
                    <div class="pt-1 ml-1 px-auto" >
                        <div class="card card-5" >
                            <div class="card-heading">
                                <h2 class="title">Update Listing</h2>
                            </div>
                            <div class="card-body">
                                <form action="Trade" method="POST" id="submit_form" class="needs-validation " novalidate>
                                    <input type="hidden" name="code" value="updateItemU">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId()%>">
                                    <input type="hidden" name="validationId" value="<%= item.getValidationId()%>">
                                    <input type="hidden" name="status" value="<%= item.getStatus()%>">
                                    <input type="hidden" name="userId" value="<%= item.getUserId()%>">
                                    <input type="hidden" name="email" value="<%= item.getEmail()%>">
                                    <div class="form-row"> 
                                        <div class="col-lg-6">
                                            <div class="mt-2 name float-left" for="email">UNCG Email</div>
                                            <div class="value float-right">
                                                <div class="input-group">
                                                    <p readonly class="form-control-plaintext text-success ml-3"><%= item.getEmail()%></p>
                                                    <div class="valid-feedback">Valid.</div>
                                                    <div class="invalid-feedback">Please enter a UNCG Email.</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                                    
                                    <div hidden id="category1"><%=item.getCategoryId()%></div>
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
                                                <input class="input--style-5" type="text" id="title" name="title" value="<%= item.getTitle()%>" required>
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
                                                          name="description" required="true" style="line-height:25px!important"><%=item.getDescription()%></textarea>
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
                                                       name="price" value="<%= item.getPrice()%>" required="true">
                                                <div class="valid-feedback">Valid.</div>
                                                <div class="invalid-feedback">Please enter a price.</div>
                                            </div>

                                        </div>
                                    </div>

                                    <p hidden id="contact1"><%= item.getContactMethod()%></p>
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
                                                       pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" id="Number" name="phone" value="<%= item.getPhone()%>" required>
                                                <div class="valid-feedback">Valid.</div>
                                                <div class="invalid-feedback">Please fill out this field.</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <button class="btn1 btn1--red" id="submitItem" type="submit">Submit Changes</button>
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



                                                        $(document).ready(function ($) {
                                                            var contactMethod = document.getElementById('contact1').innerHTML;
                                                            var contactMethodOption = document.getElementById('contactMethod');
                                                            var user_info = document.getElementById("phoneNumber");
                                                            user_info.style.display = "none";
                                                            contactMethodOption.value = contactMethod;
                                                            if (contactMethod === "call") {
                                                                user_info.style.display = "block";
                                                            } else {

                                                                user_info.style.display = "none";
                                                            }
                                                            ;

                                                            var category = document.getElementById('category1').innerHTML;
                                                            var categoryOption = document.getElementById('categoryList');
                                                            categoryOption.value = category;
                                                        });
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

                                                        // execute/clear BS loaders for docs
                                                        $(function () {
                                                            while (window.BS && window.BS.loader && window.BS.loader.length) {
                                                                (window.BS.loader.pop())()
                                                            }
                                                        })

                                                        const selectElement = document.querySelector('.categoryoption');

                                                        selectElement.addEventListener('change', (event) => {
                                                            const result = document.querySelector('.result');
                                                            result.textContent = `You like ${event.target.value}`;
                                                        });

                                                        document.getElementById("call").click = function () {
                                                            alert("fsadfas");
                                                            document.getElementById("callInput").display = "inline";
                                                        }




        </script>
    </body>
</html>

