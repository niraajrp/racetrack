<%--
  Created by IntelliJ IDEA.
  User: Dells
  Date: 11/13/2017
  Time: 12:15 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    %{--<meta name="layout" content="main" />--}%
    <title>Search for Races</title>

</head>

<body>
<div class="nav">
    <g:render template="/adminmenubar" />
</div>
<div class="body" align="center">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
<h1>Search for Races</h1>
<g:form action="search" method="post">
    <div class="dialog" align="center">
        <table>
            <tr class='prop'>
                <td valign='top' class='name'>
                    <label for='city'>City:</label>
                </td>
                <td valign='top' class='value'>
                    <input type="text" maxlength='30' name='city'>
                </input>
                </td>

                <td valign='top' class='name'>
                    <label for='name'>Race Name:</label>
                </td>
                <td valign='top' class='value'>
                    <input type="text" maxlength='10' name='name'>
                </input>
                </td>

            </tr>
        </table>
    </div>
    <br>
    <div class="buttons" align="center">
    <input type="submit" value="Search" class="formbutton"></input>
    </div>
</g:form>
</body>
</html>