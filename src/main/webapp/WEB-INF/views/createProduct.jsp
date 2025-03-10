<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header_admin.jsp"></jsp:include>
<!-- Main content -->
<section class="content">

	<!-- Default box -->
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">CREATE PRODUCT</h3>
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
			<form:form action="InsertProduct" modelAttribute="product"
				method="post" enctype="multipart/form-data">
				<table class="table table-striped table-bordered">
					<tr>
						<th><label for="name_product">Tên sản phẩm:</label></th>
						<td><form:input path="name_product" id="name_product"
								required="required" class="form-control" /></td>
					</tr>
					<tr>
						<th><label for="price">Giá sản phẩm:</label></th>
						<td><form:input path="price" id="price" type="number"
								required="required" class="form-control" /></td>
					</tr>
					<tr>
						<th><label for="description">Mô tả:</label></th>
						<td><form:input path="description" id="description"
								required="required" class="form-control" /></td>
					</tr>
					<tr>
						<th><label for="imgFile">Ảnh sản phẩm:</label></th>
						<td><input type="file" name="imgFile" id="imgFile"
							class="form-control" multiple="multiple" /></td>
					</tr>
					<tr>
						<th><label for="category">Danh mục:</label></th>
						<td><form:select path="category.catId" id="category"
								class="form-select">
								<c:forEach items="${list_cat}" var="cat">
									<form:option value="${cat.catId}">${cat.catId} - ${cat.name_cat}</form:option>
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<th><label for="producer">Nhà sản xuất:</label></th>
						<td><form:select path="producer.producerId" id="producer"
								class="form-select">
								<c:forEach items="${list_pro}" var="pro">
									<form:option value="${pro.producerId}">${pro.producerId} - ${pro.name_producer}</form:option>
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<th><label for="categorize">Phân loại:</label></th>
						<td><form:select path="categorize.categorizeId"
								id="categorize" class="form-select">
								<c:forEach items="${list_categorize}" var="cat">
									<form:option value="${cat.categorizeId}">${cat.categorizeId} - ${cat.categorizeName}</form:option>
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center"><input type="submit"
							value="Thêm mới" class="btn btn-success btn-lg me-3" /> <input
							type="reset" value="Đặt lại" class="btn btn-warning btn-lg" /></td>
					</tr>
				</table>
			</form:form>
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
