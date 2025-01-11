<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<body>
    <div class="sidebar">
        <div class="sidebar-container">
            <ul>
                <li class="logo">
                    <img src="<c:url value='/resources/images/UTM-LOGO.png'/>" alt="Logo">
                </li>
                <li><a href="#"><img src="<c:url value='/resources/icons/dashboard.png'/>" alt="Dashboard Icon"></a></li>
                <li><a href="#"><img src="<c:url value='/resources/icons/location.png'/>" alt="Location Icon"></a></li>
                <li><a href="#"><img src="<c:url value='/resources/icons/email.png'/>" alt="Messages Icon"></a></li>
                <li><a href="#"><img src="<c:url value='/resources/icons/notification.png'/>" alt="Notifications Icon"></a></li>
                <li><a href="#"><img src="<c:url value='/resources/icons/registration.png'/>" alt="Course Registration Icon"></a></li>
            </ul>
        </div>
    </div>
</body>
</html>
