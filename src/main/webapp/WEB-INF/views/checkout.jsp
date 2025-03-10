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
			<th>Ngày Đặt Hàng</th>
			<th>Ngày Dự Kiến</th>
			<th>Họ và Tên</th>
			<th>Trạng Thái</th>
			<th>${err }</th>

			<th></th>
		</tr>
		<c:forEach items="${list }" var="order" varStatus="st">
			<tr>
				<td>${order.orderId}</td>
				<td><fmt:formatDate value="${order.date_order}"
						pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${order.received_date}"
						pattern="yyyy-MM-dd" /></td>
				<!-- Hiển thị ngày dự kiến -->

				<td>${order.fullName}</td>
				<td>

					<h5
						style="color: 
				<c:choose>
	                <c:when test="${order.statusType.status_name == 'Đang Chờ Xác Nhận'}">blue</c:when>
					<c:when test="${order.statusType.status_name == 'Đang Xử Lý'}">orange</c:when>
					<c:when test="${order.statusType.status_name == 'Đang Giao Hàng'}">green</c:when>
					<c:when test="${order.statusType.status_name == 'Đã Giao'}">darkgreen</c:when>
					<c:when test="${order.statusType.status_name == 'Đã Hủy'}">red</c:when>
					<c:when test="${order.statusType.status_name == 'Đã Xác Nhận'}">purple</c:when>
					<c:when test="${order.statusType.status_name == 'Đã Nhận'}">teal</c:when>
	                <c:when test="${order.statusType.status_name == 'Received'}">teal</c:when>
                	<c:otherwise>black</c:otherwise>
           		 </c:choose>
				">${order.statusType.status_name}</h5>
				</td>

				<td><c:if test="${order.statusType.id == 3 && order.payments == 'Tiền mặt'}">
						<form:form action="editOrder" modelAttribute="order" method="post">
							<!-- Thay form:input bằng input type="hidden" -->
							<input type="hidden" name="statusType.id" value="4" />
							<form:hidden path="orderId" value="${order.orderId}" />

							<form:hidden path="statusType.id" value="4" readonly="true" />

							<input type="submit" value="Đã Nhận" />
						</form:form>
					</c:if> 
						<c:if test="${order.statusType.id == 3 && order.payments == 'Chuyển khoản'}">
						<form:form action="editOrder" modelAttribute="order" method="post">
							<!-- Thay form:input bằng input type="hidden" -->
							<input type="hidden" name="statusType.id" value="4" />
							<form:hidden path="orderId" value="${order.orderId}" />

							<form:hidden path="statusType.id" value="4" readonly="true" />

							<input type="submit" value="Đã Nhận" />
						</form:form>
					</c:if> 
					<c:if
						test="${order.statusType.id != 1007 && order.statusType.id != 4 && order.statusType.id != 3}">
						<form:form action="editOrder" modelAttribute="order" method="post">
							<!-- Thay form:input bằng input type="hidden" -->
							<form:hidden path="orderId" value="${order.orderId}" />

							<form:hidden path="statusType.id" value="1007" readonly="true" />
							<input type="submit" value="Hủy"
								onclick="confirmCancel('${order.orderId}')" />
						</form:form>
					</c:if> <c:if test="${order.payments == 'Chuyển khoản'}">
						<c:if
							test="${order.statusType.id == 1 || order.statusType.id == 1008 || order.statusType.id == 5}">
							<a
								href="${pageContext.request.contextPath}/user/pay?orderId=${order.orderId}"
								class="btn btn-success btn-sm shadow-sm hover-effect"> Thanh
								Toán </a>
						</c:if>
					</c:if></td>

				<td><a
					href="${pageContext.request.contextPath }/user/OrderDetail?orderId=${order.orderId}"
					class="popup-show">Chi Tiết</a></td>
			</tr>
		</c:forEach>

	</table>
	 </div>
			<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
				<li ><a href="#"><i class="fa fa-angle-left"></i></a></li>
				<c:forEach items="${list_page }" var="page">
					<li class="active"><a href="${pageContext.request.contextPath }/user/PageCheckOut?page=${page }">${page }</a></li>
				</c:forEach>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
		</div> 

	<br> <a href="${pageContext.request.contextPath }/LoadProducts"
		class="krishok-btn">Quay lại</a>

	<%-- <form:form action="user/Order" modelAttribute="order" method="post">
	
	</form:form> --%>
</div>
<!-- shopping product area end -->
<!-- footer area start -->
<script type="text/javascript">
	function updateQuantity(index) {
		var q = "q" + index;
		var quantity = document.getElementById(q).value;
		var str = "updateOrderQuantity?Id=" + index + "&quantity=" + quantity;
		window.location = str;
		console.log(quantity, index);

	}
	function confirmCancel(formId) {
		if (confirm("Bạn có chắc chắn muốn hủy đơn hàng này không?")) {
			document.getElementById("cancelForm-" + formId).submit();
		}
	}
</script>

<jsp:include page="footer.jsp"></jsp:include>
