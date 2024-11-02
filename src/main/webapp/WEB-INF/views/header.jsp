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
<link rel="apple-touch-icon" sizes="57x57"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="http://live.envalab.com/html/krishok/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="http://live.envalab.com/html/krishok/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="http://live.envalab.com/html/krishok/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="http://live.envalab.com/html/krishok/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="http://live.envalab.com/html/krishok/favicon/favicon-16x16.png">
<link rel="manifest" href="favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<title>Welcome | Krishok</title>
<!-- Font Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/<c:url value="resources"/>/css/bootstrap.min.css"
	media="all" />
<!-- slicknav CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/<c:url value="resources"/>/css/slicknav.min.css">
<!-- Owl carousel CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/<c:url value="resources"/>/css/owl.carousel.min.css">
<!-- Lightbox CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/<c:url value="resources"/>/css/lightbox.min.css" />
<!-- Bx slider CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/<c:url value="resources"/>/css/jquery.bxslider.css">
<!-- Animate CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/<c:url value="resources"/>/css/animate.min.css">
<!-- Main style CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/<c:url value="resources"/>/css/style.css"
	media="all" />
<!-- Responsive CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/<c:url value="resources"/>/css/responsive.css"
	media="all" />
</head>
<body>
	<!-- Page loader -->
	<div id="preloader"></div>
	<!-- header area start -->
	<header class="header-area ptb-15">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div class="header-left-content">
						<ul>
							<li><a href="#"><i class="fa fa-phone"></i>0924717515</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i>ngophong115522@gmail.com</a></li>
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
							<li><a href="${pageContext.request.contextPath }/Card" class="krishok-cart"><i
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
														<input type="text" placeholder="UserName" name="username"
															required="required"> <i class="fa fa-envelope"></i>
													</div>
												</div>
												<div class="col-sm-12 mb-15">
													<div class="contact-container">
														<input type="password" placeholder="Password"
															name="password" required="required"> <i
															class="fa fa-eye"></i>
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
														Don’t Have an Account ? <a
															href="${pageContext.request.contextPath }/createuser"
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
							<li class="active"><a
								href="${pageContext.request.contextPath }/LoadProducts">Home</a></li>
							<li><a href="${pageContext.request.contextPath }/Product">Products</a>
								<ul>
									<c:forEach items="${list_cat }" var="cat">
										<li><a href="ProductByCatgorize?catId=${cat.categorizeId }">${cat.categorizeName }</a></li>
									</c:forEach>
								</ul></li>
							<li><a href="${pageContext.request.contextPath }/About">About</a></li>
							<li><a href="${pageContext.request.contextPath }/Blog">Blog</a></li>
							<li><a href="${pageContext.request.contextPath }/user/Checkout">Order Detail</a></li>
							<li><a href="${pageContext.request.contextPath }/Concat">Concat</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- menu area end -->
	<!-- hero area start -->