<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<form:form action="user/Order" modelAttribute="list" method="post">
		<table class="table table-border">
			<tr style="max-width: 100%">
				<th style="max-width: 100%">Sản phẩm</th>
				<th>Số lượng</th>
				<th>Giá</th>
				<th>Hình ảnh</th>
				<th>Tổng giá</th>
				<th></th>
			</tr>
			<c:forEach items="${list }" var="pro" varStatus="st">
				<tr style="max-width: 100%">
					<td>${pro.name_product }</td>
					<td><input id="q${st.index}" name="quantity"
						value="${pro.quantity }" type="number"
						onblur="updateQuantity(${st.index })" /></td>
					<td><fmt:formatNumber value="${pro.price}" pattern="#,###" /> VND</td>
					<td><img src="<c:url value="resources"/>/images/${pro.ava}"
						alt="${pro.ava}" width="60" /></td>
					<td><fmt:formatNumber value="${pro.totalQuantity}" pattern="#,###" /> VND</td>
					<td><a href="DeleteOrder?Id=${st.index }"
						onclick="alert('Bạn có chắc chắn muốn xóa?')"><i class="fas fa-trash-alt"></a></td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${b == true}">
			<input class="krishok-btn" type="submit" name="submit"
				value="THANH TOÁN" />
		</c:if>
	</form:form>
	<h3>Tổng giá: <fmt:formatNumber value="${totalpricee}" pattern="#,###" /> VND</h3>

	<br> <a href="Product" class="krishok-btn">Tiếp tục mua sắm</a>

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
</script>

<jsp:include page="footer.jsp"></jsp:include>
