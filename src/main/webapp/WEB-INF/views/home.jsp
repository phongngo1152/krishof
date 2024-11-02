<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<section class="hero-area ptb-80">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 col-md-8 col-sm-10">
				<div class="hero-area-content ptb-80">
					<h1>A Place of All Organic Products</h1>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book</p>
					<a href="$" class="krishok-btn">Shop Now <i
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
	<!--/Slider thumbnail-->
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
								<a href="Cardproduct?proId=${p.proId }" class="krishok-btn">Add to cart <i
									class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<p>
							<a href="Detailproduct?proId=${p.proId }">${p.name_product}</a>
						</p>
						<h5>${p.price }</h5>
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
					<h2>New Products</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing eiusmod
						tempor incididunt ut labore et consectetur adipisicing eiusmod
						dolore magna aliqua.</p>
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
										<h5>${p.price }</h5>
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
					<h2>Best Sells</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing eiusmod
						tempor incididunt ut labore et consectetur adipisicing eiusmod
						dolore magna aliqua.</p>
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
								<a href="Cardproduct?proId=${p.proId }" class="krishok-btn">Add to cart <i
									class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<p>
							<a href="Detailproduct?proId=${p.proId }">${p.name_product}</a>
						</p>
						<h5>${p.price }</h5>
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
				<h2>Get Update About Products</h2>
				<form action="#">
					<input type="text" placeholder="Email Address">
					<button type="submit">SUBSCRIBE</button>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- get quote area end -->
<!-- footer area start -->
<jsp:include page="footer.jsp"></jsp:include>
