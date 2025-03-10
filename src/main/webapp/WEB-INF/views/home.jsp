<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="header.jsp"></jsp:include>
<section class="hero-area ptb-80">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 col-md-8 col-sm-10">
				<div class="hero-area-content ptb-80">
					<h1>Khám Phá Sản Phẩm Hữu Cơ Tươi Mới</h1>
					<p>Chúng tôi cung cấp các sản phẩm hữu cơ tươi ngon, an toàn và chất lượng. Với phương châm mang lại thực phẩm sạch và bổ dưỡng cho gia đình bạn, chúng tôi cam kết chỉ bán những sản phẩm đã được kiểm tra kỹ lưỡng về chất lượng và nguồn gốc rõ ràng. Mỗi sản phẩm đều được trồng và thu hoạch với quy trình thân thiện với môi trường.</p>
					<a href="$" class="krishok-btn">Mua ngay <i
						class="fa fa-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div class="item-thumbnail">
		<a href="#" data-slide-index="0">
			<div class="list-thumb list-thumb1"><img src="<c:url value="resources"/>/images/1.jpg"alt="${s.ava}" /></div>
		</a> <a href="#" data-slide-index="1">
			<div class="list-thumb list-thumb2"><img src="<c:url value="resources"/>/images/2.jpg"alt="${s.ava}" /></div>
		</a>
	</div>
	<!--Slider thumbnail-->
</section>
<!-- hero area end -->
<!-- shopping product area start -->
<section class="shopping-product ptb-80">
	<div class="container">
		<div class="row product-item">
			<c:forEach items="${list }" var="p">
				<div class="col-lg-3 col-sm-6 new other">
					<div class="sell-item max-width-360">
						<div class="product-img">
							<img src="<c:url value="resources"/>/images/${p.ava}"
								alt="${s.ava}" />
							<div class="product-img-overlay">
								<a href="Cardproduct?proId=${p.proId }" class="krishok-btn">Thêm vào giỏ <i
									class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<p>
							<a href="Detailproduct?proId=${p.proId }">${p.name_product}</a>
						</p>
						<h5>Giá: <fmt:formatNumber value="${p.price}" pattern="#,###" /> VND</h5>
					</div>
				</div>

			</c:forEach>


		</div>
		<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
				<li ><a href="#"><i class="fa fa-angle-left"></i></a></li>
				<c:forEach items="${list_page }" var="page">
					<li class="active"><a href="PageProduct?page=${page }">${page }</a></li>
				</c:forEach>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</section>
<!-- shopping product area end -->
<!-- product area start -->
<section class="product ptb-70">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="sec-title">
					<h2>Sản phẩm mới</h2>
					<p>Chúng tôi luôn cập nhật những sản phẩm tươi mới và an toàn nhất từ các trang trại hữu cơ. Mỗi sản phẩm đều được lựa chọn kỹ càng để đảm bảo mang lại giá trị dinh dưỡng cao cho người tiêu dùng. Hãy thử ngay hôm nay và cảm nhận sự khác biệt trong từng sản phẩm!</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 col-md-8 offset-lg-0 offset-md-2">
				<div class="tab-accordion pt-75">
					<div class="tab-content">
						<div id="menu1" class="tab-pane fade">
							<img src="<c:url value="resources"/>/images/single-product.jpg" alt="">
						</div>
						<div id="menu2" class="tab-pane fade active show">
							<img src="<c:url value="resources"/>/images/single-product.jpg" alt="">
						</div>
						<div id="menu3" class="tab-pane fade">
							<img src="<c:url value="resources"/>/images/single-product.jpg" alt="">
						</div>
						<div id="menu4" class="tab-pane fade">
							<img src="<c:url value="resources"/>/images/single-product.jpg" alt="">
						</div>
						<div id="menu5" class="tab-pane fade">
							<img src="<c:url value="resources"/>/images/single-product.jpg" alt="">
						</div>
						<div id="menu6" class="tab-pane fade">
							<img src="<c:url value="resources"/>/images/single-product.jpg" alt="">
						</div>
						<div id="menu7" class="tab-pane fade">
							<img src="<c:url value="resources"/>/images/single-product.jpg" alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 pt-75">
				<ul class="nav nav-tabs">
					<c:forEach items="${list_new }" var="p">
					<li class="nav-item"><a data-toggle="tab" href="#menu1">
							<div class="product-list">
								<div class="product-list-img">
									<img src="<c:url value="resources"/>/images/${p.ava}"
										alt="${s.ava}" />
								</div>
								<div class="product-list-info">
									<div class="product-list-info-table">
										<p>${p.name_product}</p>
										<h5>Giá: <fmt:formatNumber value="${p.price}" pattern="#,###" /> VND</h5>
										<div class="product-list-icon">
											<i class="fa fa-shopping-cart"></i> <i class="fa fa-heart"></i>
										</div>
									</div>
								</div>
							</div>
					</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</section>
<!-- product area end -->
<!-- sell area start -->
<section class="ptb-80">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="sec-title">
					<h2>Sản phẩm bán chạy</h2>
					<p>Khám phá những sản phẩm bán chạy nhất của chúng tôi. Những sản phẩm này được yêu thích bởi khách hàng nhờ vào chất lượng vượt trội và giá trị dinh dưỡng tuyệt vời. Mua ngay để tận hưởng ưu đãi hấp dẫn!</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="sell-area owl-carousel">
				<c:forEach items="${list }" var="p">
					<div class="sell-item max-width-360">
						<div class="product-img">
							<img src="<c:url value="resources"/>/images/${p.ava}"
								alt="${s.ava}" />
							<div class="product-img-overlay">
								<a href="Cardproduct?proId=${p.proId }" class="krishok-btn">Thêm vào giỏ <i
									class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<p>
							<a href="Detailproduct?proId=${p.proId }">${p.name_product}</a>
						</p>
						<h5>Giá: <fmt:formatNumber value="${p.price}" pattern="#,###" /> VND</h5>
					</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
</section>
<!-- sell area end -->
<!-- get quote area start -->
<section class="get-quote ptb-50">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>Nhận thông tin cập nhật về sản phẩm mới</h2>
				<form action="#">
					<input type="text" placeholder="Địa chỉ email">
					<button type="submit">ĐĂNG KÝ</button>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- get quote area end -->
<!-- footer area start -->
<jsp:include page="footer.jsp"></jsp:include>