<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header_admin.jsp"></jsp:include>
<!-- Main content -->
<section class="content">

	<!-- Default box -->
	<div class="card">
		<div class="card-header">
			<form action="searchProductByName" class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search" name="productName">
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
		<div class="card-body">
			<table class="table table-border">
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Price</th>
					<th>Description</th>
					<th>Category</th>
					<th>Producer</th>
					<th>Categorize_id</th>
					<th>Avarta</th>
				</tr>
				<c:forEach items="${list }" var="pro">
					<tr>
						<td>${pro.proId}</td>
						<td>${pro.name_product}</td>
						<td>${pro.price}</td>
						<td>${pro.description}</td>
						<td>${pro.category.name_cat}</td>
						<td>${pro.producer.name_producer}</td>
						<td>${pro.categorize.categorizeName}</td>
						<td><img src="${pageContext.request.contextPath }/<c:url value="resources"/>/images/${pro.ava}"alt="${pro.ava}"width="120" /></td>


						<td><a
							href="${pageContext.request.contextPath }/admin/UpdateProduct?proId=${pro.proId}"
							class="popup-show">Update</a> <a
							href="${pageContext.request.contextPath }/admin/deleteProduct?proId=${pro.proId}"
							class="popup-show"onclick="alert('Do you delete')">Delete</a></td>
					</tr>
				</c:forEach>

			</table>
			<a href="${pageContext.request.contextPath }/admin/createProduct">Create</a>

		</div>
			<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
				<li ><a href="#"><i class="fa fa-angle-left"></i></a></li>
				<c:forEach items="${list_page }" var="page">
					<li class="active"><a href="${pageContext.request.contextPath }/admin/PageProductAdmin?page=${page }">${page }</a></li>
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