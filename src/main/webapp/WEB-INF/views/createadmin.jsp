<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header_admin.jsp"></jsp:include>
<!-- Main content -->
<section class="content">

	<!-- Default box -->
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">ADMIN</h3>
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
        <form:form action="InsertAdmin" modelAttribute="u" method="post" class="w-50">
            <table class="table table-bordered">
                <tr>
                    <th>Tên đăng nhập:</th>
                    <td>
                        <form:input path="userName" required="required" class="form-control" />
                    </td>
                </tr>
                <tr>
                    <th>Mật khẩu:</th>
                    <td>
                        <form:input path="passWord" type="password" required="required" class="form-control" />
                    </td>
                </tr>
                <tr>
                    <th>Kích hoạt:</th>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="form-check me-3">
                                <form:radiobutton path="enabled" value="1" class="form-check-input" />
                                <label class="form-check-label">Kích hoạt</label>
                            </div>
                            <div class="form-check">
                                <form:radiobutton path="enabled" value="0" class="form-check-input" />
                                <label class="form-check-label">Không hoạt động</label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>Họ và tên:</th>
                    <td>
                        <form:input path="fullName" required="required" class="form-control" />
                    </td>
                </tr>
                <tr>
                    <th>Giới tính:</th>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="form-check me-3">
                                <form:radiobutton path="gender" value="1" class="form-check-input" />
                                <label class="form-check-label">Nam</label>
                            </div>
                            <div class="form-check">
                                <form:radiobutton path="gender" value="0" class="form-check-input" />
                                <label class="form-check-label">Nữ</label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>Ngày sinh:</th>
                    <td>
                        <form:input path="birthday" type="date" required="required" class="form-control" />
                    </td>
                </tr>
                <tr>
                    <th>Địa chỉ:</th>
                    <td>
                        <form:textarea path="address" required="required" class="form-control"></form:textarea>
                    </td>
                </tr>
                <tr>
                    <th>Điện thoại:</th>
                    <td>
                        <form:input path="telephone" required="required" class="form-control" />
                    </td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td>
                        <form:input path="email" type="email" required="required" class="form-control" />
                    </td>
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
