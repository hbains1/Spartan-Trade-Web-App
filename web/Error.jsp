<%@page import="java.util.Map"%>
<!DOCTYPE html>
<!--
Error page.
-->
<html>
    <head>
        <title>Error</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <%
            Map errorResult = (Map) request.getAttribute("Error");
        %>
    </head>
    <body>
        <%@ include file="SideBar.jspf"%>
        <div class="d-flex justify-content-center">
            Error: 
            <%                errorResult.get("message");
            %>
            <a class href="Home.jsp">Please click here to go home.</a>
        </div>
    </body>
</html>
