<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style>
/* General body styling */
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
th:nth-child(8), td:nth-child(7) {
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
<title>Timetable</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="sidenav">
    <h2>UTMRegistEase--ADMIN</h2>
    <ul class="nav nav-pills nav-stacked">
        <li><a href="welcomeAdmin.html">Home</a></li>
        <li><a href="/UTMRegistEase/admin/viewTimetable">View Timetable</a></li>
        <li><a href="/UTMRegistEase/admin/addTimetable">Add Timetable</a></li>
        <li class="active"><a href="/UTMRegistEase/admin/editTimetable">Edit Timetable</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>
<div class="container">
    <h1>Timetable</h1>
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
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="entry" items="${timetables}" varStatus="status">
                <!-- First Row (Lecture 1) -->
                <c:set var="rowspan" value="1" />
                <c:if test="${t.day2 != null && !t.day2.isEmpty()}">
                    <c:set var="rowspan" value="2" />
                </c:if>
                <tr class="${entry.day2 != null ? 'rowspan' : ''}">
                    <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.program}</td>
                    <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.code}</td>
                    <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.name}</td>
                    <td rowspan="${entry.day2 != null ? 2 : 1}">${entry.section}</td>
                    <td>${entry.day1}</td>
                    <td>${entry.time1}</td>
                    <td>${entry.venue1}</td>
                    <td rowspan="${entry.day2 != null ? 2 : 1}">
                        <a href="/UTMRegistEase/admin/updateCourse?index=${status.index}">
                            <i class='bx bx-edit-alt bx-md'></i>
                        </a>
                        <a href="/UTMRegistEase/admin/deleteCourse/${status.index}" onclick="return confirm('Are you sure you want to delete this course?');">
                            <i class='bx bx-trash bx-md'></i>
                        </a>
                    </td>
                </tr>

                <!-- Second Row (Lecture 2, if available) -->
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

<script>
document.addEventListener('DOMContentLoaded', function() {
    const rows = document.querySelectorAll('tr.rowspan');
    rows.forEach(row => {
        row.addEventListener('mouseenter', function() {
            this.classList.add('hover');
            const nextRow = this.nextElementSibling;
            if (nextRow && nextRow.classList.contains('rowspan')) {
                nextRow.classList.add('hover');
            }
        });
        row.addEventListener('mouseleave', function() {
            this.classList.remove('hover');
            const nextRow = this.nextElementSibling;
            if (nextRow && nextRow.classList.contains('rowspan')) {
                nextRow.classList.remove('hover');
            }
        });
    });
});
</script>

</body>
</html>
