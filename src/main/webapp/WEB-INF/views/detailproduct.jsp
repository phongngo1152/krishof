<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp"></jsp:include>
<section class="product pt-75">
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<div class="carousel slide" data-ride="carousel" id="quote-carousel">
					<div class="carousel-inner">
						<c:forEach items="${p.images }" var="im" varStatus="st">
							<c:if test="${st.index==0 }">
								<div class="item active carousel-item">
									<div class="item-carousel-wrap zoom"
										data-zoom="assets/img/slide-bg-1.jpg">
										<img src="<c:url value="resources"/>/images/${im.nameImage}"
											alt="${im.nameImage}" />
									</div>
								</div>
							</c:if>
							<div class="item carousel-item">
								<div class="item-carousel-wrap zoom"
									data-zoom="assets/img/slide-bg-5.jpg">
									<img src="<c:url value="resources"/>/images/${im.nameImage}"
										alt="Chi tiết sản phẩm">
								</div>
							</div>
						</c:forEach>
					</div>
					<ol class="carousel-indicators">
						<c:forEach items="${p.images }" var="im" varStatus="st">
							<li data-target="#quote-carousel"
								data-slide-to="${st.index + 1 }"><img
								src="<c:url value="resources"/>/images/${im.nameImage}"
								alt="Sản phẩm"></li>
						</c:forEach>
					</ol>
				</div>
			</div>

			<div class="col-md-7">
				<div class="product-details-content pb-75">
					<div class="product-details-left">
						<div class="product-details-title">
							<h3>${p.name_product}</h3>
							<div class="product-details-quantity">
								<p>1 khay / 0.5 kg</p>
							</div>
						</div>
						<div class="product-details-price">
							<p>
							<fmt:formatNumber	value="${p.price}" pattern="#,###" /> VND
							</p>
						</div>
						<div class="product-details-category">
							<strong>Danh mục:</strong> <span>${p.category.name_cat}</span>
						</div>
						<div class="product-details-type">
							<strong>Loại:</strong> <span>${p.categorize.categorizeName}</span>
						</div>
						<div class="product-details-manufacturer">
							<strong>Nhà sản xuất:</strong> <span>${p.producer.name_producer}</span>
						</div>
					</div>
					<div class="product-icon">
						<a href="#"><i class="fa fa-heart"></i></a> <a href="#"><i
							class="fa fa-share-alt"></i></a>
					</div>
					<div class="product-details-btn">
						<a href="#" class="krishok-btn">Mua ngay <i
							class="fa fa-shopping-cart"></i></a> <a
							href="Cardproduct?proId=${p.proId }"
							class="krishok-btn krishok-btn-transparent">Thêm vào danh
							sách <i class="fa fa-heart-o"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- product detail area end -->
<!-- sell area start -->
<section class="ptb-80">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="sec-title mb-30">
					<h2>Sản phẩm tương tự</h2>
					<p>Khám phá các sản phẩm khác cùng loại, chất lượng đảm bảo và
						giá cả hợp lý.</p>
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
	</div>
</section>
<!-- sell area end -->
<!-- shopping product area start -->
<section class="product shopping-product ptb-80">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="sec-title mb-30">
					<h2>Đã xem gần đây</h2>
					<p>Các sản phẩm bạn đã xem gần đây, giúp bạn dễ dàng lựa chọn.</p>
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
	</div>
</section>
<!-- shopping product area end -->
<!-- footer area start -->
<jsp:include page="footer.jsp"></jsp:include>
