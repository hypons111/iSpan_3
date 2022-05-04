<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Fashi | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/css/shop/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/css/shop/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/shop/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/css/shop/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/css/shop/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/css/shop/nice-select.css" type="text/css">
<link rel="stylesheet" href="/css/shop/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/css/shop/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/css/shop/style.css" type="text/css">
<link rel="stylesheet" href="/css/shop/shop.css" type="text/css">
</head>


<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header-section">
		<nav class="navbar navbar-expand-lg fixed-top bg-dark navbar-dark">
			<div class="container-fluid">
				<a class="py-2" href="#"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="d-block mx-auto">
						<circle cx="12" cy="12" r="10"></circle>
						<line x1="14.31" y1="8" x2="20.05" y2="17.94"></line>
						<line x1="9.69" y1="8" x2="21.17" y2="8"></line>
						<line x1="7.38" y1="12" x2="13.12" y2="2.06"></line>
						<line x1="9.69" y1="16" x2="3.95" y2="6.06"></line>
						<line x1="14.31" y1="16" x2="2.83" y2="16"></line>
						<line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
				</a> <a class="navbar-brand" href="#">Alimento</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class=" navbar-collapse justify-content-end "
					id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
						<li class=""><a class="nav-link active" aria-current="page" href="./index.html">首頁</a></li>
						<li id="showAll" class=""><a class="nav-link" href="/home/shop/all">所有商品</a></li>
						<li class=""><a class="nav-link" href="./blog.html">活動總覽</a></li>
						<li class=""><a class="nav-link" href="./blog.html">食譜總覽</a></li>
						<li class=""><a class="nav-link" href="./login.html">登入</a></li>
						<li class=""><a class="nav-link" href="./register.html">註冊</a></li>
                    </ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="#"><i class="fa fa-home"></i> Home</a> <span>Shop</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">產品種類</h4>
						<!-- 插入產品種品名稱 -->
						<ul class="filter-catagories"></ul>
					</div>

					<div class="filter-widget">
						<h4 class="fw-title">價格範圍</h4>
						<div class="filter-range-wrap">
							<div class="slider">
								<input id="price" type="range" min="" max="" value="" name="rgb">
								<input id='priceResult' class="border" placeholder="" value=""></input>
							</div>
						</div>
					</div>

					<!-- 保留 -->
					<div class="filter-widget"></div>
					<div class="filter-widget"></div>
					<div class="filter-widget"></div>
					<!-- /保留 -->

				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7">
								<div class="select-option">
									<select class="sorting">
										<option value="ASC">按價錢 - 最高</option>
										<option value="DESC">按價錢 - 最低</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="product-list">
						<div class="row"></div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer-left">
						<div class="footer-logo">
							<a href="#"><img src="/image/shop/footer-logo.png" alt=""></a>
						</div>
						<ul>
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: +65 11.188.888</li>
							<li>Email: hello.colorlib@gmail.com</li>
						</ul>
						<div class="footer-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1">
					<div class="footer-widget">
						<h5>Information</h5>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Serivius</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>My Account</h5>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Shopping Cart</a></li>
							<li><a href="#">Shop</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="newslatter-item">
						<h5>Join Our Newsletter Now</h5>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#" class="subscribe-form">
							<input type="text" placeholder="Enter Your Mail">
							<button type="button">Subscribe</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright-reserved">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="copyright-text">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</div>
						<div class="payment-pic">
							<img src="/image/shop/payment-method.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js"></script>
	<script src="/js/shop/jquery-3.3.1.min.js"></script>
	<script src="/js/shop/bootstrap.min.js"></script>
	<script src="/js/shop/jquery-ui.min.js"></script>
	<script src="/js/shop/jquery.countdown.min.js"></script>
	<script src="/js/shop/jquery.nice-select.min.js"></script>
	<script src="/js/shop/jquery.zoom.min.js"></script>
	<script src="/js/shop/jquery.dd.min.js"></script>
	<script src="/js/shop/jquery.slicknav.js"></script>
	<script src="/js/shop/owl.carousel.min.js"></script>
	<script src="/js/shop/main.js"></script>
	<script src="/js/shop/shopAll.js"></script>
</body>

</html>