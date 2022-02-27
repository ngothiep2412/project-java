<%-- 
    Document   : calculator
    Created on : 27-02-2022, 09:39:20
    Author     : Thiep Ngo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator Page</title>
    </head>
    <body>
        <form action="calculate">
            <table>
                <tbody>
                    <tr>
                        <td>Enter a: </td>
                        <td><input type="text" name="a" value="${a}" /></td>
                    </tr>
                    <tr>
                        <td>Enter b: </td>
                        <td><input type="text" name="b" value="${b}" /></td>
                    </tr>
                    <tr>
                        <td>Calculator</td>
                        <td><select name="operator">
                                <option ${operator eq "+" ? "selected":""}>+</option>
                                <option ${operator eq "-" ? "selected":""}>-</option>
                                <option ${operator eq "*" ? "selected":""}>*</option>
                                <option ${operator   eq "/" ? "selected":""}>/</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Ok" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Result</td>
                        <td><input type="text" name="result" value="${result}" /></td>
                    </tr>
                </tbody>
            </table>
            <h3 style="color: red">${error}</h3>
        </form>
    </body>
</html>
