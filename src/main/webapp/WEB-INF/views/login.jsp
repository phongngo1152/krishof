<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
	<h1>Login</h1>
	<h2>${mess}</h2>
	<form name='loginForm'
		action="<c:url value='j_spring_security_login' />" method='POST'>
		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username' required="required"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' required="required"/></td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					value="login" /></td>
			</tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>

