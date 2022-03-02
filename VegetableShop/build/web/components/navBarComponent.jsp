<%-- 
    Document   : navBarComponent
    Created on : 28-02-2022, 22:13:00
    Author     : Thiep Ngo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!"><i class="bi bi-shop-window" style="margin-right: 8px"></i>VEGETABLE SHOP</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/ShoppingOnline/home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
            </ul>

            <form action="search" class="d-flex mx-auto" >
                <input class="form-control me-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
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
