<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">

	<table class="table table-border">
		<tr>
			<th>Id</th>
			<th><h3>Ngày Đặt Hàng</h3></th>
			<th>Họ Tên</th>
			<th><h3>Trạng Thái</h3></th>
			<th>Sản Phẩm</th>
			<th>Số Lượng</th>
			<th>Hình Ảnh</th>
			<th>Tổng Giá</th>
		</tr>
		<c:set var="totalSum" value="0" />
		<!-- Khai báo biến tổng giá -->

		<c:forEach items="${list }" var="pro" varStatus="st">
			<tr>
				<td>${pro.orders.orderId}</td>
				<td><fmt:formatDate value="${pro.orders.date_order}" /></td>
				<td>${pro.orders.fullName}</td>
				<td>
						<h5 style="color: red">${pro.orders.statusType.status_name}</h5>
					</td>
				<th>${pro.product.name_product}</th>
				<th>${pro.quantity*0.5}kg</th>
				<th><img
					src="${pageContext.request.contextPath }/<c:url value="resources"/>/images/${pro.product.ava}"
					alt="${pro.product.ava}" width="60" /></th>
				<th><fmt:formatNumber value="${pro.totalprice}" pattern="#,###" />
					VND</th>
				<%-- <td><a
							href="${pageContext.request.contextPath }/admin/OrderDetail?orderId=${order.orderId}"
							class="popup-show">Chi Tiết</a> </td> --%>
											<c:set var="totalSum" value="${totalSum + pro.totalprice}" />
							
			</tr>
		</c:forEach>

	</table>
		<h3>Tổng Giá: <fmt:formatNumber value="${totalSum}" pattern="#,###" /> VND</h3>
	
	<br> <a href="${pageContext.request.contextPath }/LoadProducts"
		class="krishok-btn">Quay lại</a>

	<%-- <form:form action="user/Order" modelAttribute="order" method="post">
	
	</form:form> --%>
</div>
<!-- khu vực sản phẩm mua hàng kết thúc -->
<!-- khu vực chân trang bắt đầu -->
<script type="text/javascript">
	function updateQuantity(index) {
		var q = "q" + index;
		var quantity = document.getElementById(q).value;
		var str = "updateOrderQuantity?Id=" + index + "&quantity=" + quantity;
		window.location = str;
		console.log(quantity, index);

	}
</script>

<jsp:include page="footer.jsp"></jsp:include>
