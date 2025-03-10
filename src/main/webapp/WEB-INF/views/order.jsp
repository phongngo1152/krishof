<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-md-7">
			<div class="card shadow-lg border-radius-10">
				<div class="card-header text-center bg-success text-white">
					<h3 class="font-weight-bold">Chi Tiết Hóa Đơn</h3>
				</div>
				<div class="card-body">
					<form:form action="InsertOrder" modelAttribute="order"
						method="post">
						<table class="table table-bordered">
							<tr>
								<td class="font-weight-bold text-success">Họ và Tên</td>
								<td><form:input path="fullName" class="form-control"
										value="${user.fullName}" /></td>
							</tr>
							<tr>
								<td class="font-weight-bold text-success">Số điện thoại</td>
								<td><form:input path="telephone" class="form-control"
										value="${user.telephone}" /></td>
							</tr>
							<tr>
								<td class="font-weight-bold text-success">Email</td>
								<td><form:input path="email" type="email"
										class="form-control" value="${user.email}" /></td>
							</tr>
							<tr>
								<td class="font-weight-bold text-success">Địa chỉ</td>
								<td><form:textarea path="address" class="form-control"></form:textarea></td>
							</tr>
							<tr>
								<td class="font-weight-bold text-success">Phương thức thanh
									toán</td>
								<td><form:select path="payments" class="form-control">
										<form:option value="Tiền mặt">Thanh toán khi giao hàng</form:option>
										<form:option value="Chuyển khoản">Chuyển khoản qua QR Code</form:option>
									</form:select></td>
							</tr>
							<tr>
								<td class="font-weight-bold text-success">Vận chuyển</td>
								<td><form:select path="transportation" class="form-control">
										<form:option value="Chuyển phát nhanh">Chuyển phát nhanh</form:option>
										<form:option value="Nhanh hơn">Nhanh hơn</form:option>
										<form:option value="Tiết Kiệm">Tiết Kiệm</form:option>
									</form:select></td>
							</tr>
						</table>

						<form:hidden path="orderId" />
						<form:hidden path="user.id" value="${user.id}" />
						<form:hidden path="receive" value="0" />
						<form:hidden path="date_order" value="${currentDate}" />
						<form:hidden path="received_date" />
						<form:hidden path="statusType.id" value="1" />
						

						<div class="form-group text-center mt-4">
							<input type="submit" value="Đặt Hàng"
								class="krishok-btn btn btn-lg px-4 py-2 mr-3"> <input
								type="reset" value="Đặt lại"
								class="btn btn-outline-success btn-lg px-4 py-2">
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<div class="col-md-5">
			<div class="card shadow-lg">
				<div class="card-header text-center bg-success text-white">
					<h3 class="font-weight-bold">Chi Tiết Đơn Hàng</h3>
				</div>
				<div class="card-body">
					<table class="table">
						<tr>
							<th style="max-width: 100%">Sản phẩm</th>
							<th>Số lượng</th>
							<th>Giá</th>
							<th>Hình ảnh</th>
						</tr>
						<c:set var="totalSum" value="0" />
						<c:forEach items="${list_card }" var="pro" varStatus="st">
							<tr>
								<td
									style="max-width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									${pro.name_product }</td>
								<td>${pro.quantity*0.5}kg</td>
								<td><fmt:formatNumber value="${pro.price}" pattern="#,###" />
									VND</td>
								<td><img
									src="${pageContext.request.contextPath}/resources/images/${pro.ava}"
									alt="${pro.ava}" width="60" /></td>
								<c:set var="totalSum" value="${totalSum + pro.totalQuantity}" />
							</tr>
						</c:forEach>
					</table>

					<h3>
						Tổng Giá:
						<fmt:formatNumber value="${totalSum}" pattern="#,###" />
						VND
					</h3>
				</div>
			</div>
		</div>
	</div>

	<br> <a href="${pageContext.request.contextPath }/LoadProducts"
		class="krishok-btn">Quay lại</a>
</div>
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
