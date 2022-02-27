<%-- 
    Document   : createStudent
    Created on : 27-02-2022, 10:55:37
    Author     : Thiep Ngo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Student Page</title>
    </head>
    <body>
        <form action="create-student" method="POST">
            <table>
                <tr>
                    <td>name</td>
                    <td><input type="text" name="name" value="" /></td>
                </tr>
                <tr>
                    <td>age</td>
                    <td><input type="text" name="age" value="" /></td>
                </tr>
                 <tr>
                    <td>mark</td>
                    <td><input type="text" name="mark" value="" /></td>
                </tr>
                 <tr>
                    <td>class ID</td>
                    <td><input type="text" name="classID" value="" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Save"></td>
                </tr>
            </table>

        </form>
    </body>
</html>
