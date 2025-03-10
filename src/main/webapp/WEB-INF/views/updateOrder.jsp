<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="header_admin.jsp"></jsp:include>

<section class="content">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Cập Nhật Đơn Hàng</h3>
        </div>

        <div class="card-body">
            <h4 class="font-weight-bold mb-3">Thông tin đơn hàng</h4>
            <!-- Hiển thị thông tin chi tiết đơn hàng, không cho phép thay đổi -->
            <table class="table table-striped">
                <tr>
                    <td><strong>Mã Đơn Hàng</strong></td>
                    <td>${order.orderId}</td>
                </tr>
                <tr>
                    <td><strong>Họ và Tên</strong></td>
                    <td>${order.fullName}</td>
                </tr>
                <tr>
                    <td><strong>Số Điện Thoại</strong></td>
                    <td>${order.telephone}</td>
                </tr>
                <tr>
                    <td><strong>Email</strong></td>
                    <td>${order.email}</td>
                </tr>
                <tr>
                    <td><strong>Địa Chỉ</strong></td>
                    <td>${order.address}</td>
                </tr>
                <tr>
                    <td><strong>Phương Thức Thanh Toán</strong></td>
                    <td>${order.payments}</td>
                </tr>
                <tr>
                    <td><strong>Vận Chuyển</strong></td>
                    <td>${order.transportation}</td>
                </tr>
                <tr>
                    <td><strong>Ngày Đặt Hàng</strong></td>
                    <td><fmt:formatDate value="${order.date_order}" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><strong>Ngày Nhận</strong></td>
                    <td><fmt:formatDate value="${order.received_date}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </table>

            <h4 class="font-weight-bold mb-3">Cập Nhật Đơn Hàng</h4>
            <form:form action="editOrder" modelAttribute="order" method="post">
                <form:hidden path="orderId" value="${order.orderId}" />

                <div class="form-group row">
                    <label for="fullName" class="col-sm-2 col-form-label"><strong>Họ và Tên</strong></label>
                    <div class="col-sm-10">
                        <form:input path="fullName" id="fullName" class="form-control" value="${order.fullName}" />
                    </div>
                </div>

                <div class="form-group row">
                    <label for="payments" class="col-sm-2 col-form-label"><strong>Phương thức thanh toán</strong></label>
                    <div class="col-sm-10">
                        <form:select path="payments" id="payments" class="form-control">
                            <form:option value="Tiền mặt">Thanh toán khi giao hàng</form:option>
                            <form:option value="Chuyển khoản">Chuyển khoản qua QR Code</form:option>
                        </form:select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="transportation" class="col-sm-2 col-form-label"><strong>Vận chuyển</strong></label>
                    <div class="col-sm-10">
                        <form:select path="transportation" id="transportation" class="form-control">
                            <form:option value="Chuyển phát nhanh">Chuyển phát nhanh</form:option>
                            <form:option value="Nhanh hơn">Nhanh hơn</form:option>
                            <form:option value="Tiết Kiệm">Tiết Kiệm</form:option>
                        </form:select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="telephone" class="col-sm-2 col-form-label"><strong>Số Điện Thoại</strong></label>
                    <div class="col-sm-10">
                        <form:input path="telephone" id="telephone" class="form-control" value="${order.user.telephone}" />
                    </div>
                </div>

                <div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label"><strong>Email</strong></label>
                    <div class="col-sm-10">
                        <form:input path="email" id="email" class="form-control" value="${order.email}" />
                    </div>
                </div>

                <div class="form-group row">
                    <label for="address" class="col-sm-2 col-form-label"><strong>Địa Chỉ</strong></label>
                    <div class="col-sm-10">
                        <form:input path="address" id="address" class="form-control" value="${order.address}" />
                    </div>
                </div>

                <div class="form-group row">
                    <label for="status" class="col-sm-2 col-form-label"><strong>Status</strong></label>
                    <div class="col-sm-10">
                        <form:select path="statusType.id" id="status" class="form-control">

							<c:if test="${order.payments == 'Tiền mặt'}">
								<c:if test="${order.statusType.id == 1}">
									<form:option value="1">Chờ xác nhận</form:option>
									<form:option value="1008">Xác Nhận</form:option>
								</c:if>
								<c:if test="${order.statusType.id == 1008}">
									<form:option value="1008">Xác Nhận</form:option>
									<form:option value="2">Đang giao hàng</form:option>
								</c:if>
								<c:if test="${order.statusType.id == 2}">
									<form:option value="2">Đang giao hàng</form:option>
									<form:option value="3">Đã giao</form:option>
								</c:if>
								<c:if test="${order.statusType.id == 3}">
									<form:option value="3">Đã giao</form:option>
									<form:option value="4">Đã Nhận Hàng</form:option>
								</c:if>
								<c:if test="${order.statusType.id == 4}">
									<form:option value="4">Đã Nhận Hàng</form:option>
								</c:if>
							</c:if>
							<c:if test="${order.payments == 'Chuyển khoản'}">
                             <c:if test="${order.statusType.id == 1}">
                                <form:option value="1">Đang Chờ Xác Nhận</form:option>
                                <form:option value="1008">Xác Nhận</form:option>
                            </c:if>
                            <c:if test="${order.statusType.id == 1008 }">
                                <form:option value="1008">Xác Nhận</form:option>
                                <form:option value="5">Đợi thanh toán</form:option>
                            </c:if>
                            <c:if test="${order.statusType.id == 5}">
                                <form:option value="6">Thanh toán thành công</form:option>
                                <form:option value="2">Đang giao hàng</form:option>
                            </c:if>
                            <c:if test="${order.statusType.id == 6}">
                                 <form:option value="2">Đang giao hàng</form:option>
                                <form:option value="3">Đã giao</form:option>
                            </c:if>
                            <c:if test="${order.statusType.id == 2}">
                                <form:option value="3">Đã giao</form:option>
                                <form:option value="7">Trả Hàng</form:option>
                            </c:if>
                            <c:if test="${order.statusType.id == 3}">
                                <form:option value="7">Trả Hàng</form:option>
                            </c:if>
                            </c:if>
                            <form:option value="1007">Hủy đơn hàng</form:option>
                        </form:select>
                    </div>
                </div>

                <!-- Hidden Fields -->
                <form:hidden path="date_order" value="${formattedDateOrder}" readonly="true" />
                <form:hidden path="received_date" value="${formattedReceivedDate}" readonly="true" />
                <form:hidden path="user.id" value="${order.user.id}" readonly="true" />

                <div class="form-group text-center mt-4">
                    <input type="submit" value="Cập Nhật" class="btn btn-primary btn-lg">
                    <input type="reset" value="Đặt lại" class="btn btn-secondary btn-lg">
                </div>
            </form:form>

        </div>
    </div>
</section>

<jsp:include page="footer_admin.jsp"></jsp:include>
