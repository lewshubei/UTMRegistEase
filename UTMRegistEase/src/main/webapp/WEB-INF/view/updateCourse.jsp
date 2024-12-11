<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Course</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-right:200px;
        }

        /* Sidebar styling */
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

        /* Main content styling */
        .content {
            margin-left: 270px; /* Make space for the sidebar */
            padding: 20px;
        }

        
        .form-group label {
            font-weight: bold;
        }

        .form-group input {
            border-radius: 4px;
            padding: 10px;
            width: 100%;
        }

        button[type="submit"] {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <!-- Sidebar (Sidenav) -->
    <div class="sidenav">
        <h2>UTMRegistEase--ADMIN</h2>
        <ul class="nav nav-pills nav-stacked">
            <li><a href="welcomeAdmin.html">Home</a></li>
            <li><a href="/UTMRegistEase/admin/viewTimetable">View Timetable</a></li>
            <li><a href="/UTMRegistEase/admin/addTimetable">Add Timetable</a></li>
            <li><a href="/UTMRegistEase/admin/editTimetable">Edit Timetable</a></li>
            <li class="active"><a href="/UTMRegistEase/admin/updateCourse?index=${index}">Update Course</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>

    <!-- Main content -->
    <div class="container">
        <h2>Update Course</h2>
        <form action="/UTMRegistEase/admin/updateCourse" method="post">
            <!-- Hidden field to pass the index of the timetable entry -->
            <input type="hidden" name="index" value="${index}">

            <!-- Program -->
            <div class="form-group">
                <label for="program">Program</label>
                <input type="text" class="form-control" id="program" name="program" value="${timetable.program}" required>
            </div>

            <!-- Code -->
            <div class="form-group">
                <label for="code">Code</label>
                <input type="text" class="form-control" id="code" name="code" value="${timetable.code}" required>
            </div>

            <!-- Name -->
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${timetable.name}" required>
            </div>

            <!-- Section -->
            <div class="form-group">
                <label for="section">Section</label>
                <input type="text" class="form-control" id="section" name="section" value="${timetable.section}" required>
            </div>

            <!-- Day 1 -->
            <div class="form-group">
                <label for="day1">Day 1</label>
                <input type="text" class="form-control" id="day1" name="day1" value="${timetable.day1}" required>
            </div>

            <!-- Time 1 -->
            <div class="form-group">
                <label for="time1">Time 1</label>
                <input type="text" class="form-control" id="time1" name="time1" value="${timetable.time1}" required>
            </div>

            <!-- Venue 1 -->
            <div class="form-group">
                <label for="venue1">Venue 1</label>
                <input type="text" class="form-control" id="venue1" name="venue1" value="${timetable.venue1}" required>
            </div>

            <!-- Day 2 -->
            <div class="form-group">
                <label for="day2">Day 2</label>
                <input type="text" class="form-control" id="day2" name="day2" value="${timetable.day2}">
            </div>

            <!-- Time 2 -->
            <div class="form-group">
                <label for="time2">Time 2</label>
                <input type="text" class="form-control" id="time2" name="time2" value="${timetable.time2}">
            </div>

            <!-- Venue 2 -->
            <div class="form-group">
                <label for="venue2">Venue 2</label>
                <input type="text" class="form-control" id="venue2" name="venue2" value="${timetable.venue2}">
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary">Update Course</button>
        </form>
    </div>

</body>
</html>
