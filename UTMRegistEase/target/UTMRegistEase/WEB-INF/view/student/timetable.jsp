<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
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
.search-button {
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
}

.search-button:hover {
    background-color: #003366; /* Slightly darker shade for hover effect */
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
    border-radius: 10px
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
	
    <title>Timetable</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<div class = "sidenav">
	<jsp:include page="/WEB-INF/view/studentSideBar.jsp">
    <jsp:param name="activePage" value="viewTimetable" />
</jsp:include>
	</div>

    <div class="container">
        <h1>Timetable</h1>
        
        <form method="get" action="/UTMRegistEase/student/search" style="margin-left: 180px; margin-bottom: 20px;">
    <div class="form-group">
        <!-- Use param.searchQuery to retain the search input -->
        <input type="text" name="searchQuery" class="form-control" 
               placeholder="Search by Program, Code, or Name" 
               style="width: 60%; display: inline-block;" 
               value="${param.searchQuery}">
        <button type="submit" class="search-button" style="margin-left: 10px; ">Search</button>
    </div>
</form>
<c:if test="${not empty param.searchQuery}">
    <form method="get" action="/UTMRegistEase/student/viewTimetable" style="margin-left: 180px; margin-bottom: 20px;">
        <button type="submit" class="back-button">Back to View Timetable</button>
    </form>
</c:if>
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
    <c:forEach var="entry" items="${timetables}">
    <!-- First Row (Lecture 1) -->
    <tr>
        <!-- rowspan checks if day2 is not empty or null -->
        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.program}</td>
        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.code}</td>
        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.credit}</td>
        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.name}</td>
        <td rowspan="${not empty entry.day2 ? 2 : 1}">${entry.section}</td>
        <td>${entry.day1}</td>
        <td>${entry.time1}</td>
        <td>${entry.venue1}</td>
    </tr>

    <!-- Second Row (Lecture 2, if available) -->
    <c:if test="${not empty entry.day2}">
        <tr>
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