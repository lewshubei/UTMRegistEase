<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Registration</title>
</head>
<body>
    <h1>Course Registration Form</h1>
    <form action="generatePdf" method="post">
        <label for="studentName">Student Name:</label>
        <input type="text" id="studentName" name="studentName" required><br><br>
        
        <label for="studentId">Student ID:</label>
        <input type="text" id="studentId" name="studentId" required><br><br>
        
        <h3>Courses</h3>
        <div id="courseList">
            <div>
                <label for="courseName">Course Name:</label>
                <input type="text" name="courses[0].courseName" required>
                <label for="courseCode">Course Code:</label>
                <input type="text" name="courses[0].courseCode" required>
                <label for="credits">Credits:</label>
                <input type="number" name="courses[0].credits" required>
            </div>
        </div>
        <button type="button" onclick="addCourse()">Add More Course</button><br><br>
        
        <button type="submit">Generate PDF</button>
    </form>
    <script>
        let courseCount = 1;
        function addCourse() {
            const courseList = document.getElementById('courseList');
            const newCourse = `
                <div>
                    <label for="courseName">Course Name:</label>
                    <input type="text" name="courses[${courseCount}].courseName" required>
                    <label for="courseCode">Course Code:</label>
                    <input type="text" name="courses[${courseCount}].courseCode" required>
                    <label for="credits">Credits:</label>
                    <input type="number" name="courses[${courseCount}].credits" required>
                </div>`;
            courseList.insertAdjacentHTML('beforeend', newCourse);
            courseCount++;
        }
    </script>
</body>
</html>