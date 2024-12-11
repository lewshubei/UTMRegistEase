<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Timetable</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input, select {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            text-transform: uppercase;
        }

        button:hover {
            background-color: #003366;
            }
            
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
}/* Main content styling */
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
</head>
<body>
<div class="sidenav">
        <h2>UTMRegistEase--ADMIN</h2>
        <ul class="nav nav-pills nav-stacked">
            <li><a href="welcomeAdmin.html">Home</a></li>
            <li ><a href="/UTMRegistEase/admin/viewTimetable">View Timetable</a></li>
            <li class="active"><a href="/UTMRegistEase/admin/addTimetable">Add Timetable</a></li>
            <li><a href="/UTMRegistEase/admin/editTimetable">Edit Timetable</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="container">
        <h1>Add New Timetable</h1>
        <form action="addTimetable" method="post">
            <label for="program">Program:</label>
            <select id="program" name="program" required>
                <option value="">Select Program</option>
                <option value="SECJH">SECJH</option>
                <option value="SECPH">SECPH</option>
                <option value="SECBH">SECBH</option>
                <option value="SECRH">SECRH</option>
                <option value="SECVH">SECVH</option>
            </select>

            <label for="code">Course Code:</label>
            <input type="text" id="code" name="code" required>

            <label for="name">Course Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="section">Section:</label>
            <input type="text" id="section" name="section" required>

            <label for="day1">Day 1:</label>
            <select id="day1" name="day1" required>
                <option value="">Select Day</option>
                <option value="SUNDAY">SUNDAY</option>
                <option value="MONDAY">MONDAY</option>
                <option value="TUESDAY">TUESDAY</option>
                <option value="WEDNESDAY">WEDNESDAY</option>
                <option value="THURSDAY">THURSDAY</option>
            </select>

            <label for="time1">Time 1:</label>
            <input type="text" id="time1" name="time1" required>

            <label for="venue1">Venue 1:</label>
            <input type="text" id="venue1" name="venue1" required>

            <label for="day2">Day 2 (optional):</label>
            <select id="day2" name="day2">
                <option value="">Select Day</option>
                <option value="SUNDAY">SUNDAY</option>
                <option value="MONDAY">MONDAY</option>
                <option value="TUESDAY">TUESDAY</option>
                <option value="WEDNESDAY">WEDNESDAY</option>
                <option value="THURSDAY">THURSDAY</option>
            </select>

            <label for="time2">Time 2 (optional):</label>
            <input type="text" id="time2" name="time2">

            <label for="venue2">Venue 2 (optional):</label>
            <input type="text" id="venue2" name="venue2">

            <button type="submit">Add Course</button>
            
    <button type="button" onclick="location.href='/UTMRegistEase/admin/viewTimetable'">
        Back to View Timetable
    </button>
            
        </form>
    </div>
</body>
</html>
