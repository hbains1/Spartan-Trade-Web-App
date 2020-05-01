/* 
 * AJAX for submitting an item.
 */
$(document).ready(function () {

    //Submit / edit items
    $("#submit_form").submit(function (e) {
        $("#submitItem").attr("disabled", true);
        $("#submitItem").html("Please wait");
       e.preventDefault();
        
        var formData = new FormData(this);
        $.ajax({
            url: 'Trade',
            type: 'POST',
            data: formData,
            dataType: "json",
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.status === "Redirect") {
                    window.location.replace(data.content);
                }
                if (data.status === "Success") {                    
                    if(data.content !== "No further Actions"){
                        window.location.replace("UploadImage.jsp?itemId=" + data.content);
                    }else{
                        window.location.replace("Search?code=URSR&To=204&page=0");
                    }
                }
                if (data.status === "SuccessDefault") {
                    window.location.replace("ItemConfirmation.html");
                }
                if (data.status === "Failed") {
                    alert(data.content);
                    $("#submitItem").removeAttr("disabled").html("Submit");
                }
            },
            error: function (data) {
                $("#submitItem").html("Check the fields");
                $('#submitItem').attr("disabled", false);
            }
           
        });
    });
    // only image form 
    $("#uploadImageForm").submit(function (e) {
       e.preventDefault();
        
        var formData = new FormData(this);
        $.ajax({
            url: 'uploadImage',
            type: 'POST',
            data: formData,
            dataType: "json",
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.status === "Redirect") {
                    window.location.replace(data.content);
                }
                if (data.status === "Success") {
                    window.location.replace("Search?code=URSR&To=204&page=0");
                }
                if (data.status === "Error") {
                    alert("Error: Images not successfully uploaded " + data.content);
                }
            }
        });
    });

    $("#deleteItem").click(function (event) {
        event.preventDefault();
        $(this.form).ajaxSubmit({
            dataType: "json",
            timeout: (30 * 1000),
            error: function (data) {
                alert("Please check all fields.");
                setTimeout(function () {
                }, 1500);
            },
            success: function (data) {
                if (data.status === "Redirect") {
                    window.location.replace(data.content);
                }
                if (data.status === "Success") {
                    window.location.replace("ItemDelete.html");
                }
                if (data.status === "Failed") {
                    alert(data.content);
                }

            }
        });
    });
});