<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="contact-form">
				<h3>Shipping Address</h3>
				<form:form action="InsertOrder" modelAttribute="order"
					method="post">

					<table>
					
							<form:input hidden="hidden" path="user.id" readonly="true" value="${user.id }"/>
							<form:input hidden="hidden" path="status" readonly="true" value="0"/>
							<form:input hidden="hidden" path="receive" readonly="true" value="0"/>
							
							
							
						<tr>
							<td><form:input path="fullName" placeholder="Full Name" value="${user.fullName }"/></td>
							
							<td><form:input path="telephone" placeholder="Phone" value="${user.telephone }"/></td>
							<td><form:input path="email" type="email" placeholder="Email" value="${user.email }"/></td>
						</tr>
						<tr>
							<td>Date Order</td>
							<td><form:input path="date_order" type="date" /></td>
						
						</tr>
						<tr>
							<td>Payments:</td>
							<td><form:select path="payments">
									<form:option value="Cash">Cash</form:option>
									<form:option value="Transfer">Transfer</form:option>
								</form:select></td>
						</tr>
						<tr>
							<td>Transportation:</td>
							<td><form:select path="transportation">
									<form:option value="Express">Express</form:option>
									<form:option value="Faster">Faster</form:option>
									<form:option value="Economical">Economical</form:option>
								</form:select></td>
						</tr>
						<tr >
						<td>Address:</td>
							<td><form:textarea path="address" placeholder="Address" value="${user.address }"/></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Order"> <input
								type="reset" value="reset"></td>
						</tr>
					</table>
				</form:form>

			</div>
		</div>
	</div>
</div>
<!-- shopping product area end -->
<!-- footer area start -->
<jsp:include page="footer.jsp"></jsp:include>
