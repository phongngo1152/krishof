<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="57x57" href="https://soyonexpress.com/html-demos/krishok/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="https://soyonexpress.com/html-demos/krishok/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="https://soyonexpress.com/html-demos/krishok/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="https://soyonexpress.com/html-demos/krishok/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="https://soyonexpress.com/html-demos/krishok/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="https://soyonexpress.com/html-demos/krishok/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="https://soyonexpress.com/html-demos/krishok/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="fhttps://soyonexpress.com/html-demos/krishok/avicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="https://soyonexpress.com/html-demos/krishok/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="https://soyonexpress.com/html-demos/krishok/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="https://soyonexpress.com/html-demos/krishok/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="https://soyonexpress.com/html-demos/krishok/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="https://soyonexpress.com/html-demos/krishok/favicon/favicon-16x16.png">
        <link rel="manifest" href="https://soyonexpress.com/html-demos/krishok/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
		<title>Krishok | Blog</title>
		<!-- Font Awesome CSS -->
		<link rel="stylesheet" type="text/css" href="https://soyonexpress.com/html-demos/krishok/assets/css/font-awesome.min.css" media="all" />
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" type="text/css" href="https://soyonexpress.com/html-demos/krishok/assets/css/bootstrap.min.css" media="all" />
		<!-- slicknav CSS -->
		<link rel="stylesheet" href="https://soyonexpress.com/html-demos/krishok/assets/css/slicknav.min.css">
		<!-- Owl carousel CSS -->
		<link rel="stylesheet" href="https://soyonexpress.com/html-demos/krishok/assets/css/owl.carousel.min.css">
		<!-- Lightbox CSS -->
		<link rel="stylesheet" href="https://soyonexpress.com/html-demos/krishok/assets/css/lightbox.min.css"/>
		<!-- Animate CSS -->
		<link rel="stylesheet" href="https://soyonexpress.com/html-demos/krishok/assets/css/animate.min.css">
		<!-- Main style CSS -->
		<link rel="stylesheet" type="text/css" href="https://soyonexpress.com/html-demos/krishok/assets/css/style.css" media="all" />
		<!-- Responsive CSS -->
		<link rel="stylesheet" type="text/css" href="https://soyonexpress.com/html-demos/krishok/assets/css/responsive.css" media="all" />
	</head>
	<body class="bg-color">
		<!-- Page loader -->
	    <div id="preloader"></div>
		<!-- header area start -->
			<!-- Page loader -->
	<div id="preloader"></div>
	<!-- header area start -->
	<header class="header-area ptb-15">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div class="header-left-content">
						<ul>
							<li><a href="#"><i class="fa fa-phone"></i>0123 4567
									8913</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i>example@gmail.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-5">
					<div class="header-right-content">
						<ul>
							<li><select>
									<option value="En">En</option>
									<option value="Bd">Bd</option>
							</select></li>
							<li><a href="Card" class="krishok-cart"><i
									class="fa fa-shopping-cart"></i> <span>3</span></a></li>
							<c:if test="${pageContext.request.userPrincipal.name == null}">
								<li><a href="#" class="popup-show">Login</a>
									<div class="login-popup login-form contact-form">
										<h4>Login</h4>
										<form name='loginForm'
											action="<c:url value='j_spring_security_login' />"
											method='POST'>
											<div class="row">
												<div class="col-sm-12">
													<div class="contact-container">
														<input type="text" placeholder="UserName"
															name="username"required="required"> <i class="fa fa-envelope"></i>
													</div>
												</div>
												<div class="col-sm-12 mb-15">
													<div class="contact-container">
														<input type="password" placeholder="Password"
															name="password"required="required"> <i class="fa fa-eye"></i>
													</div>
												</div>
												<div class="col-sm-6 text-left mb-15">
													<input type="checkbox">
													<p>Remember me</p>
												</div>
												<div class="col-sm-6 text-right mb-15">
													<div class="popup-light">
														<p>Forget Password ?</p>
													</div>
												</div>
												<div class="col-sm-12 mb-30">

													<button class="krishok-btn">LOGIN</button>
												</div>
												<div class="col-sm-12 mb-15">
													<div class="sign-with">
														<p>Or Sign In With</p>
													</div>
												</div>
												<div class="col-sm-12">
													<a href="#" class="login-with"><i
														class="fa fa-facebook"></i></a> <a href="#" class="login-with"><i
														class="fa fa-twitter"></i></a>
												</div>
												<div class="col-sm-12 mt-30">
													<p>
														Don’t Have an Account ? <a href="${pageContext.request.contextPath }/createuser"
															class="registration-form-show">Create Now</a>
													</p>
												</div>
											</div>
										</form>
										<div class="popup-close">
											<i class="fa fa-close"></i>
										</div>
									</div>
									<div class="login-popup registration-form contact-form">
										<h4>Create Account</h4>
										<form action="#">
											<div class="row">
												<div class="col-sm-12">
													<div class="contact-container">
														<input type="text" placeholder="Username"> <i
															class="fa fa-user"></i>
													</div>
												</div>
												<div class="col-sm-12">
													<div class="contact-container">
														<input type="email" placeholder="Email Address"> <i
															class="fa fa-envelope"></i>
													</div>
												</div>
												<div class="col-sm-12">
													<div class="contact-container">
														<input type="password" placeholder="Password"> <i
															class="fa fa-eye"></i>
													</div>
												</div>
												<div class="col-sm-12 mb-15">
													<input type="password" placeholder="Retype Password">
												</div>
												<div class="col-sm-12 text-left mb-15">
													<input type="checkbox">
													<p>
														Agree with <span>terms and condition</span>
													</p>
												</div>
												<div class="col-sm-12 mb-20">
													<button class="krishok-btn">Create Account</button>
												</div>
												<div class="col-sm-12">
													<p>
														Already Have an Account ? <a href="#"
															class="login-form-show">Login Now</a>
													</p>
												</div>
											</div>
										</form>
										<div class="popup-close">
											<i class="fa fa-close"></i>
										</div>
									</div></li>

							</c:if>
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<li><a href="user/infor" class="popup-show">${pageContext.request.userPrincipal.name}</a></li>
								<li>
									<form action="<c:url value="/j_spring_security_logout" />"
										method="post">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" /> <input type="submit"
											value="Logout" />
									</form>
								</li>

							</c:if>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header area end -->
	<!-- menu area start -->
	<div class="menubar">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-6">
					<div class="logo">
						<a href="${pageContext.request.contextPath }/LoadProducts"><img
							src="https://soyonexpress.com/html-demos/krishok/assets/img/logo.png"
							alt="logo"></a>
					</div>
				</div>
				<div class="col-md-10 col-sm-6">
					<div class="responsive-menu"></div>
					<div class="mainmenu">
						<ul id="primary-menu">
							<li class="active"><a href="${pageContext.request.contextPath }/LoadProducts">Home</a></li>
							<li><a href="Product">Products</a>
								<ul>
									<c:forEach items="${list_cat }" var="cat">
										<li><a href="ProductByCatgorize?catId=${cat.categorizeId }">${cat.categorizeName }</a></li>
									</c:forEach>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath }/Blog">Blog</a></li>
							<li><a href="${pageContext.request.contextPath }/About">About</a></li>
							<li><a href="${pageContext.request.contextPath }/Concat">Concat</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- hero area start -->
		<section class="theme2 theme5 hero-area ptb-110">
			<div class="container">
				<div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="hero-area-content">
                            <h1 class="text-uppercase mb-30">BLOG Update</h1>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</p>
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
				</div>
			</div>
		</section><!-- hero area end -->
		<!-- blog area start -->
		<section class="blog-area ptb-80">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-12">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="single-post">
                                    <div class="flexbox-center">
                                        <div class="post-thumbnail">
                                            <a href="blog-detail.html"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/blog/1.jpg" alt="Blog Post" class="img-responsive"></a>
                                        </div>
                                         <div class="post-details">
                                             <h5>
                                                 <a href="blog-detail.html">Why organic food is better for you?</a>
                                             </h5>
                                             <div class="post-author">
                                                 <p><a href="#">A.h Asif</a>  |  22 January, <script>document.write(new Date().getFullYear())</script></p>
                                             </div>
                                             <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Dummy text has been the industry's standard dummy text.</p>
                                             <a href="blog-detail.html" class="read-more">Read more <i class="fa fa-angle-right"></i></a>
                                             <div class="post-meta">
                                                 <ul>
                                                    <li><a href="#"><i class="fa fa-heart"></i>454</a></li>
                                                    <li><a href="#"><i class="fa fa-comment"></i>275</a></li>
                                                    <li><a href="#"><i class="fa fa-share-alt"></i>108</a></li>
                                                </ul>
                                             </div>
                                         </div>
                                    </div>
                                </div>
                                <div class="single-post">
                                    <div class="flexbox-center">
                                        <div class="post-thumbnail">
                                            <a href="blog-detail.html"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/blog/2.jpg" alt="Blog Post" class="img-responsive"></a>
                                        </div>
                                         <div class="post-details">
                                             <h5>
                                                 <a href="blog-detail.html">The advantages and disadvantages of organic farming</a>
                                             </h5>
                                             <div class="post-author">
                                                 <p><a href="#">A.h Asif</a>  |  22 January, <script>document.write(new Date().getFullYear())</script></p>
                                             </div>
                                             <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Dummy text has been the industry's standard dummy text.</p>
                                             <a href="blog-detail.html" class="read-more">Read more <i class="fa fa-angle-right"></i></a>
                                             <div class="post-meta">
                                                 <ul>
                                                    <li><a href="#"><i class="fa fa-heart"></i>454</a></li>
                                                    <li><a href="#"><i class="fa fa-comment"></i>275</a></li>
                                                    <li><a href="#"><i class="fa fa-share-alt"></i>108</a></li>
                                                </ul>
                                             </div>
                                         </div>
                                    </div>
                                </div>
                                <div class="single-post">
                                    <div class="flexbox-center">
                                        <div class="post-thumbnail">
                                            <a href="blog-detail.html"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/blog/3.jpg" alt="Blog Post" class="img-responsive"></a>
                                        </div>
                                         <div class="post-details">
                                             <h5>
                                                 <a href="blog-detail.html">What are some organic farming methods?</a>
                                             </h5>
                                             <div class="post-author">
                                                 <p><a href="#">A.h Asif</a>  |  22 January, <script>document.write(new Date().getFullYear())</script></p>
                                             </div>
                                             <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Dummy text has been the industry's standard dummy text.</p>
                                             <a href="blog-detail.html" class="read-more">Read more <i class="fa fa-angle-right"></i></a>
                                             <div class="post-meta">
                                                 <ul>
                                                    <li><a href="#"><i class="fa fa-heart"></i>454</a></li>
                                                    <li><a href="#"><i class="fa fa-comment"></i>275</a></li>
                                                    <li><a href="#"><i class="fa fa-share-alt"></i>108</a></li>
                                                </ul>
                                             </div>
                                         </div>
                                    </div>
                                </div>
                                <div class="single-post">
                                    <div class="flexbox-center">
                                        <div class="post-thumbnail">
                                            <a href="blog-detail.html"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/blog/4.jpg" alt="Blog Post" class="img-responsive"></a>
                                        </div>
                                         <div class="post-details">
                                             <h5>
                                                 <a href="blog-detail.html">15 Advantages of Organic Food</a>
                                             </h5>
                                             <div class="post-author">
                                                 <p><a href="#">A.h Asif</a>  |  22 January, <script>document.write(new Date().getFullYear())</script></p>
                                             </div>
                                             <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Dummy text has been the industry's standard dummy text.</p>
                                             <a href="blog-detail.html" class="read-more">Read more <i class="fa fa-angle-right"></i></a>
                                             <div class="post-meta">
                                                 <ul>
                                                    <li><a href="#"><i class="fa fa-heart"></i>454</a></li>
                                                    <li><a href="#"><i class="fa fa-comment"></i>275</a></li>
                                                    <li><a href="#"><i class="fa fa-share-alt"></i>108</a></li>
                                                </ul>
                                             </div>
                                         </div>
                                    </div>
                                </div>
                                <div class="single-post">
                                    <div class="flexbox-center">
                                        <div class="post-thumbnail">
                                            <a href="blog-detail.html"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/blog/5.jpg" alt="Blog Post" class="img-responsive"></a>
                                        </div>
                                         <div class="post-details">
                                             <h5>
                                                 <a href="blog-detail.html">Organic Food and Your Health</a>
                                             </h5>
                                             <div class="post-author">
                                                 <p><a href="#">A.h Asif</a>  |  22 January, <script>document.write(new Date().getFullYear())</script></p>
                                             </div>
                                             <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Dummy text has been the industry's standard dummy text.</p>
                                             <a href="blog-detail.html" class="read-more">Read more <i class="fa fa-angle-right"></i></a>
                                             <div class="post-meta">
                                                 <ul>
                                                    <li><a href="#"><i class="fa fa-heart"></i>454</a></li>
                                                    <li><a href="#"><i class="fa fa-comment"></i>275</a></li>
                                                    <li><a href="#"><i class="fa fa-share-alt"></i>108</a></li>
                                                </ul>
                                             </div>
                                         </div>
                                    </div>
                                </div>
                            </div>
						</div>
                        <div class="row">
                            <div class="col-lg-9 offset-lg-3">
                                <ul class="pagination">
                                    <li><a href="#"><</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li class="active"><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">></a></li>
                                </ul>
                            </div>
                        </div>
					</div>
					<div class="col-lg-3 offset-lg-0 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					    <div class="widget">
					        <h4 class="widget-title">Latest Content</h4>
					        <ul>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					        </ul>
					    </div>
					    <div class="widget">
					        <h4 class="widget-title">Featured Post</h4>
					        <ul>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					            <li><a href="#">The digital revolution in higher education...</a></li>
					        </ul>
					    </div>
					</div>
				</div>
			</div>
		</section><!-- blog area end -->
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
		</section><!-- get quote area end -->
		<!-- footer area start -->
		<footer class="theme4 site-footer pt-75">
			<div class="container">
				<div class="row">
                    <div class="col-lg-5">
                        <div class="widget">
                            <h5 class="widget-title"><a href="#">About Us</a></h5>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of tand scrambled it to make a type specimen wonder full book. </p>
                            <div class="widget-icon">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="widget">
                            <h5 class="widget-title"><a href="#">Keep in touch</a></h5>
                            <ul>
                                <li>Address : 97 New Design Street, Dhaka BD</li>
                                <li>Phone : 1234 5678 9123  </li>
                                <li>Email : Stevan@Example.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="widget">
                            <h5 class="widget-title"><a href="#">Instagram Feed</a></h5>
                            <div class="img-gallery">
                                <div class="single-img-gallery">
                                    <a href="#"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/widget/widget1.jpg" alt=""></a>
                                </div>
                                <div class="single-img-gallery">
                                    <a href="#"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/widget/widget2.jpg" alt=""></a>
                                </div>
                                <div class="single-img-gallery">
                                    <a href="#"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/widget/widget3.jpg" alt=""></a>
                                </div>
                                <div class="single-img-gallery">
                                    <a href="#"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/widget/widget4.jpg" alt=""></a>
                                </div>
                                <div class="single-img-gallery">
                                    <a href="#"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/widget/widget5.jpg" alt=""></a>
                                </div>
                                <div class="single-img-gallery">
                                    <a href="#"><img src="https://soyonexpress.com/html-demos/krishok/assets/img/widget/widget6.jpg" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
			<div class="footer-bottom-bg ptb-20">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="footer-bottom">
                                <p>Copyright © <script>document.write(new Date().getFullYear())</script> - All Right Reserved</p>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</footer><!-- footer area end -->
		<!-- jquery main JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/jquery.min.js"></script>
		<!-- Poppers JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/popper.min.js"></script>
		<!-- Bootstrap JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/bootstrap.min.js"></script>
		<!-- slicknav JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/jquery.slicknav.min.js"></script>
		<!-- owl carousel JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/owl.carousel.min.js"></script>
		<!-- Isotope JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/isotope-3.0.4.min.js"></script>
		<!-- Bx slider JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/jquery.bxslider.min.js"></script>
		<!-- lightbox JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/lightbox.min.js"></script>
		<!-- Wow JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/wow-1.3.0.min.js"></script>
        <!-- Google map api -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXNQbOV3ZGoxAQ_H2FtRAS_i9yOdZFfBo&region=GB"></script>
		<!-- Imagezoom JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/jquery.imagezoom.js"></script>
		<!-- main JS -->
		<script src="https://soyonexpress.com/html-demos/krishok/assets/js/main.js"></script>
	</body>
</html>