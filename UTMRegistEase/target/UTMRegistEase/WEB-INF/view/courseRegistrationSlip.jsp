<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Registration Slip</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/styles.css'/>">
</head>
<body>
    <!-- Include Sidebar Fragment -->
    <jsp:include page="studentSideBar.jsp" />

    <!-- Content -->
    <div class="content">
        <h1>Course Registration Slip</h1>
        <div class="registration">
            <label for="semester">Session / Semester:</label>
            <select id="semester" name="semester">
                <option value="" disabled selected>Select session/semester</option>
                <option value="2024-1">2024 Semester 1</option>
                <option value="2024-2">2024 Semester 2</option>
                <!-- Additional options can be added -->
            </select>
        </div>
    </div>

</body>
</html>
