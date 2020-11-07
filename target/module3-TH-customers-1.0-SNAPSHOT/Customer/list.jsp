<%--
  Created by IntelliJ IDEA.
  User: xxtyo
  Date: 11/1/2020
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .main{
            margin: 5px;
background-color: black;
        }

        div.gallery {
            border: 3px solid cornflowerblue;
        }

        div.gallery:hover {
            background-color: royalblue;
            border: 1px solid #777;
        }

        div.gallery img {
            width: 100%;
            height: auto;
        }

        div.desc {
            padding: 15px;
            text-align: center;
        }

        * {
            box-sizing: border-box;
        }

        .responsive {
            padding: 0 6px;
            float: left;
            width: 24.99999%;
        }

        @media only screen and (max-width: 600px){
            .responsive {
                width: 49.99999%;
                margin: 6px 0;
            }
        }

        @media only screen and (max-width: 500px){
            .responsive {
                background-color: royalblue;
                width: 100%;
            }
        }

        .clearfix:after {
            content: "";
            display: table;
            clear: both;
        }
    </style>
    <title>Customer List</title>
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
</head>
<body>
<center>
    <h1>Customers</h1>
    <p>
        <a href="/customers?action=create" class="btn btn-success">Create new customer</a>
    </p>
    <table cellpadding="10px">

        <c:forEach items='${requestScope["customers"]}' var="customer">
<%--            <tr>--%>
<%--                <th><a href="/customers?action=view&id=${customer.getId()}">${customer.getName()}</a></th>--%>
<%--                <td>${customer.getEmail()}</td>--%>
<%--                <td>${customer.getAddress()}</td>--%>
<%--                <td>--%>
            <div class="main" >
                <div class="responsive">
                    <div class="gallery">
                        <a  target="_blank" href="/customers?action=view&id=${customer.getId()}"><img src="${customer.getImage()}" width="500" height="600"></a>
                        <div class="desc">${customer.getName()}</div>
                        <div class="desc"><a href="/customers?action=edit&id=${customer.getId()}" class="btn btn-secondary">EDIT</a></div>
                        <div class="desc"><a href="/customers?action=delete&id=${customer.getId()}" class="btn btn-danger">DELETE</a></div>

                    </div>
                </div>
            </div>
<%--                </td>--%>
<%--                <td><a href="/customers?action=view&id=${customer.getId()}"><img src="${customer.getImage()}" alt="Image" width="100px" height="100px"></a></td>--%>
<%--                <th><a href="/customers?action=edit&id=${customer.getId()}" class="btn btn-secondary">EDIT</a></th>--%>
<%--                <th><a href="/customers?action=delete&id=${customer.getId()}" class="btn btn-danger">DELETE</a></th>--%>
<%--            </tr>--%>
        </c:forEach>
    </table>
</center>
</body>
<style>
    body {
        font-family: Arial;
        font-size: larger;
    }
    th {
        font-weight: bold;
    }
</style>
</html>