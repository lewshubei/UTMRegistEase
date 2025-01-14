<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration Request</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/styles.css'/>">
<style>
/* Table Styling */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	font-family: Arial, sans-serif;
	font-size: 14px;
}

table thead tr {
	background-color: #002147;
	color: white;
	text-align: left;
}

table th, table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

table tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

table tbody tr:hover {
	background-color: #f1f1f1;
}

table th {
	padding-top: 10px;
	padding-bottom: 10px;
	font-weight: bold;
}

.footer {
	margin-top: 20px;
	font-size: 16px;
	font-weight: bold;
	color: #333;
}

.footer h3 {
	margin: 10px 0;
}

/* Button Styling */
.confirm-button .btn {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #002147;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	cursor: pointer;
	text-align: center;
}

.confirm-button .btn:hover {
	background-color: #00408b;
}

.centered {
	text-align: center;
	margin-top: 20px;
	font-size: 24px;
	font-weight: bold;
}

.confirm-buttons {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
}

.confirm-buttons .btn {
    padding: 10px 20px;
    background-color: #002147;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    text-align: center;
}

.confirm-buttons .btn:hover {
    background-color: #00408b;
}
</style>
</head>
<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<jsp:include page="academicSideBar.jsp">
			<jsp:param name="activePage" value="request/view" />
		</jsp:include>
	</div>

	<div class="request">
		<h1>Course Registration Slip</h1>
		<div class="student-header">
			<div class="student-info">
				<div class="student-profile">
					<div class="profile-pic">
						<!-- Profile image placeholder -->
						<img src="<c:url value='/resources/icons/user.png'/>"
							alt="Profile Picture" width="50" height="50">
					</div>
					<c:if test="${empty error}">
						<div class="student-details">
							<p>
								<strong>Student Name:</strong> ${studentName}
							</p>
							<p>
								<strong>Student ID:</strong> ${studentId}
							</p>
						</div>
					</c:if>
					<div class="action-buttons">
						<form id="approvalForm"
							action="<c:url value='/academic/request/confirmAllCoursesStatus'/>"
							method="post">
							<select name="status" class="action-select" required>
								<option value="" disabled ${emptycurrentStatus ? 'selected' : ''}>Approve
									/ Reject</option>
								<option value="APPROVED"
									${currentStatus == 'APPROVED' ? 'selected' : ''}>Approve</option>
								<option value="REJECTED"
									${currentStatus == 'REJECTED' ? 'selected' : ''}>Reject</option>
							</select> <input type="hidden" name="studentId" value="${studentId}">
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Course List -->
		<h2 class="centered">Course Registration Slip</h2>
		<div class="student-info">
			<p>
				<strong>Name:</strong> ${studentName}
			</p>
			<p>
				<strong>Student ID:</strong> ${studentId}
			</p>
			<p>
				<strong>Semester:</strong> ${semester}
			</p>
		</div>
		<table>
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
		<div class="footer">
			<h3>Total Credits: ${totalCredits}</h3>
			<h3>Approval Status: ${approvalStatus}</h3>
		</div>

		<div class="confirm-buttons">
        <button class="btn" onclick="document.getElementById('approvalForm').submit()">Confirm</button>
        <button class="btn" onclick="history.back()">Back</button>
    </div>
	</div>
</body>
</html>
