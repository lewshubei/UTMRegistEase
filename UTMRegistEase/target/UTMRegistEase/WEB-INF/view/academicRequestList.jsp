<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Request List</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/styles.css'/>">
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .sidebar {
            width: 13%;
            background-color: #002147;
            color: white;
            height: 100vh;
            padding: 20px;
            box-sizing: border-box;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
        }

        .request-list {
            width: 80%;
            padding: 20px;
            box-sizing: border-box;
        }

        h1 {
            margin-bottom: 20px;
            color: #002147;
            font-size: 24px;
        }

        .search-bar {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .student-list {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .student-list th, .student-list td {
            text-align: center;
            padding: 15px;
            border: 1px solid #ddd;
        }

        .student-list th {
            background-color: #002147;
            color: white;
        }

        .student-list tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .student-list tr:hover {
            background-color: #f5f5f5;
        }

        .status-pending {
            color: #ff9800; /* Yellow */
            font-weight: bold;
        }

        .status-approved {
            color: #4caf50; /* Green */
            font-weight: bold;
        }

        .status-rejected {
            color: #f44336; /* Red */
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <jsp:include page="academicSideBar.jsp">
            <jsp:param name="activePage" value="request" />
        </jsp:include>
    </div>

    <!-- Request List -->
    <div class="request-list">
        <h1>Student Request List</h1>
        <input type="text" class="search-bar" placeholder="Search students...">
        <table class="student-list" id="studentListTable">
            <thead>
                <tr>
                    <th>Student Name</th>
                    <th>Student ID</th>
                    <th>Course Name</th>
                    <th>Course Code</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dynamic Data Rendering -->
                <c:forEach items="${courses}" var="course">
                    <tr>
                        <td>${course.studentName}</td>
                        <td>${course.studentId}</td>
                        <td>${course.name}</td>
                        <td>${course.code}</td>
                        <td class="approval-status">${course.approval_status}</td>
                        <td class="view-icon">
                            <a href="<c:url value='/academic/request/view?id=${course.studentId}'/>" title="View Details">
                                &#128065;
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Script for Status Detection -->
    <script>
        // Function to update the status styling dynamically
        document.addEventListener("DOMContentLoaded", function() {
            const statusCells = document.querySelectorAll(".approval-status");
            statusCells.forEach(cell => {
                const statusText = cell.textContent.trim().toUpperCase();
                if (statusText === "PENDING") {
                    cell.classList.add("status-pending");
                } else if (statusText === "APPROVED") {
                    cell.classList.add("status-approved");
                } else if (statusText === "REJECTED") {
                    cell.classList.add("status-rejected");
                }
            });
        });
    </script>
</body>
</html>
