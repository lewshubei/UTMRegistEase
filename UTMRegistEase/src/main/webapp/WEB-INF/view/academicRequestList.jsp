<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/styles.css'/>">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <jsp:include page="academicSideBar.jsp">
        	<jsp:param name="activePage" value="request" />
        </jsp:include>
    </div>

    <div class="request-list">
        <input type="text" class="search-bar" placeholder="Search students...">
        <div class="student-container">
            <table class="student-list">
                <thead>
                    <tr>
                        <th>NAME</th>
                        <th>MATRIC NO</th>
                        <th>VIEW</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Ali Bin Mohamad</td>
                        <td>A22EC1234</td>
                        <td class="view-icon"><a href="<c:url value='/academic/request/view'/>" title="View Details"><span>&#128065;</span></a></td>
                        <td class="status approved">APPROVED</td>
                    </tr>
                    <tr>
                        <td>Abu Bin Ismail</td>
                        <td>A22EC5678</td>
                        <td class="view-icon"><a href="<c:url value='/academic/request/view'/>" title="View Details"><span>&#128065;</span></a></td>
                        <td class="status rejected">REJECTED</td>
                    </tr>
                    <tr>
                        <td>Tan Sheau Jun</td>
                        <td>A22EC9345</td>
                        <td class="view-icon"><a href="<c:url value='/academic/request/view'/>" title="View Details"><span>&#128065;</span></a></td>
                        <td class="status pending">PENDING</td>
                    </tr>
                    <tr>
                        <td>Mei Ling</td>
                        <td>A22EC3564</td>
                        <td class="view-icon"><a href="<c:url value='/academic/request/view'/>" title="View Details"><span>&#128065;</span></a></td>
                        <td class="status pending">PENDING</td>
                    </tr>
                    <tr>
                        <td>Siti</td>
                        <td>A22EC1231</td>
                        <td class="view-icon"><a href="<c:url value='/academic/request/view'/>" title="View Details"><span>&#128065;</span></a></td>
                        <td class="status pending">PENDING</td>
                    </tr>
                    <tr>
                        <td>Murthu</td>
                        <td>A22EC7642</td>
                        <td class="view-icon"><a href="<c:url value='/academic/request/view'/>" title="View Details"><span>&#128065;</span></a></td>
                        <td class="status pending">PENDING</td>
                    </tr>
                    <tr>
                        <td>Farah Binti Mohamad Nor</td>
                        <td>A22EC8954</td>
                        <td class="view-icon"><a href="<c:url value='/academic/request/view'/>" title="View Details"><span>&#128065;</span></a></td>
                        <td class="status pending">PENDING</td>
                    </tr>
                    <tr>
                        <td>Ricky Yap</td>
                        <td>A22EC4543</td>
                        <td class="view-icon"><a href="<c:url value='/academic/request/view'/>" title="View Details"><span>&#128065;</span></a></td>
                        <td class="status pending">PENDING</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
