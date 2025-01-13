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
        
        .btn-custom {
        padding: 10px 20px; /* Ensures consistent padding */
        font-size: 16px;    /* Ensures consistent font size */
        line-height: 1.5;   /* Ensures consistent line height */
    }
    
    .btn-secondary
    {
    	margin-top: 20px;
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
            background-color: #004080;
        }
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/view/adminSidenav.jsp">
    <jsp:param name="activePage" value="editTimetable" />
</jsp:include>

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
            
            <div class="form-group">
                <label for="credit">Code</label>
                <input type="text" class="form-control" id="credit" name="credit" value="${timetable.credit}" required>
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
    <select id="day1" name="day1" class="form-control" required>
        <option value="">${timetable.day1}</option>
        <option value="MON" ${timetable.day1 == 'MON' ? 'selected' : ''}>MON</option>
        <option value="TUE" ${timetable.day1 == 'TUE' ? 'selected' : ''}>TUE</option>
        <option value="WED" ${timetable.day1 == 'WED' ? 'selected' : ''}>WED</option>
        <option value="THU" ${timetable.day1 == 'THU' ? 'selected' : ''}>THU</option>
        <option value="FRI" ${timetable.day1 == 'FRI' ? 'selected' : ''}>FRI</option>
    </select>
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
    <label for="day2">Day 2 (optional):</label>
    <select id="day2" name="day2" class="form-control">
        <option value="">${timetable.day2}</option>
        <option value="MON" ${timetable.day2 == 'MON' ? 'selected' : ''}>MON</option>
        <option value="TUE" ${timetable.day2 == 'TUE' ? 'selected' : ''}>TUE</option>
        <option value="WED" ${timetable.day2 == 'WED' ? 'selected' : ''}>WED</option>
        <option value="THU" ${timetable.day2 == 'THU' ? 'selected' : ''}>THU</option>
        <option value="FRI" ${timetable.day2 == 'FRI' ? 'selected' : ''}>FRI</option>
    </select>
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

            <div class="form-group">
    <button type="submit" class="btn btn-primary btn-custom">Update Course</button>
    <button type="button" class="btn btn-secondary btn-custom" onclick="location.href='/UTMRegistEase/admin/editTimetable'">
        Back
    </button>
</div>


        </form>
    </div>
    
    <script>
    document.querySelector('form').addEventListener('submit', function () {
        if (document.getElementById('day2').value.trim() === '') {
            document.getElementById('day2').removeAttribute('name');
        }
        if (document.getElementById('time2').value.trim() === '') {
            document.getElementById('time2').removeAttribute('name');
        }
        if (document.getElementById('venue2').value.trim() === '') {
            document.getElementById('venue2').removeAttribute('name');
        }
    });

    </script>

</body>
</html>
