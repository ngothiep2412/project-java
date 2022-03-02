<%-- 
    Document   : admin
    Created on : 01-03-2022, 19:03:46
    Author     : Thiep Ngo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin Shop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || 1 != (loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("keyword");
            if (search == null) {
                search = "";
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a href="HomeAdminController" style="font-weight: 500" class="navbar-brand" aria-current="page">Home</a>
                <div class="navbar-brand ms-3" style="color: green; font-weight: 350" >  Welcome: ${sessionScope.LOGIN_USER.fullName}</div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" style="font-weight: 700" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Category</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:forEach items="${LIST_CATEGORY}" var="C">
                                    <li><a class="dropdown-item" href="FilterCategoryController?categoryID=${C.categoryID}&roleID=${LOGIN_USER.roleID}">${C.categoryName}</a></li>
                                    </c:forEach>

                            </ul>
                        </li>
                    </ul>

                    <form action="MainController" method="POST" class="d-flex mx-auto" >
                        <input class="form-control me-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
                        <input name="action" value="Search" class="btn btn-outline-success" type="submit">
                    </form>

                    <form action="MainController">
                        <input class="btn btn-outline-info ms-lg-2" type="submit" name="action" value="Add">
                    </form>
                    <form action="MainController">
                        <input class="btn btn-outline-danger ms-lg-2" type="submit" name="action" value="Logout">
                    </form>
                </div>
            </div>
        </nav>

        <section class="py-5">
            <div class="container" style="min-height: 800px">
                <table class="table" >
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Image</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Description</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Category</th>
                            <th scope="col" style="text-align: center; padding-right: 32px">Import Date</th>
                            <th scope="col" style="text-align: center; padding-right: 41px">Using Date</th>
                            <th scope="col"style="text-align: center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test = "${LIST_PRODUCT == null || LIST_PRODUCT.size() == 0}">
                                Not found
                            </c:when>
                            <c:otherwise>
                            <h3>List Products</h3>
                            <c:forEach items="${LIST_PRODUCT}" var="P">
                                <tr>
                                <input type="hidden" name="productID" value="${P.productID}" />
                                <th scope="row">${P.productID}</th>
                                <td><img src="${P.imageUrl}" width="70"/></td>
                                <td>${ P.productName}</td>
                                <td>${P.description}</td>
                                <td>${P.price}</td>
                                <td>${P.quantity}</td>
                                <th scope="col">Category</th>
                                <td>${P.importDate}</td>
                                <td>${P.usingDate}</td>
                                <td>
                                    <a style="width: 100%" href="UpdateProductController?productID=$" class="btn btn-outline-danger mb-2"><i class="bi bi-box-arrow-in-down"></i> Update</a>
                                    <a style="width: 100%" href="DeleteProductController?productID=${P.productID}" class="btn btn-outline-danger"><i class="bi bi-trash"></i> Delete</a></td>                           
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item ${PAGE - 1 < 1 ? "disabled":""}">
                            <a class="page-link" href="HomeAdminController?page=${PAGE - 1}" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <c:forEach begin="1" end="${TOTAL_PAGE}" var="i">
                            <li class="page-item ${i == PAGE ? "active":""}"><a class="page-link" href="HomeAdminController?page=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item ${PAGE + 1 > TOTAL_PAGE ? "disabled":""}">
                            <a class="page-link" href="HomeAdminController?page=${PAGE + 1}" tabindex="-1" aria-disabled="true">Next</a>
                        </li>
                    </ul>
                </nav>   
            </div>
        </section>
        <%@include file="components/footerComponent.jsp"%>

    </body>
</html>
