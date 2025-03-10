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
			<h3 class="card-title">CREATE PRODUCER</h3>
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
			<form:form action="InsertProducer" modelAttribute="producer"
				method="post" class="w-75">
				<table class="table table-striped table-bordered">
					<tr>
						<th><label for="name_producer">Tên nhà sản xuất:</label></th>
						<td><form:input path="name_producer" id="name_producer"
								required="required" class="form-control" /></td>
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
