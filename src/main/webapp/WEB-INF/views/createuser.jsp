<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <h2 style="text-align: center;">Create User</h2>
    
    <!-- Display error message if it exists -->
    <c:if test="${not empty err}">
        <div class="alert alert-danger" style="text-align: center;">
            ${err}
        </div>
    </c:if>
    
    <!-- Display success message if it exists -->
    <c:if test="${not empty mess}">
        <div class="alert alert-success" style="text-align: center;">
            ${mess}
        </div>
    </c:if>

    <div style="text-align: center;">
        <form:form action="InsertUser" modelAttribute="u" method="post">
          <table class="table table-bordered" style="margin: auto; width: 50%;">
                    <tr>
                        <td><label for="userName">Tên người dùng:</label></td>
                        <td><form:input path="userName" id="userName" class="form-control" required="required" placeholder="Nhập tên người dùng"/></td>
                    </tr>
                    <tr>
                        <td><label for="passWord">Mật khẩu:</label></td>
                        <td><form:input path="passWord" id="passWord" type="password" class="form-control" required="required" placeholder="Nhập mật khẩu"/></td>
                    </tr>
                    <tr>
                        <td><label for="enabled">Kích hoạt:</label></td>
                        <td>
                            <form:radiobutton path="enabled" value="1" id="enabled" /> Kích hoạt
                            <form:radiobutton path="enabled" value="0" /> Không kích hoạt
                        </td>
                    </tr>
                    <tr>
                        <td><label for="fullName">Họ và tên:</label></td>
                        <td><form:input path="fullName" id="fullName" class="form-control" required="required" placeholder="Nhập họ và tên"/></td>
                    </tr>
                    <tr>
                        <td><label for="gender">Giới tính:</label></td>
                        <td>
                            <form:radiobutton path="gender" value="1" id="gender" /> Nam 
                            <form:radiobutton path="gender" value="0" /> Nữ
                        </td>
                    </tr>
                    <tr>
                        <td><label for="birthday">Ngày sinh:</label></td>
                        <td><form:input path="birthday" type="date" id="birthday" class="form-control" required="required" /></td>
                    </tr>
                    <tr>
                        <td><label for="address">Địa chỉ:</label></td>
                        <td><form:textarea path="address" id="address" class="form-control" required="required" placeholder="Nhập địa chỉ"/></td>
                    </tr>
                    <tr>
                        <td><label for="telephone">Số điện thoại:</label></td>
                        <td><form:input path="telephone" id="telephone" class="form-control" required="required" placeholder="Nhập số điện thoại"/></td>
                    </tr>
                    <tr>
                        <td><label for="email">Email:</label></td>
                        <td><form:input path="email" type="email" id="email" class="form-control" required="required" placeholder="Nhập email"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <button type="submit" class="btn btn-primary btn-lg me-3">Gửi</button>
                            <button type="reset" class="btn btn-secondary btn-lg">Đặt lại</button>
                        </td>
                    </tr>
                </table>
        </form:form>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
