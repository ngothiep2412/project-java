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
    <%@include file="components/navBaAdminComponent.jsp"%>
    <section class="py-4">
        <div class="container" style="min-height: 800px">
            <table class="table" style="text-align: center" >
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Image</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col" style="padding-right: auto; text-align: center">Category</th>
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
                        <c:forEach items="${LIST_PRODUCT}" var="P" >
                            <tr>
                            <input type="hidden" name="productID" value="${P.productID}" />
                            <th scope="row">${P.productID}</th>
                            <td><img src="${P.imageUrl}" width="70"/></td>
                            <td style="text-align: -webkit-auto">${ P.productName}</td>
                            <td style="text-align: -webkit-auto">${P.description}</td>
                            <td>${P.price}</td>
                            <td>${P.quantity}</td>
                            <th scope="col">${P.categoryName}</th>
                            <td>${P.importDate}</td>
                            <td>${P.usingDate}</td>
                            <td>
                                <a style="width: 100%" href="UpdateProductController?productID=${P.productID}" class="btn btn-outline-success mb-2"><i class="bi bi-box-arrow-in-down"></i> Update</a>
                                <a style="width: 100%" href="DeleteProductController?productID=${P.productID}" class="btn btn-outline-danger"><i class="bi bi-trash"></i> Delete</a></td>                           
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>


            <c:choose>
                <c:when test="${sessionScope.LOGIN_USER.roleID == 1}">
                    <c:choose>
                        <c:when test="${KEYWORD == NULL && CATEGORYID == NULl }">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item ${PAGE - 1 < 1 ? "disabled":""}">
                                        <a class="page-link" href="HomeAdminController?page=${PAGE - 1}" tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                    <c:forEach begin="1" end="${TOTAL_PAGE}" var="i">
                                        <li class="page-item ${i == PAGE ? "active":""}"><a class="page-link" href="HomeAdminController?page=${i}">${i}</a></li>
                                        </c:forEach>
                                    <li class="page-item ${PAGE + 1 > TOTAL_PAGE ? "disabled":""}">
                                        <a class="page-link" href="HomeAdminController?page=${PAGE + 1}">Next</a>
                                    </li> 
                                </ul>
                            </nav> 
                        </c:when>
                        <c:when test="${KEYWORD == NULL && CATEGORYID != NULl}">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item ${PAGE - 1 < 1 ? "disabled":""}">
                                        <a class="page-link" href="FilterCategoryController?page=${PAGE - 1}&categoryID=${CATEGORYID}&roleID=${sessionScope.LOGIN_USER.roleID}" tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                    <c:forEach begin="1" end="${TOTAL_PAGE}" var="i">
                                        <li class="page-item ${i == PAGE ? "active":""}"><a class="page-link" href="FilterCategoryController?page=${i}&categoryID=${CATEGORYID}&roleID=${sessionScope.LOGIN_USER.roleID}">${i}</a></li>
                                        </c:forEach>
                                    <li class="page-item ${PAGE + 1 > TOTAL_PAGE ? "disabled":""}">
                                        <a class="page-link" href="FilterCategoryController?page=${PAGE + 1}&categoryID=${CATEGORYID}&roleID=${sessionScope.LOGIN_USER.roleID}">Next</a>
                                    </li>
                                </ul>
                            </nav>  
                        </c:when>
                        <c:when test="${KEYWORD != NULl}">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item ${PAGE - 1 < 1 ? "disabled":""}">
                                        <a class="page-link" href="SearchProductAdminController?keyword=${KEYWORD}&page=${PAGE - 1}&roleID=${sessionScope.LOGIN_USER.roleID}" tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                    <c:forEach begin="1" end="${TOTAL_PAGE}" var="i">
                                        <li class="page-item ${i == PAGE ? "active":""}"><a class="page-link" href="SearchProductAdminController?keyword=${KEYWORD}&page=${i}&roleID=${sessionScope.LOGIN_USER.roleID}">${i}</a></li>
                                        </c:forEach>
                                    <li class="page-item ${PAGE + 1 > TOTAL_PAGE ? "disabled":""}">
                                        <a class="page-link" href="SearchProductAdminController?keyword=${KEYWORD}&page=${PAGE + 1}&roleID=${sessionScope.LOGIN_USER.roleID}">Next</a>
                                    </li>
                                </ul>
                            </nav>  
                        </c:when>
                    </c:choose>
                </c:when>
            </c:choose>


        </div>
    </section>
    <%@include file="components/footerComponent.jsp"%>

</body>
</html>
