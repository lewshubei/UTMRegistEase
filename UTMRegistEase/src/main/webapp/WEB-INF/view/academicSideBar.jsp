<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<body>
	<div class="sidebar">
		<div class="sidebar-container">
			<ul>
				<li class="logo"><img src="/UTMRegistEase/resources/images/UTM-LOGO.png" alt="Logo"></li>
				<li><a href="<c:url value='/UTMRegistEase/academic/home'/>"><img src="/UTMRegistEase/resources/icons/dashboard.png" alt="Dashboard Icon"></a></li>
				<li><a href="<c:url value='/UTMRegistEase/academic/request'/>"><img src="/UTMRegistEase/resources/icons/request.png" alt="Location Icon"></a></li>
			</ul>
		</div>
	</div>
</body>
</html>