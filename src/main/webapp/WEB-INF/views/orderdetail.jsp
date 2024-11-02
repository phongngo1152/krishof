<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	
		
	
	
		<form:form action="user/Order" modelAttribute="list" method="post">
		<table class="table table-border">
			<tr style="max-width: 100%">
				<th style="max-width: 100%">Product</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Image</th>
				<th>Total Price</th>
				<th></th>
			</tr>
			<c:forEach items="${list }" var="pro" varStatus="st">
				<tr style="max-width: 100%">
					<td>${pro.name_product }</td>
					<td><input id="q${st.index}" name="quantity" value="${pro.quantity }"
						type="number" onblur="updateQuantity(${st.index })" /></td>
					<td>${pro.price }</td>
					<td><img src="<c:url value="resources"/>/images/${pro.ava}"
						alt="${pro.ava}" width="60" /></td>
					<td>${pro.totalQuantity }</td>
					<td><a href="DeleteOrder?Id=${st.index }"
						onclick="alert('Do you delete')">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${b == true}">
			<input class="krishok-btn" type="submit" name="submit" value="PAYMET" />
		</c:if>
	</form:form>
	<h3>Total Price:${totalpricee }</h3>
	
	<br>
	
	<a href="Product" class="krishok-btn">Continue shopping</a>
	
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
