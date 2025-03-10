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
			<h3 class="card-title">CREATE IMAGE</h3>
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
			<form:form action="editImage" modelAttribute="images" method="post"
				enctype="multipart/form-data">
				<table>
					<tr>
						<th>ID</th>
						<td><form:input path="imageId" readonly="true" /></td>
					</tr>
					<tr>
						<th>Sản Phẩm</th>
						<td><form:select path="product.proId">
								<c:forEach items="${list }" var="pro">
									<form:option value="${pro.proId}">${pro.proId } - ${pro.name_product }</form:option>

								</c:forEach>


							</form:select></td>
					</tr>
					<tr>
						<th>Ảnh</th>
						<td><img
							src="${pageContext.request.contextPath }/<c:url value="resources"/>/images/${images.nameImage}"
							alt="${images.nameImage}" width="120" /></td>

						<td><input type="file" name="imgFile" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Update"> <input
							type="reset" value="reset"></td>
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
