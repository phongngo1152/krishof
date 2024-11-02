<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header_admin.jsp"></jsp:include>
<!-- Main content -->
<section class="content">

	<!-- Default box -->
	<div class="card">
		<div class="card-header">
			<form action="searchCategorizeByName" class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search" name="categorizeName">
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
		<h4>${mess }</h4>
		<div class="card-body" s>
			<table class="table table-border">
				<tr>
					<th>Id</th>
					<th>Name</th>
				</tr>
				<c:forEach items="${list }" var="cat">
					<tr>
						<td>${cat.categorizeId}</td>
						<td>${cat.categorizeName}</td>

						<td><a
							href="${pageContext.request.contextPath }/admin/UpdateCategorize?catId=${cat.categorizeId}"
							class="popup-show">Update</a> <a
							href="${pageContext.request.contextPath }/admin/deleteCategorize?catId=${cat.categorizeId}"
							class="popup-show"onclick="alert('Do you delete')">Delete</a></td>
					</tr>
				</c:forEach>

			</table>
			<a href="${pageContext.request.contextPath }/admin/createCategorize">Create</a>

		</div>
		<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
					<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
					<c:forEach items="${list_page }" var="page">
						<li class="active"><a
							href="${pageContext.request.contextPath }/admin/PageCategorizeAdmin?page=${page }">${page }</a></li>
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