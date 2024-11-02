<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
										alt="product-details">
								</div>
							</div>

						</c:forEach>
					</div>

					<ol class="carousel-indicators">
						<c:forEach items="${p.images }" var="im" varStatus="st">
							<li data-target="#quote-carousel" data-slide-to="${st.index + 1 }"><img
								src="<c:url value="resources"/>/images/${im.nameImage}"
								alt="product"></li>
						</c:forEach>

					</ol>

				</div>
			</div>

			<div class="col-md-7">
				<div class="product-details-content pb-75">
					<div class="product-details-left">
						<div class="product-details-title">
							<h3>${p.name_product}</h3>
						</div>
						<div class="product-details-price">
							<p>
								${p.price}
								<del>(5% off)</del>
							</p>
						</div>
						<div class="review-star">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="product-details-category">
							<h3>Loại:</h3>
							<p>${p.categorize.categorizeName }</p>
						</div>
					</div>
					<div class="product-icon">
						<a href="#"><i class="fa fa-heart-o"></i></a> <a href="#"><i
							class="fa fa-share-alt"></i></a>
					</div>
					<div class="product-details-btn">
						<a href="#" class="krishok-btn">Buy Now <i
							class="fa fa-shopping-cart"></i></a> <a href="Cardproduct?proId=${p.proId }"
							class="krishok-btn krishok-btn-transparent">Add to List <i
							class="fa fa-heart-o"></i></a>
					</div>
					<div class="product-details-descrip">
						<h3>Description</h3>
						<p>${p.description }</p>
						<a href="#" class="review-btn">write a review</a>
						<form action="#" class="product-details-form">
							<input type="text" placeholder="Write your review" />
							<div class="dropdowns-select">
								<select>
									<option value="5 star">5 star</option>
									<option value="4 star">4 star</option>
									<option value="3 star">3 star</option>
									<option value="2 star">2 star</option>
									<option value="1 star">1 star</option>
								</select>
							</div>
							<button class="krishok-btn">Send Review</button>
						</form>
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
					<h2>Simila Products</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing eiusmod
						tempor incididunt ut labore et consectetur adipisicing eiusmod
						dolore magna aliqua.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-sm-6">
				<div class="sell-item max-width-360 mt-30">
					<div class="product-img">
						<img src="assets/img/main-product/1.jpg" alt="">
						<div class="product-img-overlay">
							<a href="#" class="krishok-btn">Add to cart <i
								class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
					<p>
						<a href="product-details.html">Product Name</a>
					</p>
					<h5>$50.00</h5>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="sell-item max-width-360 mt-30">
					<div class="product-img">
						<img src="assets/img/main-product/2.jpg" alt="">
						<div class="product-img-overlay">
							<a href="#" class="krishok-btn">Add to cart <i
								class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
					<p>
						<a href="product-details.html">Product Name</a>
					</p>
					<h5>$50.00</h5>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="sell-item max-width-360 mt-30">
					<div class="product-img">
						<img src="assets/img/main-product/3.jpg" alt="">
						<div class="product-img-overlay">
							<a href="#" class="krishok-btn">Add to cart <i
								class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
					<p>
						<a href="product-details.html">Product Name</a>
					</p>
					<h5>$50.00</h5>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="sell-item max-width-360 mt-30">
					<div class="product-img">
						<img src="assets/img/main-product/4.jpg" alt="">
						<div class="product-img-overlay">
							<a href="#" class="krishok-btn">Add to cart <i
								class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
					<p>
						<a href="product-details.html">Product Name</a>
					</p>
					<h5>$50.00</h5>
				</div>
			</div>
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
					<h2>Recently Viewed</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing eiusmod
						tempor incididunt ut labore et consectetur adipisicing eiusmod
						dolore magna aliqua.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-sm-6">
				<div class="sell-item max-width-360 mt-30">
					<div class="product-img">
						<img src="assets/img/main-product/8.jpg" alt="">
						<div class="product-img-overlay">
							<a href="#" class="krishok-btn">Add to cart <i
								class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
					<p>
						<a href="product-details.html">Product Name</a>
					</p>
					<h5>$50.00</h5>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="sell-item max-width-360 mt-30">
					<div class="product-img">
						<img src="assets/img/main-product/9.jpg" alt="">
						<div class="product-img-overlay">
							<a href="#" class="krishok-btn">Add to cart <i
								class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
					<p>
						<a href="product-details.html">Product Name</a>
					</p>
					<h5>$50.00</h5>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="sell-item max-width-360 mt-30">
					<div class="product-img">
						<img src="assets/img/main-product/5.jpg" alt="">
						<div class="product-img-overlay">
							<a href="#" class="krishok-btn">Add to cart <i
								class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
					<p>
						<a href="product-details.html">Product Name</a>
					</p>
					<h5>$50.00</h5>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="sell-item max-width-360 mt-30">
					<div class="product-img">
						<img src="assets/img/main-product/10.jpg" alt="">
						<div class="product-img-overlay">
							<a href="#" class="krishok-btn">Add to cart <i
								class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
					<p>
						<a href="product-details.html">Product Name</a>
					</p>
					<h5>$50.00</h5>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- shopping product area end -->
<!-- footer area start -->
<jsp:include page="footer.jsp"></jsp:include>
