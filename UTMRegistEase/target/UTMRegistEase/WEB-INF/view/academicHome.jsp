<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Homepage</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/styles.css'/>">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <jsp:include page="academicSideBar.jsp">
        	<jsp:param name="activePage" value="home" />
        </jsp:include>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h1>Home</h1>

        <!-- Row Container for Upcoming Registration and Calendar -->
        <div class="row-container">
            <!-- Upcoming Registration -->
            <div class="upcoming-registration">
                <h2>Upcoming Registration Request</h2>
                <div>
                    <p>You don’t have any registration request yet</p>
                </div>
            </div>

            <!-- Calendar -->
            <div class="calendar">
                <h2 align="center" id="calendar-header" style="color: black;"></h2>
                <br />
                <table bgcolor="lightgrey" align="center" cellspacing="21" cellpadding="21">
                    <thead>
                        <tr>
                            <th>Sun</th>
                            <th>Mon</th>
                            <th>Tue</th>
                            <th>Wed</th>
                            <th>Thu</th>
                            <th>Fri</th>
                            <th>Sat</th>
                        </tr>
                    </thead>
                    <tbody id="calendar-body">
                        <!-- Calendar dates will be generated here -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Schedule -->
        <div class="row-2-container">
            <div class="schedule">
                <h2>Schedule</h2>
                <table>
                    <thead>
                        <tr>
                            <th>DAY</th>
                            <th>SUN</th>
                            <th>MON</th>
                            <th>TUE</th>
                            <th>WED</th>
                            <th>THU</th>
                            <th>TIME</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>8.00 - 8.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>02</td>
                        </tr>
                        <tr>
                            <td>9.00 - 9.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>03</td>
                        </tr>
                        <tr>
                            <td>10.00 - 10.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>04</td>
                        </tr>
                        <tr>
                            <td>11.00 - 11.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>05</td>
                        </tr>
                        <tr class="gray-row">
                            <td>12.00 - 12.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>06</td>
                        </tr>
                        <tr>
                            <td>2.00 - 2.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>08</td>
                        </tr>
                        <tr>
                            <td>3.00 - 3.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>09</td>
                        </tr>
                        <tr>
                            <td>4.00 - 4.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>5.00 - 5.50</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>11</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Notifications -->
            <div class="notifications">
                <h2>Notification</h2>
                <p>You have not received any notification yet.</p>
            </div>
        </div>
    </div>

    <script>
        // Get the current date
        const today = new Date();
        const currentMonth = today.getMonth();
        const currentYear = today.getFullYear();
        const currentDate = today.getDate();

        // Month names
        const monthNames = [ "January", "February", "March", "April", "May",
                "June", "July", "August", "September", "October", "November",
                "December" ];

        // Set the header to show current month and year
        document.getElementById("calendar-header").textContent = monthNames[currentMonth]
                + " " + currentYear;

        // Get the first day of the month
        const firstDay = new Date(currentYear, currentMonth, 1).getDay();

        // Get the number of days in the month
        const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

        // Generate the calendar
        const calendarBody = document.getElementById("calendar-body");
        let date = 1;

        for (let i = 0; i < 6; i++) {
            const row = document.createElement("tr");

            for (let j = 0; j < 7; j++) {
                if (i === 0 && j < firstDay) {
                    const cell = document.createElement("td");
                    row.appendChild(cell);
                } else if (date > daysInMonth) {
                    break;
                } else {
                    const cell = document.createElement("td");
                    cell.textContent = date;

                    // Highlight the current date
                    if (date === currentDate) {
                        cell.classList.add("today");
                    }

                    row.appendChild(cell);
                    date++;
                }
            }

            calendarBody.appendChild(row);
        }
    </script>
</body>
</html>
