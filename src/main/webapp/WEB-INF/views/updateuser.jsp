<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div style="text-align: center;">
		<form:form action="editUser" modelAttribute="u" method="post">
			<table>
				<tr>
					<td>ID:</td>
					<td><form:input path="id" readonly="true" /></td>
				</tr>
				<tr>
					<td>UserName:</td>
					<td><form:input path="userName" readonly="true"/></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><form:input path="passWord" type="password" /></td>
				</tr>
				<tr>
					<td>Enabled:</td>
					<td><form:radiobutton path="enabled" value="1" />stimulate <form:radiobutton
							path="enabled" value="0" />not active</td>
				</tr>
				<tr>
					<td>Full Name:</td>
					<td><form:input path="fullName" /></td>
				</tr>
				<tr>
					<td>Gender:</td>
					<td><form:radiobutton path="gender" value="1" />Male <form:radiobutton
							path="gender" value="0" />Female</td>
				</tr>

				<tr>
					<td>Birthday:</td>
					<td><form:input path="birthday" type="date" /></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><form:textarea path="address" /></td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td><form:input path="telephone" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><form:input path="email" type="email" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Update"> <input
						type="reset" value="reset"></td>
				</tr>
			</table>
		</form:form>
	</div>
</div>
<!-- shopping product area end -->
<!-- footer area start -->
<jsp:include page="footer.jsp"></jsp:include>