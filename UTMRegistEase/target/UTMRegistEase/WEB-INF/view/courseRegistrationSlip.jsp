<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Registration Slip</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/slip.css'/>">
    <style>
        /* Modal Styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            text-align: center;
            border-radius: 5px;
            font-family: Arial, sans-serif;
        }

        .modal-content h2 {
            font-size: 20px;
            color: red;
        }

        .modal-content p {
            font-size: 16px;
            margin: 10px 0;
        }

        .modal-content button {
            padding: 10px 20px;
            background-color: #002147;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .modal-content button:hover {
            background-color: #00408b;
        }
    </style>
    <script>
        function closeModal() {
            document.getElementById('notFoundModal').style.display = 'none';
        }
        
        window.onload = function() {
            var showModal = "${showModal}" === "true";
            if (showModal) {
                document.getElementById('notFoundModal').style.display = 'block';
            }
        };
    </script>
</head>
<body>
    <!-- Include Sidebar Fragment -->
    <div class="sidenav">
        <jsp:include page="/WEB-INF/view/studentSideBar.jsp">
            <jsp:param name="activePage" value="registration" />
        </jsp:include>
    </div>

    <!-- Content -->
    <div class="content-slip">
        <h1>Course Registration Slip</h1>

        <!-- Registration Form -->
        <div class="registration">
            <form action="<c:url value='/student/registrationSlip'/>" method="post">
                <input type="hidden" name="isSubmitted" value="true">
                <label for="semester">Session / Semester:</label>
                <select id="semester" name="semester" required>
                    <option value="2025-1" ${semester == '2025-1' ? 'selected' : ''}>2025 Semester 1</option>
                    <option value="2025-2" ${semester == '2025-2' ? 'selected' : ''}>2025 Semester 2</option>
                </select>
                <button type="submit">View Courses</button>
            </form>
        </div>

        <!-- Modal for "System not found" -->
        <div class="modal" id="notFoundModal">
            <div class="modal-content">
                <h2>System not found!</h2>
                <p>No courses are registered for the current semester.<br>Please select again!</p>
                <button onclick="closeModal()">OK</button>
            </div>
        </div>

        <!-- Course List -->
        <c:if test="${not empty courses}">
            <h2>Registered Courses</h2>
            <!-- Student Information -->
            <div class="student-info">
                <p><strong>Name:</strong> ${studentName}</p>
                <p><strong>Student ID:</strong> ${studentId}</p>
                <p><strong>Semester:</strong> ${semester}</p>
            </div>
            <table border="1">
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th>Credit</th>
                        <th>Section</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courses}" var="course">
                        <tr>
                            <td>${course.code}</td>
                            <td>${course.name}</td>
                            <td>${course.credit}</td>
                            <td>${course.section}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- Total Credits and Approval Status -->
            <div class="footer">
                <h3>Total Credits: ${totalCredits}</h3>
                <h3>Approval Status: ${approvalStatus}</h3>
            </div>
        </c:if>
    </div>
</body>
</html>
