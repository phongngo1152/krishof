<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Nội dung chính -->
<div class="container mt-5">
	<div class="text-center">
		<!-- Tiêu đề và thông báo thanh toán thành công -->
		<h1 class="display-4 text-success font-weight-bold">Thanh Toán
			Thành Công!</h1>
		<p class="lead text-muted">Cảm ơn bạn đã thanh toán. Đơn hàng của
			bạn sẽ được xử lý ngay lập tức.</p>

		<!-- Mô tả thanh toán -->
		<div class="mt-4">
			<p class="text-info">Nếu bạn có bất kỳ câu hỏi nào, xin vui lòng
				liên hệ với bộ phận hỗ trợ khách hàng của chúng tôi.</p>
		</div>

		<!-- Nút Xác nhận thanh toán -->
		<div class="mt-4">
			<form:form action="${pageContext.request.contextPath}/user/editOrder" modelAttribute="order" method="post">
				<!-- Truyền orderId và statusType.id để cập nhật đơn hàng -->
				<form:hidden path="orderId" value="${order.orderId}" />
				<form:hidden path="statusType.id" value="6" readonly="true" />

				<!-- Nút xác nhận thanh toán thành công -->
				<div class="mt-3">
					<input type="submit" value="Xác
				nhận thanh toán"
						class="btn btn-success btn-lg px-5 py-3" />
				</div>
			</form:form>
		</div>

		<!-- Form để cập nhật trạng thái đơn hàng -->


	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
