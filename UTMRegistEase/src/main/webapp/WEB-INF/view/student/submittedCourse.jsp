<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        /* Your existing CSS here */
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
        }
        
        /* Page title styling */
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
            font-size: 28px;
            margin-left:180px;
        }

        .sidenav {
            height: 100%; /* Full height */
            width: 250px; /* Sidebar width */
            position: fixed; /* Fixed position */
            z-index: 1; /* Stay on top */
            top: 0;
            left: 0;
            background-color: #004080; /* Background color */
            overflow-x: hidden; /* Disable horizontal scroll */
            padding-top: 20px; /* Padding from the top */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* Sidebar shadow */
            display: flex; /* Add flexbox */
            flex-direction: column; /* Align items vertically */
        }

        .sidenav h2 {
            color: white;
            text-align: center;
            margin-bottom: 20px;
            font-size: 20px;
        }

        .sidenav ul {
            list-style-type: none; /* Remove bullet points */
            padding: 0;
            margin: 0;
            flex-grow: 1; /* Allow items to stretch */
            display: flex;
            flex-direction: column; /* Ensure vertical stacking */
            gap: 10px; /* Space between links */
        }

        .sidenav ul li {
            width: 230px; /* Stretch links to full width */
        }

        .sidenav ul li a {
            display: block; /* Block elements for full-width clickable area */
            color: white; /* Link color */
            text-decoration: none; /* Remove underline */
            padding: 12px 20px; /* Padding for links */
            font-size: 16px;
            text-align: left; /* Align text to the left */
            transition: all 0.3s; /* Smooth hover effect */
        }

        .sidenav ul li a:hover {
            background-color: #003366; /* Darker shade on hover */
            border-left: 4px solid #ffcc00; /* Yellow border to highlight link */
        }

        /* Main content area styling */
        .content {
            margin-left: 270px; /* Make space for the sidebar */
            padding: 20px;
        }

        /* Table styling */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            text-align: center;
            margin-left:180px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #004080;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-align: center;
            font-size: 14px;
        }

        td {
            color: #555;
        }

        /* Table row hover effect */
        table tbody tr:hover,
        table tbody tr.hover {
            background-color: #e6f7ff; /* Light blue background */
        }

        th:nth-child(6), td:nth-child(6) {
            width: 120px; /* Adjust width for Time column */
        }

        th:nth-child(7), td:nth-child(7) {
            width: 150px; /* Adjust width for Venue column */
        }
        
        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .sidenav {
                width: 100%;
                height: auto;
                position: relative;
            }

            .sidenav ul li a {
                font-size: 14px;
            }

            .content {
                margin-left: 230px;
                padding: 10px;
            }

            table {
                width: 100%;
                font-size: 12px;
            }
        }
    </style>
    <title>Submitted Courses</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- 
    <div class="sidenav">
        <jsp:include page="/WEB-INF/view/studentSideBar.jsp">
            <jsp:param name="activePage" value="addCourse" />
        </jsp:include>
    </div>
-->

<div class="sidenav">
<img src="<c:url value='/resources/images/UTM-LOGO.png'/>" alt="Logo" style="width:50%; max-width:200px; margin-bottom:10px;margin-left:60px;">
        <h2>UTMRegistEase--STUDENT</h2>
        <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="/UTMRegistEase/student/viewTimetable">View Timetable</a></li>
            <li><a href="/UTMRegistEase/student/addCourse">Add Course</a></li>
            <li><a href="/UTMRegistEase/student/submittedCourse">Submitted Course</a></li>
            <li>
            	<a href="/UTMRegistEase/logout">Logout</a>
        	</li>
        </ul>
    </div>
    <div class="container">
        <h1>Submitted Courses</h1>
        <table>
            <thead>
                <tr>
                    <th>Program</th>
                    <th>Code</th>
                    <th>Credit</th>
                    <th>Name</th>
                    <th>Section</th>
                    <th>Day</th>
                    <th>Time</th>
                    <th>Venue</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="entry" items="${courses}" varStatus="status">
                    <c:set var="rowspan" value="1" />
                    <c:if test="${entry.day2 != null && !entry.day2.isEmpty()}">
                        <c:set var="rowspan" value="2" />
                    </c:if>
                    <tr class="${entry.day2 != null ? 'rowspan' : ''}">
                        <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.program}</td>
                        <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.code}</td>
                        <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.credit}</td>
                        <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.name}</td>
                        <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.section}</td>
                        <td>${entry.day1}</td>
                        <td>${entry.time1}</td>
                        <td>${entry.venue1}</td>
                    </tr>
                    <c:if test="${entry.day2 != null}">
                        <tr class="rowspan">
                            <td>${entry.day2}</td>
                            <td>${entry.time2}</td>
                            <td>${entry.venue2}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
