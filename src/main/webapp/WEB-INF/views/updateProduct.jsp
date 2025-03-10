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
			<h3 class="card-title">UPDATE PRODUCT</h3>
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
			<form:form action="editProduct" modelAttribute="product"
				method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th><strong>ID</strong></th>
						<td><form:input path="proId" required="required"
								readonly="true" class="form-control" /></td>
					</tr>

					<tr>
						<th><strong>Tên</strong></th>
						<td><form:input path="name_product" required="required"
								class="form-control" /></td>
					</tr>
					<tr>
						<th><strong>Giá</strong></th>
						<td><form:input path="price" type="number"
								required="required" class="form-control" /></td>
					</tr>
					<tr>
						<th><strong>Mô tả</strong></th>
						<td><form:input path="description" required="required"
								class="form-control" /></td>
					</tr>
					<tr>
						<th><strong>Ảnh đại diện</strong></th>
						<td><input type="file" name="imgFile" multiple="multiple"
							class="form-control" /></td>
					</tr>
					<tr>
						<th><strong>Danh mục</strong></th>
						<td><form:select path="category.catId" class="form-control">
								<c:forEach items="${list_cat}" var="cat">
									<form:option value="${cat.catId}">${cat.catId} - ${cat.name_cat}</form:option>
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<th><strong>Nhà sản xuất</strong></th>
						<td><form:select path="producer.producerId"
								class="form-control">
								<c:forEach items="${list_pro}" var="pro">
									<form:option value="${pro.producerId}">${pro.producerId} - ${pro.name_producer}</form:option>
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<th><strong>Phân loại</strong></th>
						<td><form:select path="categorize.categorizeId"
								class="form-control">
								<c:forEach items="${list_categorize}" var="cat">
									<form:option value="${cat.categorizeId}">${cat.categorizeId} - ${cat.categorizeName}</form:option>
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button type="submit" class="btn btn-primary">Cập nhật</button>
							<button type="reset" class="btn btn-secondary">Đặt lại</button>
						</td>
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
