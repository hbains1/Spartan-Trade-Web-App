/* 
 * AJAX for displaying the last 5 items in each category.
 */

// This will refresh the last 5 items posted every 15 seconds.
$(document).ready(function () {
    function jump(count) {
        window.setTimeout(function () {
            if (count > 0) {
                count--;
                jump(count);
            } else {
                refresh();
                jump(15);
            }
        }, 1000);
    }
    refresh();
    jump(15);
});

// This will return the last 5 items for each category.
function refresh() {
    $.ajax({url: "Search?code=STPV", success: function (result) {
            var arr = JSON.parse(result).content;
            var arr = JSON.parse(arr);

            for (var i = 1; i < 21; i++) {
                $("#title_" + i).html(arr[i-1].title);
                $("#link_" + i).attr("href", "Search?code=STitem&itemid=" + arr[i-1].itemId + "&To=203");


            }
        }});
}