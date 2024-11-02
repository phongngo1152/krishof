<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<jsp:include page="header.jsp"></jsp:include>

<div class="container">

			<table class="table table-border">
				<tr>
					<th>Id</th>
					<th><h3>Date Order</h3></th>
					<th>FullName</th>
					<th><h3>Status</h3></th>
					<th>Product</th>
					<th>Quantity</th>
					<th>Image</th>
					<th>Total Price</th>
				</tr>
				<c:forEach items="${list }" var="pro" varStatus="st">
					<tr>
						<td>${pro.orders.orderId}</td>
						<td><fmt:formatDate value="${pro.orders.date_order}"/></td>
						<td>${pro.orders.fullName}</td>
						<td>
							<c:if test="${pro.orders.receive==0 }">
							${pro.orders.status==0?'<h5 style="color: red">Dang cho xu ly</h5>':''}
							${pro.orders.status==2?'<h5 style="color: yellow">Dang giao hang</h5>':''}
							${pro.orders.status==1?'<h5 style="color: blue">Dang Xac nhan</h5>':''}
							</c:if> 
							${pro.orders.receive==1?'<h5 style="color: green">Da Nhan hang</h5>':''}
							<c:if test="${pro.orders.receive==0 && pro.orders.status==2}">
								<form:form action="editOrder" modelAttribute="ords" method="post">
										<form:input hidden="hidden" path="orderId" value="${pro.orders.orderId}"/>
										<form:input hidden="hidden"  path="receive" readonly="true" value="1"/>
										<input type="submit" value="Da Nhan don hang">
								</form:form>
							
							</c:if> 
						</td>
						<th>${pro.product.name_product}</th>
						<th>${pro.quantity}</th>
						<th><img src="${pageContext.request.contextPath }/<c:url value="resources"/>/images/${pro.product.ava}"
						alt="${pro.product.ava}" width="60" /></th>
						<th>${pro.totalprice}</th>
						<%-- <td><a
							href="${pageContext.request.contextPath }/admin/OrderDetail?orderId=${order.orderId}"
							class="popup-show">Detail</a> </td> --%>
					</tr>
				</c:forEach>

			</table>	
	<br>
	
	<a href="${pageContext.request.contextPath }/LoadProducts" class="krishok-btn">back</a>
	
	<%-- <form:form action="user/Order" modelAttribute="order" method="post">
	
	</form:form> --%>
</div>
<!-- shopping product area end -->
<!-- footer area start -->
<script type="text/javascript">

			function updateQuantity(index) {
				var q = "q"+index;
				var quantity = document.getElementById(q).value;
				var str = "updateOrderQuantity?Id="+index+"&quantity="+quantity;
	 			window.location=str;
				console.log(quantity,index);
				
			}
</script>

<jsp:include page="footer.jsp"></jsp:include>
