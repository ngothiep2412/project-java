<%-- 
    Document   : navBaAdminComponent
    Created on : 03-03-2022, 09:52:14
    Author     : Thiep Ngo
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light h-100">
        <div class="container px-4 px-lg-5">
            <a href="HomeAdminController" style="font-weight: 500" class="navbar-brand" aria-current="page">Home</a>
            <div class="navbar-brand ms-3" style="color: green; font-weight: 350" >  Welcome: ${sessionScope.LOGIN_USER.fullName}</div>
           
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="font-weight: 700" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Category</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:forEach items="${LIST_CATEGORY}" var="C">
                                <li><a class="dropdown-item" href="FilterCategoryController?categoryID=${C.categoryID}&roleID=${sessionScope.LOGIN_USER.roleID}">${C.categoryName}</a></li>
                            </c:forEach>

                        </ul>
                    </li>
                </ul>  
                            
                            
                <form action="MainController" class="d-flex mx-left w-100" >
                    <input class="form-control me-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
                    <input name="action" value="Search" class="btn btn-outline-primary" type="submit">
                    <input name="roleID" value="${sessionScope.LOGIN_USER.roleID}" type="hidden">
                    <input name="page" value="1" type="hidden">

                </form>
                    
                    
                <form action="admin_add.jsp" method="POST">
                    <input class="btn btn-outline-info ms-lg-2" type="submit" name="action" value="Add">
                </form>
                <form action="MainController" method="POST">
                    <input class="btn btn-outline-danger ms-lg-2" type="submit" name="action" value="Logout">
                </form>
            </div>
        </div>
    </nav>
