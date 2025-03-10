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
					<th></th>
					<th>Tên đăng nhập</th>
					<th>Họ và tên</th>
					<th>Giới tính</th>
					<th>Ngày sinh</th>
					<th>Địa chỉ</th>
					<th>Email</th>
					<th>Quyền</th>
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
						<td><c:forEach items="${user.userRoles}" var="u">
								${u.role.id==1?'Admin':'User' }
							
							</c:forEach></td>
						<td><a
							href="${pageContext.request.contextPath }/admin/UpdateUser?userName=${user.userName}"
							class="popup-show"> <i class="fas fa-edit"></i>
						</a> <a
							href="${pageContext.request.contextPath }/admin/deleteUser?userId=${user.id}"
							class="popup-show"
							onclick="return confirm('Are you sure you want to delete this user?');">
								<i class="fas fa-trash-alt"></i>
						</a></td>
					</tr>
				</c:forEach>

			</table>
			<a href="${pageContext.request.contextPath }/admin/createadmin"
				class="popup-show"> <i class="fas fa-user-plus"></i>
			</a>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
					<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
					<c:forEach items="${list_page }" var="page">
						<li class="active"><a
							href="${pageContext.request.contextPath }/admin/PageUserAdmin?page=${page }">${page }</a></li>
					</c:forEach>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
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
