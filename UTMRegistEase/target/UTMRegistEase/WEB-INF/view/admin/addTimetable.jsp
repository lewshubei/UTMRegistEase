<!DOCTYPE html>
<html>
<head>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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

        /* Form and input styling */
        form {
            margin-left: 350px; /* Adjust this value to move the form to the right */
            margin-top: 20px;
            width: 60%;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
        }

        label {
            display: block;
            font-size: 16px;
            margin-top: 10px;
        }

        select, input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-top: 5px;
        }

        button {
            background-color: #004080;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
            border-radius: 10px;
        }

        button:hover {
            background-color: #003366; /* Slightly darker shade for hover effect */
        }

        .back-button {
            background-color: #ccc;
            color: black;
            margin-top: 10px;
        }

        .back-button:hover {
            background-color: #aaa;
        }
    </style>
    <title>Add Timetable</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <jsp:include page="/WEB-INF/view/adminSidenav.jsp">
            <jsp:param name="activePage" value="addTimetable" />
        </jsp:include>
    </div>
    
    <div class="container">
        <h1>Add New Timetable</h1>

        <form id="addTimetableForm" action="addTimetable" method="post" onsubmit="setEmptyToNull()">
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
                <option value="MON">MON</option>
                <option value="TUE">TUE</option>
                <option value="WED">WED</option>
                <option value="THU">THU</option>
                <option value="FRI">FRI</option>
            </select>

            <label for="time1">Time 1:</label>
            <input type="text" id="time1" name="time1" required>

            <label for="venue1">Venue 1:</label>
            <input type="text" id="venue1" name="venue1" required>

            <label for="day2">Day 2 (optional):</label>
            <select id="day2" name="day2">
                <option value="">Select Day</option>
                <option value="MON">MON</option>
                <option value="TUE">TUE</option>
                <option value="WED">WED</option>
                <option value="THU">THU</option>
                <option value="FRI">FRI</option>
            </select>

            <label for="time2">Time 2 (optional):</label>
            <input type="text" id="time2" name="time2">

            <label for="venue2">Venue 2 (optional):</label>
            <input type="text" id="venue2" name="venue2">

            <button type="submit">Add Course</button>

            <button type="button" class="back-button" onclick="location.href='/UTMRegistEase/admin/viewTimetable'">
                Back to View Timetable
            </button>
        </form>
    </div>

    <script>
        function setEmptyToNull() {
            // Check if optional fields are empty and set them to null
            if (document.getElementById('day2').value === '') {
                document.getElementById('day2').value = null;
            }
            if (document.getElementById('time2').value === '') {
                document.getElementById('time2').value = null;
            }
            if (document.getElementById('venue2').value === '') {
                document.getElementById('venue2').value = null;
            }
        }
    </script>

</body>
</html>
