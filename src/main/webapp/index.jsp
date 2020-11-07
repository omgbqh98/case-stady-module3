<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/25/2020
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <style>
        .message{
            color: #bd081c;
            float: none;
        }
        body{
            font-family: Arial;
        }

        #menu{
             margin-right: 20px;
            height: 30px;
            padding:0;
            /*margin:0;*/
            background-color: #000000;
            border: 1px solid #CDCDCD;
        }

        #menu ul, #menu li{
            padding:0;
            margin:0;
        }

        #menu li{
            position: relative;
            float: left;
            list-style: none;
            margin: 0;
            padding:0;
        }

        #menu li a{
            width:100px;
            height: 30px;
            display: block;
            text-decoration:none;
            text-align: center;
            line-height: 30px;
            background-color: black;
            color: white;
        }

        #menu ul ul li a{
            width: 200px;
            text-align: left;
            padding-left: 10px;
        }

        #menu li a:hover{
            background-color: red;
        }

        #menu ul ul{
            position: absolute;
            top: 30px;
            left: 15px;
            visibility: hidden;
        }

        #menu ul li:hover ul{
            visibility: visible;
        }
        #xinchao{
            margin-left: 100px;
            color: white;
            font-size: 30px;
        }
        #top{
        /*position: fixed;*/
        /*    width: 100%;*/
        }
    </style>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" id="top">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <i class="fad fa-rocket-launch"></i>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="/index.jsp"><h1 style="font-family: monospace">వీడియో</h1></a>
        </li >
        <li class="nav-item active" id="xinchao">
            Hello
            <a href="">
            <%
                User user = (User) session.getAttribute("user");
                if(user!=null){
                    out.println(user.getName());
                }%>
            </a>
        </li>
    </ul>



    <button type="button" class="btn btn-outline-secondary" style="margin-right: 30px" data-toggle="modal"
            data-target="#exampleModal">
        Login Admin
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: red;">Đăng nhập chỉ dành cho quản
                        trị viên trang web</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form  action="/users" method="post">
                        <label>Tài khoản</label>
                        <input type="text" class="form-control" name="username" placeholder="account">
                        <label>Mật khẩu</label>
                        <input type="text" class="form-control" name="pass" placeholder="passwords">
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Đăng nhập</button>
                        </div>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <div id="menu">
        <ul>

            <li><a href="#">login user</a>
                <ul>
                    <li><a href="/user/dangnhap.jsp">Login</a></li>
                    <li><a href="/user/dangky.jsp">New Account</a></li>
                    <li><a href="/logout">Log Out</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <form class="form-inline my-2 my-lg-0" action="/cars?action=search" method="post">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
        <button type="submit" class="btn btn-outline-secondary">TÌM KIẾM</button>
    </form>
</nav>
<div>
    <div class="container">
<%--        <p style="margin-top: 50px">SẢN PHẨM <i style="color: red">V&T SHOWROOM</i></p>--%>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span> <br>
        </c:if>
        <h1>Các phiên bản xe</h1>
        <hr>
        <div class="row">
            <c:forEach var="car" items="${carlist}">
                <div class="col-md-6 col-lg-4" style="margin-bottom: 0px">
                    <div class="single_service">
                        <div class="thumb">

                            <div><img src="<c:out value="${car.carImg}"/>" style="width: 100%" ; height="200px"></div>
                        </div>
                        <div class="service_infor">
                            <p>Tên xe: <c:out value="${car.carName}"/></p>
                            <p>Giá tiền: <c:out value="${car.carPrice}"/></p>
                            <p>Mô tả: <c:out value="${car.description}"/></p>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModalUpdate${car.id}">ĐĂNG KÍ LÁI THỬ</button>
                                    <div class="modal fade" id="exampleModalUpdate${car.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <div class="container">
                                                        <form action="/cars?action=bookcar" method="post">
                                                            <div class="form-group">
                                                                <label>Nhập họ và tên:</label>
                                                                <input type="text" class="form-control" name="customer_name">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Nhập số điện thoại:</label>
                                                                <input type="text" class="form-control" name="customer_phone">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Nhập địa chỉ email:</label>
                                                                <input type="text" class="form-control" name="customer_email" placeholder="@abc.com">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Nhập thời gian đặt lịch lái xe (theo định dạng yyyy-mm-dd):</label>
                                                                <input type="text" class="form-control" name="time" placeholder="yyyy-mm-dd">
                                                            </div>
                                                            <div hidden class="form-group"><input type="text" name="id" value="${car.id}" ></div>
                                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
</div>
<footer>
    <hr>
    <div class="footer-copyright text-center py-3">© 2020 Copyright:
        <a href="#"> T&V Car</a>
        HOTLINE:<a href="$">0999.686.868</a>
    </div>
</footer>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</html>