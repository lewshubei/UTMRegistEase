<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Request</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/styles.css'/>">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <jsp:include page="academicSideBar.jsp">
        	<jsp:param name="activePage" value="request/view" />
        </jsp:include>
    </div>

    <div class="request">
        <h1>Registration Request</h1>
        <div class="student-header">
            <div class="student-info">
                <div class="student-profile">
                    <div class="profile-pic">
                        <!-- Profile image placeholder -->
                        <img src="<c:url value='/resources/icons/user.png'/>" alt="Profile Picture" width="50" height="50">
                    </div>
                    <div class="student-details">
                        <p>
                            <strong>Ali Bin Mohamad</strong>
                        </p>
                        <p>A22EC1234</p>
                        <p>ALI@GRADUATE.UTM.MY</p>
                    </div>
                    <div class="action-buttons">
                        <select class="action-select">
                            <option value="" disabled selected>Approve / Reject</option>
                            <option value="approve">Approve</option>
                            <option value="reject">Reject</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="confirm-button">
            <button class="btn" onclick="history.back()">Confirm</button>
        </div>
    </div>
</body>
</html>
