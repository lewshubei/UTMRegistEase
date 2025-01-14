<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .sidenav {
            height: 100%;
            width: 250px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #004080;
            overflow-x: hidden;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        .sidenav h2 {
            color: white;
            text-align: center;
            margin-bottom: 20px;
            font-size: 20px;
        }

        .sidenav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .sidenav ul li {
            width: 230px;
        }

        .sidenav ul li a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 16px;
            text-align: left;
            transition: all 0.3s;
        }

        .sidenav ul li a:hover {
            background-color: #003366;
            border-left: 4px solid #ffcc00;
        }

        /* Updated active page styling */
        .sidenav ul li.active a {
            background-color: #003366; /* New active page background color */
            color: white; /* Text color */
            font-weight: bold;
            border-left: 4px solid #ffcc00; /* New border color */
        }
    </style>
    <meta charset="UTF-8">
    <title>Student Sidebar</title>
</head>
<body>
<div class="sidenav">
    <img src="<c:url value='/resources/images/UTM-LOGO.png'/>" alt="Logo" style="width:50%; max-width:200px; margin-bottom:10px; margin-left:60px;">
    
    <h2>UTMRegistEase--STUDENT</h2>
    <h3 style="color: white; text-align: center; margin-top: 10px;">
    Welcome, <c:out value="${pageContext.request.userPrincipal.name}" />
</h3>
    
    
    <ul class="nav">
        <li class="${param.activePage == 'viewTimetable' ? 'active' : ''}">
            <a href="/UTMRegistEase/student/viewTimetable">View Timetable</a>
        </li>
        <li class="${param.activePage == 'addCourse' ? 'active' : ''}">
            <a href="/UTMRegistEase/student/addCourse">Add Course</a>
        </li>
        <li class="${param.activePage == 'viewRegisteredCourse' ? 'active' : ''}">
            <a href="/UTMRegistEase/student/viewRegisteredCourse">View Registered Course</a>
        </li>
        <li>
            <a href="/UTMRegistEase/logout">Logout</a>
        </li>
    </ul>
</div>
</body>
</html>
