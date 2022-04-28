<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Alimento-後臺管理系統</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/css/common/styles.css" rel="stylesheet" />
<link href="/css/product/insert.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- DataTables -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<!-- SweetAlert2 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>

<!-- JS -->


<!-- CSS -->


</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">Alimento</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-secondary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">設定</a></li>
					<li><a class="dropdown-item" href="#!">活動記錄</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="/logout">登出</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 會員管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/member"><div
										class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div>會員清單</a> <a class="nav-link" href="member/add"><div
										class="sb-nav-link-icon">
										<i class="fa-solid fa-table-list"></i>
									</div>新增會員</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts1" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 商品管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts1"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/product"><div
										class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div>商品清單</a>
								<!--<a class="nav-link" href="product/add"><div class="sb-nav-link-icon"><i class="fa-solid fa-table-list"></i></div>新增商品</a>-->
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts2" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 訂單管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts2"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/order"><div
										class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div>訂單清單</a>
								<!--<a class="nav-link" href="order/add"><div class="sb-nav-link-icon"><i class="fa-solid fa-table-list"></i></div>新增訂單</a>-->
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts3" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 活動管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts3"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/activity"><div
										class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div>活動清單</a>
								<!--<a class="nav-link" href="activity/add"><div class="sb-nav-link-icon"><i class="fa-solid fa-table-list"></i></div>新增活動</a>-->
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts4" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 食譜管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts4"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/recipe"><div
										class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div>食譜清單</a>
								<!--<a class="nav-link" href="recipe/add"><div class="sb-nav-link-icon"><i class="fa-solid fa-table-list"></i></div>新增食譜</a>-->
							</nav>
						</div>

						<!-- ***有需要再開啟***
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="/admin/member">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                會員管理
                            </a>
                            ***有需要再開啟***-->

					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					<sec:authentication property="name" />
				</div>
			</nav>
		</div>
		<!-- 以上勿動 -->

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">新增產品</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">首頁</a></li>
						<li class="breadcrumb-item"><a href="productindex">產品管理</a></li>
						<li class="breadcrumb-item active">新增產品</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">
							如有問題, 請洽 <a target="_blank" href="https://datatables.net/">admin@gmail.com</a>
							.
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<button id='submitButton'>新增</button>
						</div>
						<div class="card-body">

							<!--<a href="XX/add" class="btn btn-primary">新增</a>-->

							<!--DataTables放入位置-->
							<form id="insertForm">
								<table>
									<thead>
										<tr>
											<th>編號</th>
											<th>種類</th>
											<th>名稱</th>
											<th>存量</th>
											<th>買價</th>
											<th>售價</th>
											<th>介紹</th>
											<th>狀態</th>
											<th>圖片</th>
										</tr>
									</thead>
									<tbody id="resultTable">
										<td id='id'><input id='productid' type='text'
											class='產品編號' name='id' value='' disabled></td>
										<td id='typeList' width='155px'><input id='producttype'
											type='text' class='產品種類 input' name='type' value=''></td>
										<td id='name'><input id='productname' type='text'
											class='產品名稱 input' name='name' value=''></td>
										<td><input id='productstock' type='text'
											class='產品存量 input' name='stock' value=''></td>
										<td><input id='productcost' type='text'
											class='產品買價 input' name='cost' value=''></td>
										<td><input id='productprice' type='text'
											class='產品售價 input' name='price' value=''></td>
<!-- 										<td><input id='productdescription' type='text' class='產品介紹 input' name='description' value=''></td> -->
										
										<td><textarea id='productdescription' class='產品介紹 input' name='description' rows='10' cols='50' value=''></textarea></td>
										
										<td><input type="checkbox" id="productstate" value="true"  checked="checked"> <label for="productstate">上架</label></td>
										<td id='imageTD'><input id='productimage' type='file'
											class='產品圖片 input' name='imageFile' value=''></td>

									</tbody>
								</table>
							</form>
							<p id="inputChecking"></p>
							<!--DataTables放入位置-->


							<!-- 以下勿動 -->
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Alimento 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/js/common/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="/js/product/insert.js"></script>
	
</body>
</html>