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
			<h3 class="card-title">CREATE CATEGORY</h3>
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
			<div class="d-flex justify-content-center">
				<form:form action="InsertCat" modelAttribute="cat" method="post"
					class="w-50">
					<table class="table table-bordered">
						<tr>
							<th>Tên Danh Mục</th>
							<td><form:input path="name_cat" required="required"
									class="form-control" /></td>
						</tr>
						<tr>
						
							<td colspan="2" class="text-center"><input type="submit"
								value="Insert" class="btn btn-primary me-2" /> <input
								type="reset" value="Reset" class="btn btn-secondary" /></td>
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
