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
					<th>Date Order</th>
					<th>FullName</th>
					<th>Status</th>
					<th></th>
				</tr>
				<c:forEach items="${list }" var="order" varStatus="st">
					<tr>
						<td>${order.orderId}</td>
						<td><fmt:formatDate value="${order.date_order}"/></td>
						<td>${order.fullName}</td>
						<td>
							<c:if test="${order.receive==0 }">
							${order.status==0?'<h5 style="color: red">Dang cho xu ly</h5>':''}
							${order.status==2?'<h5 style="color: yellow">Dang giao hang</h5>':''}
							${order.status==1?'<h5 style="color: blue">Dang Xac nhan</h5>':''}
							</c:if> 
							${order.receive==1?'<h5 style="color: green">Da Nhan hang</h5>':''}
							<c:if test="${order.receive==0&&order.status==2}">
								<form:form action="editOrder" modelAttribute="ords" method="post">
										<form:input hidden="hidden" path="orderId" value="${order.orderId}"/>
										<form:input hidden="hidden"  path="receive" readonly="true" value="1"/>
										<input type="submit" value="Da Nhan don hang">
								</form:form>
							
							</c:if> 
						</td>
						<td><a
							href="${pageContext.request.contextPath }/user/OrderDetail?orderId=${order.orderId}"
							class="popup-show">Detail</a> </td>
					</tr>
				</c:forEach>

			</table>
		<%-- </div>
			<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
				<li ><a href="#"><i class="fa fa-angle-left"></i></a></li>
				<c:forEach items="${list_page }" var="page">
					<li class="active"><a href="${pageContext.request.contextPath }/PageCheckOut?page=${page }">${page }</a></li>
				</c:forEach>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
		</div> --%>
	
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
