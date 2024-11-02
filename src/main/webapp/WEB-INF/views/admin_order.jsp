<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
					<th>Date Order</th>
					<th>FullName</th>
					<th>Payments</th>
					<th>Status</th>
					<th></th>
				</tr>
				<c:forEach items="${list }" var="order">
					<tr>
						<td>${order.orderId}</td>
						<td><fmt:formatDate value="${order.date_order}"/></td>
						<td>${order.fullName}</td>
						<td>${order.payments}</td>
						<td>
							${order.status==0?'<h5 style="color: red">Dang cho xu ly</h5>':''}
							${order.status==2?'<h5 style="color: yellow">Dang giao hang</h5>':''}
							${order.status==1?'<h5 style="color: blue">Da Xac nhan</h5>':''}
						</td>
						<td><a
							href="${pageContext.request.contextPath }/admin/UpdateOrder?orderId=${order.orderId}"
							class="popup-show">Update</a> </td>
					</tr>
				</c:forEach>

			</table>
		</div>
			<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
				<li ><a href="#"><i class="fa fa-angle-left"></i></a></li>
				<c:forEach items="${list_page }" var="page">
					<li class="active"><a href="${pageContext.request.contextPath }/admin/PageOrderAdmin?page=${page }">${page }</a></li>
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