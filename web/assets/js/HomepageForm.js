/* 
 * AJAX form for Sign Up and Login.
 */

// from https://stackoverflow.com/questions/1960240/jquery-ajax-submit-form
$(document).ready(function () {

//                event.preventDefault();
    $("#loginForm").ajaxForm({
        dataType: "json",
        timeout: (30 * 1000),
        error: function (data) {
            alert("Please check all fields.");
            setTimeout(function () {
                $("#submit").removeAttr("disabled").html("Submit");
            }, 1500);
        },
        success: function (data) {
            if (data.status === "Redirect") {
                window.location.replace(data.content);
            }
            if (data.status === "Failed") {
                alert(data.content);
                $("#submitLogin").removeAttr("disabled").html("Sign Up");
            }
            if (data.status === "Error") {
                alert(data.content + ": Please check email and password.");
                $("#submitLogin").removeAttr("disabled").html("Sign Up");
            }
        }
    });

    $("#signUpForm").ajaxForm({
        dataType: "json",
        timeout: (30 * 1000),
        error: function (data) {
            alert("Please check all fields.");
            setTimeout(function () {
                $("#submit").removeAttr("disabled").html("Submit");
            }, 1500);
        },
        success: function (data) {
            if (data.status === "Redirect") {
                window.location.replace(data.content);
            }
            if (data.status === "Failed") {
                alert(data.content);
                $("#submitLogin").removeAttr("disabled").html("Sign Up");
            }
            if (data.status === "Error") {
                alert(data.content + ": Please check email and password.");
                $("#submitLogin").removeAttr("disabled").html("Sign Up");
            }
        }
    });

    $("#pwdForm").ajaxForm({
        dataType: "json",
        timeout: (30 * 1000),
        error: function (data) {
            alert("Please check all fields.");
            setTimeout(function () {
                $("#submit").removeAttr("disabled").html("Submit");
            }, 1500);
        },
        success: function (data) {
            if (data.status === "Success") {
                alert("Success: " + data.content);
                window.location.replace("Home.jsp");
            }
            if (data.status === "Failed") {
                alert(data.content);
            }
            if (data.status === "Error") {
                alert("Error " + data.content);
            }
        }
    });

// For deleting an account 
    $("#deleteAccountButton").click(function (event) {
        event.preventDefault();
        $(this.form).ajaxSubmit({
            dataType: "json",
            timeout: (30 * 1000),
            error: function (data) {
                setTimeout(function () {
                }, 1500);
            },
            success: function (data) {
                if (data.status === "Redirect") {
                    window.location.replace(data.content);
                }
                if (data.status === "Success") {
                    window.location.replace("AccountDeleted.jsp");
                }
                if (data.status === "Error") {
                    alert(data.content);
                    window.location.replace("Home.jsp");
                }
            }
        });
    });
});