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

        <!-- Product section-->
        <section class="py-5">
            <div class="container" style="min-height: 800px">

                <c:choose>
                    <c:when test="${sessionScope.CARTS==null||sessionScope.CARTS.size() == 0}">
                        <h1>List Cart is Empty</h1>
                    </c:when>
                    <c:otherwise>
                        <h3>List Products</h3>
                        <table class="table" >
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${CARTS}" var="C">
                                <form action="update-quantity">
                                    <tr>
                                    <input type="hidden" name="productID" value="${C.value.product.productID}" />
                                    <th scope="row">${C.value.product.productID}</th>
                                    <td><img src="${C.value.product.imageUrl}" width="50"/></td>
                                    <td>${C.value.product.productName}</td>
                                    <td>${C.value.product.price}</td>
                                    <td><input onchange="this.form.submit()" type="number" name="quantity" value="${C.value.quantity}"></td>
                                    <td>${C.value.product.price*C.value.quantity}</td>
                                    <td><a href="delete-cart?productID=${C.value.product.productID}" class="btn btn-outline-danger"> <i class="bi bi-trash"></i>Delete</a></td>                           
                                    </tr>
                                </form>
                            </c:forEach>

                            </tbody>
                        </table>

                        <h3>Total Amount: $${totalMoney}</h3>
                        <a href="checkout" class="btn btn-success w-25" >Check Out</a>
                    </c:otherwise>

                </c:choose>
            </div>
        </section>
        <%@include file="components/footerComponent.jsp"%>

    </body>
</html>

