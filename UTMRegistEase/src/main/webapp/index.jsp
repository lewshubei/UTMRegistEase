<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login-style.css'/>">
</head>
<body>
     <div class="container">
        <div class="form-container">
        	<h2 class="form-title">Sign In</h2>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div>
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required />
                </div>
                <div>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required />
                </div>
                <div>
                    <button type="submit">Login</button>
                </div>
            </form>
            <p style="color: red;">
                <% if (request.getParameter("error") != null) { %>
                    Invalid username or password.
                <% } %>
            </p>
            <p style="color: green;">
                <% if (request.getParameter("logout") != null) { %>
                    You have been logged out successfully.
                <% } %>
            </p>
        </div>
    </div>
</body>
</html>
