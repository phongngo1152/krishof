<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header_admin.jsp"></jsp:include>
<!-- Main content -->
<section class="content">

	<!-- Default box -->
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">ADMIN</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove"
					data-toggle="tooltip" title="Remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<h4>${err }</h4>
		<div class="card-body">
			<div style="text-align: center;">
				<form:form action="InsertAdmin" modelAttribute="u" method="post">
					<table>
						<tr>
							<td>UserName:</td>
							<td><form:input path="userName" required="required" /></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><form:input path="passWord" type="password"
									required="required" /></td>
						</tr>
						<tr>
							<td>Enabled:</td>
							<td><form:radiobutton path="enabled" value="1" />stimulate
								<form:radiobutton path="enabled" value="0" />not active</td>
						</tr>
						<tr>
							<td>Full Name:</td>
							<td><form:input path="fullName" required="required" /></td>
						</tr>
						<tr>
							<td>Gender:</td>
							<td><form:radiobutton path="gender" value="1" />Male <form:radiobutton
									path="gender" value="0" />Female</td>
						</tr>

						<tr>
							<td>Birthday:</td>
							<td><form:input path="birthday" type="date"
									required="required" /></td>
						</tr>
						<tr>
							<td>Address:</td>
							<td><form:textarea path="address" required="required" /></td>
						</tr>
						<tr>
							<td>Phone:</td>
							<td><form:input path="telephone" required="required" /></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td><form:input path="email" type="email"
									required="required" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="insert"> <input
								type="reset" value="reset"></td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer">Footer</div>
		<!-- /.card-footer-->
	</div>
	<!-- /.card -->

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="footer_admin.jsp"></jsp:include>
