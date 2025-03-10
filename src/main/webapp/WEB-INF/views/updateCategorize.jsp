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
			<h3 class="card-title">UPDATE CATEGORY</h3>
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
			<form:form action="edittCategorize" modelAttribute="cat" method="post">
			  <table class="table table-bordered" style="width: 50%; margin: auto;">
                    <tr>
                        <td><label for="categorizeId">ID:</label></td>
                        <td><form:input path="categorizeId" id="categorizeId" class="form-control" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td><label for="categorizeName">Tên:</label></td>
                        <td><form:input path="categorizeName" id="categorizeName" class="form-control" required="required" placeholder="Nhập tên" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <button type="submit" class="btn btn-primary btn-lg me-3">Cập nhật</button>
                            <button type="reset" class="btn btn-secondary btn-lg">Đặt lại</button>
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
