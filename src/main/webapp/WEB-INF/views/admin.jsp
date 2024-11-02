<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header_admin.jsp"></jsp:include>
<!-- Main content -->
<section class="content">

	<!-- Default box -->
	<div class="card">
		<div class="card-header">
			<form action="searchUserByName" class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search" name="userName">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>
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
			<table class="table table-border">
				<tr>
					<th>Id</th>
					<th>Username</th>
					<th>Fullname</th>
					<th>Gender</th>
					<th>Birthday</th>
					<th>Address</th>
					<th>Email</th>
					<th>Role</th>
				</tr>
				<c:forEach items="${list }" var="user">
					<tr>
						<td>${user.id}</td>
						<td>${user.userName}</td>
						<td>${user.fullName}</td>
						<td>${user.gender==true?'Nam':'Nu'}</td>
						<td>${user.birthday}</td>
						<td>${user.address}</td>
						<td>${user.email}</td>
						<td>
							<c:forEach items="${user.userRoles}" var="u">
								${u.role.id==1?'Admin':'User' }
							
							</c:forEach>
						
						</td>
						<td><a
							href="${pageContext.request.contextPath }/admin/UpdateUser?userName=${user.userName}"
							class="popup-show">Update</a> <a
							href="${pageContext.request.contextPath }/admin/deleteUser?userId=${user.id}"
							class="popup-show"onclick="alert('Do you delete')"> Delete </a></td>
					</tr>
				</c:forEach>

			</table>
			<a href="${pageContext.request.contextPath }/admin/createadmin">Create</a>
		</div>
	
		<!-- /.card-body -->
		<div class="card-footer"></div>
		<!-- /.card-footer-->
	</div>
	<!-- /.card -->

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="footer_admin.jsp"></jsp:include>
