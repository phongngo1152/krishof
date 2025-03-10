<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp"></jsp:include>
<section class="theme2 hero-area ptb-80">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2">
				<div class="hero-area-content">
					<h1>Chúng tôi cung cấp tất cả các sản phẩm hữu cơ</h1>
					<p>Chào mừng bạn đến với cửa hàng của chúng tôi, nơi cung cấp
						các sản phẩm hữu cơ chất lượng cao. Tại đây, bạn có thể tìm thấy
						mọi thứ từ rau củ quả tươi ngon cho đến các sản phẩm thực phẩm chế
						biến sẵn, tất cả đều được sản xuất từ nguyên liệu hữu cơ, bảo vệ
						sức khỏe và môi trường. Chúng tôi cam kết mang đến cho bạn những
						sản phẩm an toàn, lành mạnh và có lợi cho sức khỏe. Hãy khám phá
						ngay hôm nay để tận hưởng những sản phẩm tuyệt vời!</p>
					<a href="#" class="krishok-btn">Mua ngay <i
						class="fa fa-shopping-cart"></i></a>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- hero area end -->
<!-- all product area start -->
<section class="all-product ptb-80">
	<div class="container">

		<div class="row">
			<c:forEach items="${list }" var="p">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="single-product max-width-360">
						<div class="single-product-img">
							<div class="product-img">
								<img src="<c:url value="resources"/>/images/${p.ava}"
									alt="${s.ava}" />
								<div class="product-img-overlay">
									<a href="Cardproduct?proId=${p.proId }" class="krishok-btn">Thêm
										vào giỏ <i class="fa fa-shopping-cart"></i>
									</a>
								</div>
							</div>
						</div>


						<div class="product-details">
							<div class="product-info">
								<a href="Detailproduct?proId=${p.proId }">${p.name_product}</a>
								<p>${p.producer.name_producer}</p>
								<span class="price">Giá: <strong><td><fmt:formatNumber
												value="${p.price}" pattern="#,###" /> VND</td> </strong></span>
							</div>
							<div class="product-icon">

								<c:if test="${empty favorites}">
									<!-- Nếu danh sách favorites rỗng, hiển thị tim bình thường -->
									<a href="user/InsertFavorite?proId=${p.proId}"><i
										class="fa fa-heart"></i></a>
								</c:if>

								<c:if test="${not empty favorites}">
									<c:set var="found" value="false" />

									<c:forEach items="${favorites}" var="fav" varStatus="status">


										<c:if test="${fav.product.proId == p.proId}">

											<c:if test="${found == false}">

												<c:set var="found" value="true" />


												<c:choose>
													<c:when test="${fav.isFavorite == false}">
														<!-- Nếu sản phẩm đã yêu thích, đổi thành màu đỏ -->
														<a
															href="${pageContext.request.contextPath }/user/removeFavorite?favorId=${fav.id}"><i
															class="fa fa-heart text-danger"></i></a>

													</c:when>
													<c:otherwise>
														<!-- Nếu chưa yêu thích, hiển thị tim bình thường -->
														<a href="user/InsertFavorite?proId=${p.proId}"><i
															class="fa fa-heart"></i></a>
													</c:otherwise>
												</c:choose>
											</c:if>



										</c:if>

									</c:forEach>

									<c:if test="${ found == false}">
										<a href="user/InsertFavorite?proId=${p.proId}"><i
											class="fa fa-heart"></i></a>

									</c:if>
								</c:if>





							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
					<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
					<c:forEach items="${list_page }" var="page">
						<li class="active"><a href="PageProduct2?page=${page }">${page }</a></li>
					</c:forEach>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="product-tab">
					<i class="fa fa-shopping-cart"></i>
					<h4>Miễn phí vận chuyển</h4>
				</div>
			</div>
			<div class="col-md-4">
				<div class="product-tab product-tab-2">
					<i class="fa fa-thermometer-quarter"></i>
					<h4>Sản phẩm chất lượng</h4>
				</div>
			</div>
			<div class="col-md-4">
				<div class="product-tab product-tab-3">
					<i class="fa fa-thumbs-up"></i>
					<h4>Cam kết hoàn tiền</h4>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="sec-title pt-75">
					<h2>Sản phẩm mới</h2>
					<p>Chúng tôi tự hào giới thiệu những sản phẩm mới nhất từ các
						thương hiệu uy tín. Mỗi sản phẩm được lựa chọn kỹ lưỡng để đảm bảo
						chất lượng tốt nhất, mang lại sự hài lòng cho khách hàng. Bạn có
						thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu của mình và
						trải nghiệm dịch vụ mua sắm tuyệt vời tại cửa hàng của chúng tôi.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list_new }" var="p">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="single-product max-width-360">
						<div class="single-product-img">
							<div class="product-img">
								<img src="<c:url value="resources"/>/images/${p.ava}"
									alt="${s.ava}" />
								<div class="product-img-overlay">
									<a href="Cardproduct?proId=${p.proId }" class="krishok-btn">Thêm
										vào giỏ <i class="fa fa-shopping-cart"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="product-details">
							<div class="product-info">
								<a href="Detailproduct?proId=${p.proId }">${p.name_product}</a>
								<p>${p.producer.name_producer}</p>
								<span class="price">Price: <strong>${p.price }$
								</strong></span>
							</div>
							<div class="product-icon">
								<c:if test="${empty favorites}">
									<!-- Nếu danh sách favorites rỗng, hiển thị tim bình thường -->
									<a href="user/InsertFavorite?proId=${p.proId}"><i
										class="fa fa-heart"></i></a>
								</c:if>

								<c:if test="${not empty favorites}">
									<c:forEach items="${favorites}" var="fav" varStatus="status">
										<c:if test="${status.index == 0}">
											<c:choose>
												<c:when test="${fav.isFavorite == false}">
													<!-- Nếu sản phẩm đã yêu thích, đổi thành màu đỏ -->
													<a
														href="${pageContext.request.contextPath }/user/removeFavorite?favorId=${fav.id}"><i
														class="fa fa-heart text-danger"></i></a>

												</c:when>
												<c:otherwise>
													<!-- Nếu chưa yêu thích, hiển thị tim bình thường -->
													<a href="user/InsertFavorite?proId=${p.proId}"><i
														class="fa fa-heart"></i></a>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<br>
		<%-- <div class="row">
			<div class="col-lg-3 col-sm-12">
				<div class="product-dropdown max-width-360">

					<ul class="primary-menu">
						<b>Category</b>
						<c:forEach items="${list_cat }" var="cat">
							<li><a href="ProductByCatgorize?catId=${cat.categorizeId }">${cat.categorizeName }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div> --%>

	</div>

</section>
<!-- all product area end -->
<!-- get quote area start -->
<section class="get-quote ptb-50">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>Nhận thông tin cập nhật về sản phẩm</h2>
				<form action="#">
					<input type="text" placeholder="Địa chỉ Email">
					<button type="submit">ĐĂNG KÝ</button>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- get quote area end -->
<!-- footer area start -->
<jsp:include page="footer.jsp"></jsp:include>
