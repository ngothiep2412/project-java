<%-- 
    Document   : listStudents
    Created on : 27-02-2022, 10:25:31
    Author     : Thiep Ngo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>List Student</h3>
        <a href="create-student">Create new</a>
        <table border="1">
            <thead>
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>age</th>
                    <th>mark</th>
                    <th>class Name</th>
                    <th>action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listStudents}" var="student">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.age}</td>
                    <td>${student.mark}</td>
                    <td>${student.className}</td>
                    <td><a href="update-student?id=${student.id}">Update</a> | <a href="delete-student?id=${student.id}">Delete</a>  </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </body>
</html>
