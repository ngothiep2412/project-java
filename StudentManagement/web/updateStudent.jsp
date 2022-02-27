<%-- 
    Document   : createStudent
    Created on : 27-02-2022, 10:55:37
    Author     : Thiep Ngo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student Page</title>
    </head>
    <body>
        <form action="update-student" method="POST">
            <table>
                <input  type="hidden" name="id" value="${student.id}" readonly="">

                <tr>
                    <td>name</td>
                    <td><input type="text" name="name" value="${student.name}" /></td>
                </tr>
                <tr>
                    <td>age</td>
                    <td><input type="text" name="age" value="${student.age}" /></td>
                </tr>
                <tr>
                    <td>mark</td>
                    <td><input type="text" name="mark" value="${student.mark}" /></td>
                </tr>
                <tr>
                    <td>class ID</td>
                    <td>
                        <select name="classID">
                            <c:forEach items="${listClasses}" var="C">
                                <option ${C.classID == student.classID ? "selected":""} value="${C.classID}">${C.className}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Save"></td>
                </tr>
            </table>

        </form>
    </body>
</html>
