<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <style>
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

.sidenav ul li.active a {
    background-color: #003366; /* Active link background */
    border-left: 4px solid #ffcc00; /* Yellow highlight for active link */
}


/* Main content area styling */
.content {
    margin-left: 270px; /* Make space for the sidebar */
    padding: 20px;
}

/* Table styling */
table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #ffffff;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
    text-align: center;
    margin-left: 300px; /* Adjusted margin to move the table further to the right */
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



/* Back button styling */
.back-button {
    background-color: #004080;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    transition: background-color 0.3s;
    border-radius: 10px;
    margin-left: 300px; /* Adjusted margin to move the button further to the right */
}

.back-button:hover {
    background-color: #003366; /* Slightly darker shade for hover effect */
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
    <title>Search Results</title>
</head>
<body>
    <div class="sidenav">
        <h2>UTMRegistEase--ADMIN</h2>
        <ul class="nav nav-pills nav-stacked">
            <li><a href="welcomeAdmin.html">Home</a></li>
            <li><a href="/UTMRegistEase/admin/viewTimetable">View Timetable</a></li>
            <li><a href="/UTMRegistEase/admin/addTimetable">Add Timetable</a></li>
            <li><a href="/UTMRegistEase/admin/editTimetable">Edit Timetable</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="container">
        <h1>Search Results</h1>
        
        <c:if test="${not empty timetables}">
            <table>
                <thead>
                    <tr>
                        <th>Program</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Section</th>
                        <th>Day</th>
                        <th>Time</th>
                        <th>Venue</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="entry" items="${timetables}">
                        <tr>
                            <td>${entry.program}</td>
                            <td>${entry.code}</td>
                            <td>${entry.name}</td>
                            <td>${entry.section}</td>
                            <td>${entry.day1}</td>
                            <td>${entry.time1}</td>
                            <td>${entry.venue1}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty timetables}">
            <p style="margin-left: 180px; color: red;">No results found for "<b>${param.searchQuery}</b>".</p>
        </c:if>
        <form method="get" action="/UTMRegistEase/admin/viewTimetable" style="margin-left: 180px; margin-bottom: 20px;">
        <button type="submit" class="back-button">Back to View Timetable</button>
    </form>
    </div>
</body>
</html>
