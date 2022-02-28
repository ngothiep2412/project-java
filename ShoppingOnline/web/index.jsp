<%-- 
    Document   : index
    Created on : 27-02-2022, 20:02:15
    Author     : Thiep Ngo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="components/navBarComponent.jsp"%>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Cửa Hàng Của Ngô Thiệp</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-3">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-sm-4">
                        <h3>List Categories</h3>
                        <div class="list-group">
                            <c:forEach items="${sessionScope.LIST_CATEGORY}" var="C">
                                <li class="list-group-item"><a href="filter-category?categoryID=${C.categoryID}">${C.categoryName}</a></li>
                                </c:forEach>

                        </div>
                    </div>
                    <div class="col-md-9">
                        <h3 style="text-align: center">
                            List Product</h3>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
                            <c:forEach items="${LIST_PRODUCT}" var="P">
                                <div class="col mb-5">
                                    ${P.productID}
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                        <!-- Product image-->
                                        <a href="detail?productID=${P.productID}">
                                            <img class="card-img-top" src="${P.imageUrl}" alt="..." />
                                        </a>

                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.productName}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through">$20.00</span>
                                                ${P.price}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="add-to-cart?productID=${P.productID}">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:choose>
                            <c:when test = "${LIST_PRODUCT == null || LIST_PRODUCT.size() == 0}">
                                Not found
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item ${PAGE-1 < 1 ? "disabled":""}">
                                            <a class="page-link" href="home?page=${PAGE-1}">Previous</a>
                                        </li>
                                        <c:forEach begin="1" end="${TOTAL_PAGE}" var="i">
                                            <li class="page-item ${i == PAGE ? "active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item ${PAGE+1 > TOTAL_PAGE ? "disabled":""}">
                                            <a class="page-link" href="home?page=${PAGE+1}">Next</a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>

            </div>
        </section>
        <%@include file="components/footerComponent.jsp"%>
    </body>
</html>

