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
			<div class="d-flex justify-content-center">
        <form:form action="InsertImage" modelAttribute="images" method="post" enctype="multipart/form-data" class="w-50">
            <table class="table table-bordered">
                <tr>
                    <td><label for="product">Sản phẩm:</label></td>
                    <td>
                        <form:select path="product.proId" id="product" class="form-control">
                            <c:forEach items="${list}" var="pro">
                                <form:option value="${pro.proId}">${pro.proId} - ${pro.name_product}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <th><label for="imgFile">Hình ảnh:</label></th>
                    <td><input type="file" name="imgFile" id="imgFile" class="form-control" multiple="multiple" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                        <input type="submit" value="Thêm mới" class="btn btn-primary me-2" />
                        <input type="reset" value="Đặt lại" class="btn btn-secondary" />
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
