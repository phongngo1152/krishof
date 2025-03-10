<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="header.jsp"></jsp:include>

<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<div class="container">
    <h2>Sản phẩm yêu thích của bạn</h2>
    
    <!-- Hiển thị thông báo alert nếu có -->
    <c:if test="${not empty mess}">
        <script type="text/javascript">
            alert("${mess}");
        </script>
    </c:if>

    <c:if test="${not empty err}">
        <script type="text/javascript">
            alert("${err}");
        </script>
    </c:if>

    <form:form action="user/favorites" modelAttribute="favoritesList" method="post">
        <table class="table table-border">
            <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Hình ảnh</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${favoritesList}" var="favProduct">
                    <tr>
                        <td>${favProduct.product.name_product}</td>
                        <td><fmt:formatNumber	value="${favProduct.product.price}" pattern="#,###" /> VND
                   </td>
                        <td>
                            <div class="position-relative">
                            <img src="${pageContext.request.contextPath}/resources/images/${favProduct.product.ava}" alt="${favProduct.product.ava}" width="60"/>

                                <i class="bi bi-heart-fill position-absolute top-0 end-0 p-2 text-danger" style="font-size: 20px;"></i>
                            </div>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath }/user/deleteFavorite?favorId=${favProduct.id}"
                               class="popup-show"
                               onclick="return confirm('Bạn chắc chắn muốn xóa sản phẩm này khỏi danh sách yêu thích?');">
                                <i class="fas fa-trash-alt"></i> 
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </form:form>

    <a href="${pageContext.request.contextPath }/Product" class="btn btn-primary">
        <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
    </a>
</div>

<jsp:include page="footer.jsp"></jsp:include>
