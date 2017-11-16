<%--
  Created by IntelliJ IDEA.
  User: Dells
  Date: 11/13/2017
  Time: 7:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;
charset=UTF-8"/>
<meta name="layout" content="main" />
<title>Log in</title>
</head>
<style>
.body{
    align-items: center;
}
</style>
<body>
<div class="body" style="margin: 5%;padding-top: 5%; margin-top: 10%">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${race}">
        <div class="errors" style="text-align: center">
            <g:renderErrors bean="${user}" as="list" />
        </div>
    </g:hasErrors>
    <g:form controller="user" method="post" style="align-self: center" >
        <div style="text-align: center">
            <h1>Please provide registered Username and Password to Login</h1>
        </div>

        <div class="dialog">
            <table>
                <tr class='prop'>
                    <td valign='top' class='name'>
                        <label for='username'>Username:</label>
                    </td>
                    <td valign='top' class='value '>
                        <input type="text" maxlength='10' name='username' value='${user?.username}'>
                </input>
                </td>
            </tr>
        <tr class='prop'>
            <td valign='top' class='name'>
                <label for='password'>Password:</label>
            </td>
            <td valign='top' class='value '>
                <input type="password" maxlength='10' name='password' value='${user?.password}'>
            </input>
            </td>
        </tr>
        </table>
        <div class="buttons">
            <span class="button">
                <g:actionSubmit value="Log in" />
            </span>
        </div>
    </g:form>
</div>

</div>
</body>
</html>