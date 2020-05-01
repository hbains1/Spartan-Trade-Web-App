/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//https://www.youtube.com/watch?v=z5SFVYgoXiw


$(document).ready(function () {
    var pageNum = 0;
    var pageSize = 12;

    pageUpdate(pageNum, pageSize);


    // Need to add page limiter here.
    $(".next-btn").on("click", function () {
        pageNum++;

        console.log("page = " + pageNum);

        pageUpdate();
    });

    $(".prev-btn").on("click", function () {
        if (pageNum > 0) {
            pageNum--;
            pageUpdate();
        }
        console.log("page = " + pageNum);

    });


    function pageUpdate(pageNum, pageSize) {
        $.ajax({
            url: "http://ec2-3-93-23-132.compute-1.amazonaws.com:8080/items/category/4?pageNo=" + pageNum + "&pageSize=" + pageSize,
            type: "GET",
            data: {pageNum: pageNum, pageSize: pageSize
            },
            success: function (result) {
                console.log(result);

                var html = "";
                for (var i = 0; i < result.length; i++) {

                    html += "<div>" + "<h4>Title: " + result[i].title + "<h4>" + "</div>";
                    html += "<div>" + "<h4>Item ID: " + result[i].itemId + "<h4>" + "</div>";
                    html += "<div>" + "<h4>Last Updated: " + result[i].updatedDate + "<h4>" + "</div>";
                }
                $("#paginationResult").html(html);
            },
            error: function () {
                alert("Error");
            }
        });
    }
});