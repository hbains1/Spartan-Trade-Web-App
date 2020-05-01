<%@page import="Object.STList_SR"%>
<%@page import="Object.STList_ITEM"%>
<%@page import="Object.STPagination"%>
<%@page import="Control.Account.Account"%>
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
            Listing History &middot; 
        </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>       
        <script src="assets/js/Trade.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@600&family=Lexend+Giga&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/css/toolkit-inverse.css" rel="stylesheet">
        <link href="assets/css/application.css" rel="stylesheet">

        <%
            Account accCheck = new Account(config, request, response);
            if (!accCheck.checkIsSignIn()) {
                response.sendRedirect("Home.jsp");
            }

            STPagination SearchResult = (STPagination) request.getAttribute("SearchResult");
        %>
        <style>
            /* note: this is a hack for ios iframe for bootstrap themes shopify page */
            /* this chunk of css is not part of the toolkit :) */
            #post {
                display: none;
            }
            /* below code comes from 
            https://www.tutorialrepublic.com/snippets/preview.php?topic=bootstrap&file=crud-data-table-for-database-with-modal-form
            
            /* table style */
            table.table tr th,
            table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }

            table.table tr th:first-child {

            }

            table.table tr th:last-child {
                width: 100px;
            }

            table.table-striped tbody tr:nth-of-type(odd) {
                background-color:#243a6b;
            }

            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }

            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }

            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }

            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }

            table.table td a:hover {
                color: #2196F3;
            }

            table.table td a.edit {
                color: #FFC107;
            }

            table.table td a.delete {
                color: #F44336;
            }

            table.table td i {
                font-size: 19px;
            }

            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
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
                            <h6 class="dashhead-subtitle">Listings</h6>
                            <h2 class="dashhead-title mb-3" style="color: #ffb71b; font-weight: 500;">Listing history</h2>
                        </div>
                    </div>
                    <hr class="m-t">
                    <div class="flextable table-actions">
                        <div class="flextable-item">

                        </div>
                        <div class="flextable-item"></div>
                        <div class="flextable-item"></div>
                        <div class="flextable-item"></div>
                        <div class="flextable-item"></div>
                        <div class="flextable-item"></div>
                    </div>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr class="text-primary">
                                <th>Title</th>
                                <th>Description</th>
                                <th>Updated Date</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                            int totalPages = SearchResult.getTotalPages() - 1;
                                STList_ITEM x = null;
                                for (Object o : SearchResult.getContent()) {
                                    STList_ITEM sr = (STList_ITEM) o;
                                    x = (STList_ITEM) o;
                            %>

                            <tr>
                                <td class="text-secondary"><%= sr.getTitle()%></td>
                                <td class="text-info"><%= sr.getDescription()%></td>
                                <td class="text-success"><%= sr.getUpdatedDate()%></td>
                                <td class="text-danger"><%= sr.getPrice()%></td>
                                <td>
                                    <a href="Search?code=URitem&itemID=<%=sr.getItemId()%>&To=206" class="edit" ><i class="material-icons"
                                                                                                                    data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="#deleteOrder<%=sr.getItemId()%>" class="delete" data-toggle="modal"><i class="material-icons"
                                                                                                                    data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>

                        <div id="deleteOrder<%=sr.getItemId()%>" class="modal fade">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <form action="Trade" method="post" id="delete_form">
                                        <input type="hidden" name="code" value="deleteItemU">
                                        <input type="hidden" name="itemId" value="<%=sr.getItemId()%>">
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Delete Listing</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">					
                                            <p>Are you sure you want to delete the following item?</p>
                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                            <div class="text-center">
                                                <p class="text-muted">Item Title: <span class="text-info font-weight-bold"><%=sr.getTitle()%></span></p>
                                                <p class="text-muted">Created Date: <span class="text-info font-weight-bold"><%=sr.getUpdatedDate()%></span></p>
                                                <p class="text-muted">Price: <span class="text-info font-weight-bold"><%=sr.getPrice()%></span></p>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">Cancel</button>
                                            <button type="submit" id="deleteItem" class="btn btn-danger" value="Delete">Delete</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        </tbody>
                    </table>

                    <div class="text-center">
                        <nav>
                            <ul class="pagination">
                                <%
                                    int pages = SearchResult.getTotalPages();
                                    for (int i = 0; i < pages; i++) {
                                %>
                                <li class="page-item active"><a class="page-link" href="Search?code=URSR&To=204&page=<%=i%>"> <%= i + 1%> </a></li>
                                    <%
                                        }
                                    %> 
                                </li>
                            </ul>
                        </nav>
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
        </script>
    </body>
</html>

