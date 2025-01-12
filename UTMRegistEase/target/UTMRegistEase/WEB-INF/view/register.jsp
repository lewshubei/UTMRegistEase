<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
    <h1>Register</h1>
    <form action="<c:url value='/register' />" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required />
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required />
        </div>
        <div>
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
            </select>
        </div>
        <div>
            <button type="submit">Register</button>
        </div>
    </form>
    <div>
        <p>Already have an account? <a href="<c:url value='/login' />">Login here</a></p>
    </div>
</body>
</html>