<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Ajax form Example</title>
</head>
<body>

<h1>Registration Form</h1>

<form id='ajaxform' name='ajaxform' action='ajaxformexample' method='post'>
    <table cellpadding="3pt">
        <tr>
            <td>User Name :</td>
            <td><input type="text" name="userName" size="30" required/></td>
        </tr>
        <tr>
            <td>Password :</td>
            <td><input type="password" name="password1" size="30" required/></td>
        </tr>

        <tr>
            <td>Confirm Password :</td>
            <td><input type="password" name="password2" size="30" required/></td>
        </tr>
        <tr>
            <td>email :</td>
            <td><input type="text" name="email" size="30" required/></td>
        </tr>
        <tr>
            <td>Phone :</td>
            <td><input type="text" name="phone" size="30" required/></td>
        </tr>
        <tr>
            <td>City :</td>
            <td><input type="text" name="city" size="30" required/></td>
        </tr>
    </table>
    <input type="submit" value="Register" id="submitting" />
    <input type="reset" id="reseting" value="Reset" onclick="clearing()">

    <div id="content"></div>
</form>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="Js/closing.js"></script>
<script type="text/javascript">

    var form = $('#ajaxform');
    form.submit(function () {

        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function (data) {
                var result = data;
                $('#content').html(result);

            }
        });

        return false;
    });

    $(document).ready(function () {
        $("#reseting").click(function () {
            $("#content").hide();
        });
        $("#submitting").click(function () {
            $("#content").show();
        });
    });

    $("#submitting").click(function(){
        window.location.href="/hello.jsp";
    })

</script>
<p>
    <% response.setIntHeader("Refresh", 2000); %>
    Todays date:<%=  new java.util.Date() %>

</p>
</body>
</html>