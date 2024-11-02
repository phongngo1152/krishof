<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<jsp:include page="header_admin.jsp"></jsp:include>
<!-- Main content -->
<section class="content">

	<!-- Default box -->
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">UPDATE Order</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove"
					data-toggle="tooltip" title="Remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<h4>${err }</h4>
		<div class="card-body">
			<form:form action="editOrder" modelAttribute="order"
					method="post">

					<table>
					
							<form:input hidden="hidden" path="user.id" readonly="true" value="${order.user.id }"/>
							<form:input hidden="hidden" path="payments" readonly="true" />
							<form:input hidden="hidden" path="transportation" readonly="true" />
							<form:input path="date_order"  type="date" value="${order.date_order }"/>
							<form:input path="orderId"  hidden="hidden"/>
							<form:input path="address" hidden="hidden" placeholder="Address" value="${order.address }"/>
							
						<tr>
							<td><form:input path="fullName" placeholder="Full Name" value="${order.user.fullName }"/></td>
							<td><form:input path="telephone" placeholder="Phone" value="${order.user.telephone }"/></td>
							<td><form:input path="email" type="email" placeholder="Email" value="${order.user.email }"/></td>
						</tr>
						<tr>
							<td>Date Order</td>
							<td><fmt:formatDate value="${order.date_order}"/></td>
						
						</tr>
						<tr>
							<td></td>
							<td><form:select path="status">
							<c:if test="${order.status==0 }">
								<form:option value="1">Xac nhan don hang</form:option>
								<form:option value="0">Dang cho xu ly</form:option>
							</c:if>
							<c:if test="${order.status==1 }">
								<form:option value="1">Xac nhan don hang</form:option>
								<form:option value="2">Dang Giao hang</form:option>
								
							</c:if>
									
								</form:select></td>
						
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Update"> <input
								type="reset" value="reset"></td>
						</tr>
					</table>
				</form:form>
		</div>
		<!-- /.card-body -->
		<div class="card-footer">Footer</div>
		<!-- /.card-footer-->
	</div>
	<!-- /.card -->

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="footer_admin.jsp"></jsp:include>
