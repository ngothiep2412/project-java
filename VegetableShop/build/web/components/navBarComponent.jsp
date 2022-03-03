<%-- 
    Document   : navBarComponent
    Created on : 28-02-2022, 22:13:00
    Author     : Thiep Ngo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="MainController?action=Home"><i class="bi bi-shop-window" style="margin-right: 8px"></i>VEGETABLE SHOP</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/VegetableShop/MainController?action=Home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
            </ul>
            <c:choose>
                <c:when test="${sessionScope.LOGIN_USER == NULL || sessionScope.LOGIN_USER.roleID == 2}">
                    <form action="MainController" class="d-flex mx-auto" >
                        <input class="form-control me-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
                        <input name="action" value="Search" class="btn btn-outline-success" type="submit">
                        <input name="page" value="1" type="hidden">
                    </form>
                </c:when>
            </c:choose>

            <div class="d-flex my-1">
                <a class="btn btn-outline-dark" href="carts">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.CARTS.size()}</span>
                </a>
            </div>
            <a href="login.jsp">
                <button class="btn btn-outline-info ms-lg-2">Login</button>  
            </a>
        </div>
    </div>
</nav>
