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
    <%@include file="components/headerAdminComponent.jsp"%>
    <%@include file="components/navBaAdminComponent.jsp" %>

    <section class="py-4">
        <div class="container" style="min-height: 850px; border: 1px solid #ccc; padding-top: 18px">

            <h3 style="text-align: center">Information</h3>
            <form action="MainController" method="POST">
                <div class="mb-3">
                    <label for="productName" class="form-label">Product ID: </label>
                    <input type="text" class="form-control" id="productID" name="productID" value="${LIST_PRODUCT.productID}" readonly="">

                </div>
                <div class="mb-3">
                    <label for="productName" class="form-label">Product Name: </label>
                    <input type="text" class="form-control" id="productName" name="productName" value="${LIST_PRODUCT.productName}" required="" >

                </div>
                <div class="mb-3">
                    <label for="imageUrl" class="form-label">Product ImageUrl: </label>
                    <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${LIST_PRODUCT.imageUrl}" placeholder="https://example.com" pattern="https://.*" size="30" required="" >

                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description: </label>
                    <input type="text" class="form-control" id="description" name="description" value="${LIST_PRODUCT.description}" required="">

                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Price: </label>
                    <input type="number" min="0.3" step="0.01" class="form-control" id="price" name="price" value="${LIST_PRODUCT.price}" >

                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity: </label>
                    <input type="number" min="1"  class="form-control" id="quantity" name="quantity" value="${LIST_PRODUCT.quantity}" >

                </div>
                <div class="mb-3">
                    <label for="categoryID" class="form-label">Category: </label>
                    <select name="categoryID">

                        <c:forEach items="${LIST_CATEGORY}" var="C">
                            <option ${C.categoryID == LIST_PRODUCT.categoryID ? "selected":"" } value="${C.categoryID}" >${C.categoryName}</option>    
                        </c:forEach>

                    </select>
                </div>
                <div class="mb-3">
                    <label for="importDate" class="form-label">Import Date: </label>
                    <input type="date" class="form-control" id="importDate" name="importDate" value="${LIST_PRODUCT.importDate}" required pattern="\d{4}-\d{2}-\d{2}"  >

                </div>
                <div class="mb-3">
                    <label for="usingDate" class="form-label">Using Date: </label>
                    <input type="date" class="form-control" id="usingDate" name="usingDate" value="${LIST_PRODUCT.usingDate}" required pattern="\d{4}-\d{2}-\d{2}" >

                </div>
                <input type="submit" name="action" value="Edit" class="btn btn-primary w-100">
            </form>
        </div>
    </section>
    <%@include file="components/footerComponent.jsp"%>

</body>
</html>
