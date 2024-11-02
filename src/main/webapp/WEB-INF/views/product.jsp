<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<section class="theme2 hero-area ptb-80">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2">
				<div class="hero-area-content">
					<h1>A Place of All Organic Products</h1>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book</p>
					<a href="#" class="krishok-btn">Shop Now <i
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
									<a href="Cardproduct?proId=${p.proId }" class="krishok-btn">Add
										to cart <i class="fa fa-shopping-cart"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="product-details">
							<div class="product-info">
								<a href="Detailproduct?proId=${p.proId }">${p.name_product}</a>
								<p>Brand Name will be Here</p>
								<span class="price">Price: <strong>$
										<h5>${p.price }</h5>
								</strong></span>
							</div>
							<div class="product-icon">
								<a href="#"><i class="fa fa-heart"></i></a> <a href="#"><i
									class="fa fa-share-alt"></i></a>
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
						<li class="active"><a href="PageProduct?page=${page }">${page }</a></li>
					</c:forEach>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="product-tab">
					<i class="fa fa-shopping-cart"></i>
					<h4>Free Shipping</h4>
				</div>
			</div>
			<div class="col-md-4">
				<div class="product-tab product-tab-2">
					<i class="fa fa-thermometer-quarter"></i>
					<h4>Quality Product</h4>
				</div>
			</div>
			<div class="col-md-4">
				<div class="product-tab product-tab-3">
					<i class="fa fa-thumbs-up"></i>
					<h4>Money Back Guarantee</h4>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="sec-title pt-75">
					<h2>New Products</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing eiusmod
						tempor incididunt ut labore et consectetur adipisicing eiusmod
						dolore magna aliqua.</p>
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
									<a href="Cardproduct?proId=${p.proId }" class="krishok-btn">Add
										to cart <i class="fa fa-shopping-cart"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="product-details">
							<div class="product-info">
								<a href="Detailproduct?proId=${p.proId }">${p.name_product}</a>
								<p>Brand Name will be Here</p>
								<span class="price">Price: <strong>$
										<h5>${p.price }</h5>
								</strong></span>
							</div>
							<div class="product-icon">
								<a href="#"><i class="fa fa-heart"></i></a> <a href="#"><i
									class="fa fa-share-alt"></i></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	<br>
		<div class="row">
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
		</div>

	</div>

</section>
<!-- all product area end -->
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
