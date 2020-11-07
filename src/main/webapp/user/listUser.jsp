
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06/11/2020
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>

<h2>LIST USERS</h2>
<form action="/search">
    <input name="search" type="text" placeholder="search name">
    <input type="submit" value="search">
</form>
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Username</th>
        <th>Password</th>
<%--        <th>Edit</th>--%>
        <th>Delete</th>
    </tr>

<c:forEach items='${requestScope["listUser"]}' var="user">
    <tr>
        <td><c:out value="${user.id}"/></td>
        <td><a href="/users?action=view&id=${user.getId()}">${user.getName()}</a></td>
        <td><c:out value="${user.userName}"/></td>
        <td><c:out value="${user.pass}"/></td>
        <td>
<%--            <a href="/users?action=edit&id=${user.id}">Edit</a>--%>
            <a href="/users?action=delete&id=${user.id}">Delete</a>
        </td>
    </tr>
</c:forEach>

</table>

</body>
</html>
