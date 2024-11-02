<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div style="text-align: center;">
		<h1>Information:</h1>
		<h3>User name: ${user.username}</h3>
		<h3>Full name: ${user.fullName}</h3>
		<h3>Address: ${user.address}</h3>
		<h3>Email: ${user.email}</h3>
		<h3>Telephone: ${user.telephone}</h3>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>