<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<style>
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

.sidenav h3 {
    color: white;
    text-align: center;
    margin-bottom: 20px;
    font-size: 15px;
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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="sidenav">
<img src="<c:url value='/resources/images/UTM-LOGO.png'/>" alt="Logo" style="width:50%; max-width:200px; margin-bottom:10px;margin-left:60px;">
    
    <h2>UTMRegistEase</h2>
    <h3>Admin</h3>
    <ul class="nav">
        <li class="${param.activePage == 'viewTimetable' ? 'active' : ''}">
            <a href="/UTMRegistEase/admin/viewTimetable">View Timetable</a>
        </li>
        <li class="${param.activePage == 'addTimetable' ? 'active' : ''}">
            <a href="/UTMRegistEase/admin/addTimetable">Add Timetable</a>
        </li>
        <li class="${param.activePage == 'editTimetable' ? 'active' : ''}">
            <a href="/UTMRegistEase/admin/editTimetable">Edit Timetable</a>
        </li>
        <li>
            <a href="/UTMRegistEase/logout">Logout</a>
        </li>
    </ul>
</div>

</body>
</html>