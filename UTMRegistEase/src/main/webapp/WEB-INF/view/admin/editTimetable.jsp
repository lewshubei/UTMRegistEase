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

<jsp:include page="/WEB-INF/view/adminSidenav.jsp">
    <jsp:param name="activePage" value="editTimetable" />
</jsp:include>
<div class="container">
    <h1>Timetable</h1>
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
                <th>Availability</th>
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
                    <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.program}</td>
			        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.code}</td>
			        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.credit}</td>
			        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.name}</td>
			        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.section}</td>
                    <td>${entry.day1}</td>
                    <td>${entry.time1}</td>
                    <td>${entry.venue1}</td>
                     <td rowspan="${not empty entry.day2 ? 2 : 1}" 
    style="background-color: 
        ${entry.availability == 'Available' ? '#d4edda' : 
        (entry.availability == 'Almost full' ? '#fff3cd' : 
        (entry.availability == 'Full' ? '#f8d7da' : ''))};
        color: 
        ${entry.availability == 'Available' ? '#155724' : 
        (entry.availability == 'Almost full' ? '#856404' : 
        (entry.availability == 'Full' ? '#721c24' : ''))};
        font-weight: bold;">
    ${entry.availability}
</td>
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
