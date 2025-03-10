<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Nội dung chính -->
<div class="container mt-5">
    <div class="text-center">
        <!-- Tiêu đề -->
        <h3 class="font-weight-bold text-success">Thanh toán qua QR Code</h3>
        <p class="text-muted">Quét mã QR bên dưới để hoàn tất thanh toán cho đơn hàng của bạn.</p>

        <!-- Mã QR -->
        <div class="mt-4">
            <img src="<c:url value='/resources/images/Qr.png'/>" alt="QR Code" class="img-fluid" style="width: 300px;">
        </div>

        <!-- Hướng dẫn thanh toán -->
        <div class="mt-4">
            <h5 class="font-weight-bold text-success">Hướng dẫn:</h5>
            <p>1. Mở ứng dụng ngân hàng của bạn.</p>
            <p>2. Chọn mục "Thanh toán qua QR".</p>
            <p>3. Quét mã QR bên trên để thanh toán.</p>
            <p>4. Kiểm tra thông tin và hoàn tất giao dịch.</p>
        </div>

        <!-- Nút Xác nhận -->
        <div class="mt-4">
            <a href="orderSuccess" class="btn btn-success btn-lg px-4 py-2">Xác nhận thanh toán</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
