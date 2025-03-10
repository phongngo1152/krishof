<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Main content -->
<section class="content" style="padding: 40px 20px;">
	<div class="container">
		<div class="card mx-auto"
			style="max-width: 600px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
			<div class="card-body text-center" style="padding: 30px;">
				<img
					src="https://img.icons8.com/cute-clipart/64/000000/checkmark.png"
					alt="Success Icon">
				<h4 class="mt-3" style="color: #28a745; font-weight: bold;">Cảm
					Ơn Bạn!</h4>
				<h3 class="mt-2" style="color: #343a40;">Bạn Đã Đặt Hàng Thành
					Công!</h3>

				<!-- Kiểm tra giá trị của statusType.id -->
				<c:choose>
					<c:when test="${statusType.id == 1}">
						<p class="text-muted mt-3">Đang chờ xác nhận từ hệ thống.</p>
					</c:when>
					<c:when test="${statusType.id == 1008 || statusType.id == 5}">
						<p class="text-muted mt-3">Chúng tôi sẽ xử lý đơn hàng của bạn trong thời gian sớm nhất.</p>
					</c:when>
					<c:otherwise>
						<p class="text-muted mt-3">Trạng thái đơn hàng: Đang chờ xử lý.</p>
					</c:otherwise>
				</c:choose>

				<!-- Thêm liên kết quay lại trang Checkout nếu cần -->
				<a href="${pageContext.request.contextPath}/user/Checkout" class="btn btn-secondary mt-3" style="padding: 10px 30px; font-size: 16px; border-radius: 5px;">
					Quay lại trang Checkout
				</a>

				<br><br>
				<c:if test="${payment == 'Chuyển khoản'}">
					<c:if
						test="${statusType.id == 1008 || statusType.id == 5}">
						<a href="${pageContext.request.contextPath}/user/pay?orderId=${order_id}"
							class="btn btn-primary"
							style="padding: 10px 30px; font-size: 16px; border-radius: 5px;">Tiếp
							Tục Thanh Toán</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
