<%-- 
    Document   : login
    Created on : 01-03-2022, 18:19:32
    Author     : Thiep Ngo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link href="css/styles_login.css" rel="stylesheet" />
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card border-0 shadow rounded-3 my-5">
                        <div class="card-body p-4 p-sm-5">
                            <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
                            <form action="MainController" method="POST">
                                <div class="form-floating mb-3">
                                    <input type="text" name="userID" required="" class="form-control" id="floatingInput" placeholder="userID">
                                    <label for="floatingInput">UserID</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" name="password" required="" class="form-control" id="floatingPassword" placeholder="Password">
                                    <label for="floatingPassword">Password</label>
                                </div>

                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                                    <label class="form-check-label" for="rememberPasswordCheck">
                                        Remember password
                                    </label>
                                </div>

                                <div class="d-grid">
                                    <input class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" name="action" value="Login">
                                </div>
                                <c:choose>
                                    <c:when test="${ERROR != null}">
                                        <h3 style="color: red">${ERROR}</h3>
                                    </c:when>
                                    <c:otherwise>
                                        <h3></h3>
                                    </c:otherwise>
                                </c:choose>

                                <hr class="my-4">
                                <div class="d-grid mb-2">
                                    <button class="btn btn-google btn-login text-uppercase fw-bold" type="submit">
                                        <i class="fab fa-google me-2"></i> Sign in with Google
                                    </button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
