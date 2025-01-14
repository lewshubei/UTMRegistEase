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

<title>Search Results</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
        // JavaScript function to show confirmation prompt
        function confirmCourseAddition(form) {
            var result = confirm("Are you sure you want to add this course?");
            if (result) {
                form.submit(); // Submit the form if user clicks "OK"
            } else {
                // Redirect to the add course page if user clicks "Cancel"
                window.location.href = "/UTMRegistEase/student/addCourse";
            }
        }
    </script>

</head>
<body>
   <div class = "sidenav">
	<jsp:include page="/WEB-INF/view/studentSideBar.jsp">
    <jsp:param name="activePage" value="addCourse" />
</jsp:include>
	</div>
    <div class="container">
        <h1>Search Results</h1>
        
        <c:if test="${not empty timetables}">
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
            <tr>
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
                <td rowspan="${not empty entry.day2 ? 2 : 1}">
                    <form action="addCourse" method="post" id="addCourseForm-${status.index}">
                        <input type="hidden" name="program" value="${entry.program}" />
                        <input type="hidden" name="code" value="${entry.code}" />
                        <input type="hidden" name="credit" value="${entry.credit}" />
                        <input type="hidden" name="name" value="${entry.name}" />
                        <input type="hidden" name="section" value="${entry.section}" />
                        <input type="hidden" name="day1" value="${entry.day1}" />
                        <input type="hidden" name="time1" value="${entry.time1}" />
                        <input type="hidden" name="venue1" value="${entry.venue1}" />
                        <c:if test="${entry.day2 != null}">
                            <input type="hidden" name="day2" value="${entry.day2}" />
                            <input type="hidden" name="time2" value="${entry.time2}" />
                            <input type="hidden" name="venue2" value="${entry.venue2}" />
                        </c:if>
                        <button type="button" class="btn btn-primary" onclick="confirmCourseAddition(document.getElementById('addCourseForm-${status.index}'))">Add Course</button>
                    </form>
                </td>
            </tr>
            <c:if test="${entry.day2 != null}">
                <tr>
                    <td>${entry.day2}</td>
                    <td>${entry.time2}</td>
                    <td>${entry.venue2}</td>
                </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table>
        </c:if>
        <c:if test="${empty timetables}">
            <p style="margin-left: 180px; color: red;">No results found for "<b>${param.searchQuery}</b>".</p>
        </c:if>
        <form method="get" action="/UTMRegistEase/student/addCourse" style="margin-left: 180px; margin-bottom: 20px;">
        <button type="submit" class="back-button">Back to Add Course</button>
    </form>
    </div>
</body>
</html>