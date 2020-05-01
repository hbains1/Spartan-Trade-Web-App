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

    // For login form
//    $('#loginForm').validate({
//        rules: {
//            email: {
//                required: true
//            },
//            password: {
//                required: true
//            }
//        },
//        submitHandler: function (form) {
//            $("#submit").click(function (event) {
////                event.preventDefault();
//                $(this.form).ajaxSubmit({
//                    dataType: "json",
//                    timeout: (30 * 1000),
//                    error: function (data) {
//                        alert("Please check all fields.");
//                        setTimeout(function () {
//                            $("#submit").removeAttr("disabled").html("Submit");
//                        }, 1500);
//                    },
//                    success: function (data) {
//                        if (data.status === "Redirect") {
//                            window.location.replace(data.content);
//                        }
//                        if (data.status === "Failed") {
//                            alert(data.content);
//                            $("#submitLogin").removeAttr("disabled").html("Sign Up");
//                        }
//                        if (data.status === "Error") {
//                            alert(data.content + ": Please check email and password.");
//                            $("#submitLogin").removeAttr("disabled").html("Sign Up");
//                        }
//                    }
//                });
//            });
//        }
//    });

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
//                $("#submitLogin").removeAttr("disabled").html("Sign Up");
            }
            if (data.status === "Error") {
                alert("Error " + data.content);
//                $("#submitLogin").removeAttr("disabled").html("Sign Up");
            }
        }
    });
// working wo validation
    // For sign up form
//    $('#signUpForm').validate({
//        rules: {
//            email: {
//                required: true
//            },
//            password: {
//                required: true
//            }
//        },
//        submitHandler: function (form) {
//            $("#submitSignUp").click(function (event) {
////                event.preventDefault();
//                $(this.form).ajaxSubmit({
//                    dataType: "json",
//                    timeout: (30 * 1000),
//                    error: function (data) {
//                        alert("Please check all fields.");
//                        setTimeout(function () {
//                            $("#submitSignUp").removeAttr("disabled").html("Submit");
//                        }, 1500);
//                    },
//                    success: function (data) {
//                        if (data.status === "Redirect") {
//                            window.location.replace(data.content);
//                        }
//                        if (data.status === "Failed") {
//                            alert(data.content);
//                            $("#submitLogin").removeAttr("disabled").html("Sign Up");
//                        }
//                        if (data.status === "Error") {
//                            alert(data.content);
//                            $("#submitLogin").removeAttr("disabled").html("Sign Up");
//                        }
//                    }
//                });
//            });
//        }
//    });


// For deleting an account 
    $("#deleteAccountButton").click(function (event) {
        event.preventDefault();
//        alert("after click");
        $(this.form).ajaxSubmit({
            dataType: "json",
            timeout: (30 * 1000),
//                    beforeSend: function() {
//                      alert("before send");  
//                    },
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

//
//$(document).ready(function () {
//
//    $("#submitLogin").click(function (event) {
//        event.preventDefault();
////      if ($("#SignUpTEST").valid()) {
//        $("#submitLogin").attr("disabled", "disabled").html("Wait...");
//        $(this.form).ajaxSubmit({
//            dataType: "json",
//            timeout: (30 * 1000),
//            error: function (data) {
//                setTimeout(function () {
//                    $("#submitLogin").removeAttr("disabled").html("Sign Up");
//                }, 1500);
//            },
//            success: function (data) {
//
//                if (data.status === "Redirect") {
//                    window.location.replace(data.content);
//                } else if (data.status === "Failed") {
//                    alert(data.content);
//                    $("#submitLogin").removeAttr("disabled").html("Sign Up");
//                } else if (data.status === "Error") {
//                    alert(data.content);
//                    $("#submitLogin").removeAttr("disabled").html("Sign Up");
//                } else {
//                    alert("Incorrect email or password. Please try again.")
//                }
//
//            }
//        });
//    });
//
//    $("#submitSignUp").click(function (event) {
//        event.preventDefault();
////      if ($("#SignUpTEST").valid()) {
//        $("#submitSignUp").attr("disabled", "disabled").html("Wait...");
//        $(this.form).ajaxSubmit({
//            dataType: "json",
//            timeout: (30 * 1000),
//            error: function (data) {
//                setTimeout(function () {
//                    $("#submitSignUp").removeAttr("disabled").html("Sign Up");
//                }, 1500);
//            },
//            success: function (data) {
//
//
//                if (data.status == "Redirect") {
//                    window.location.replace(data.content);
//                } else if (data.status === "Failed") {
//                    alert(data.content);
//                    $("#submitSignUp").removeAttr("disabled").html("Sign Up");
//                } else if (data.status === "Error") {
//                    alert(data.content);
//                    $("#submitSignUp").removeAttr("disabled").html("Sign Up");
//                } else {
//                    alert("Incorrect email or password. Please try again.")
//                }
//
//            }
//        });
//    });
//
//});
