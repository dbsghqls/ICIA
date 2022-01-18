<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="board/css/style.css?ver1">
<link rel="stylesheet" href="board/css/hf.css?ver=1">

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="board/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="board/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="board/admin/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="board/admin/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="board/admin/plugins/summernote/summernote-bs4.min.css">
<script type="text/javascript">
	$(function() {
		//메시지 출력 부분
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}

		//로그인한 회원 정보 및 로그아웃 출력
		var lname = "${mb.m_name}";
		$("#mname").html(lname + "님");
		$(".suc").css("display", "block");
		$(".bef").css("display", "none");
	});
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed"
	data-panel-auto-height-mode="height">
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href=./main
					"
					class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a target="_sub"
					href="http://suynthe.cafe24.com/" class="nav-link">Dabyinsa
						Mall</a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<nav class="top-right">
					<ul>
						<li class="suc" id="grade"><b>${mb.m_grade}</b></li>
						<li class="suc" id="mname">게스트님</li>
						<li class="suc"><a href="/logout">로그아웃</a></li>
						<li class="bef"><a href="./loginFrm">로그인</a></li>
						<li class="bef"><a href="./joinFrm">회원가입</a></li>
					</ul>
				</nav>
			</ul>
		</nav>

		<!-- Messages Dropdown Menu -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="./main" class="brand-link"> <img
				src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">DABYINSA</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">도움이 필요하신가요?</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									상품관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="newproduct"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>상품 등록</p>
								</a></li>
								<li class="nav-item"><a href="productlist"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>상품 목록</p>
								</a></li>
							</ul></li>

						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-chart-pie"></i>
								<p>
									주문관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="adorderlist" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>전체주문목록</p>
								</a></li>
								<li class="nav-item"><a href="adordercancel"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>취소</p>
								</a></li>
								<li class="nav-item"><a href="adorderchange"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>교환</p>
								</a></li>
								<li class="nav-item"><a href="adorderreturns"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>반품</p>
								</a></li>
								<li class="nav-item"><a href="adordercashrefund"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>환불</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-chart-pie"></i>
								<p>
									배송 관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="adpaymentlist"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>입금전</p>
								</a></li>
								<li class="nav-item"><a href="adshippedbeginlist"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>배송준비중</p>
								</a></li>
								<li class="nav-item"><a href="adshippedstandbylist"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>배송대기</p>
								</a></li>
								<li class="nav-item"><a href="adshippedendlist"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>배송중</p>
								</a></li>
								<li class="nav-item"><a href="adshippedcompletelist"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>배송완료</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-tree"></i>
								<p>
									고객/게스트관리 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/UI/general.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>고객관리</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/icons.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>게스트관리</p>
								</a></li>

							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-edit"></i>
								<p>
									QR관리 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/list" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>QR 조회/수정</p>
								</a></li>
								<li class="nav-item"><a href="/writeFrm" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>QR 등록</p>
								</a></li>
							</ul></li>
						<li class="nav-header">NOTICE</li>
						<li class="nav-item"><a href="/notice_list" class="nav-link">
								<i class="nav-icon far fa-calendar-alt"></i>
								<p>공지사항</p>
						</a></li>
						<li class="nav-item"><a href="/infuse_list" class="nav-link">
								<i class="nav-icon fas fa-columns"></i>
								<p>이용안내</p>
						</a></li>
						<li class="nav-item"><a href="/oneone_list" class="nav-link">
								<i class="nav-icon far fa-envelope"></i>
								<p>1:1문의</p>
						</a></li>

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper iframe-mode" data-widget="iframe"
			data-loading-screen="750">
			<div
				class="nav navbar navbar-expand navbar-white navbar-light border-bottom p-0">
				<div class="nav-item dropdown">
					<a class="nav-link bg-danger dropdown-toggle"
						data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
						aria-expanded="false">Close</a>
					<div class="dropdown-menu mt-0">
						<a class="dropdown-item" href="#" data-widget="iframe-close"
							data-type="all">Close All</a> <a class="dropdown-item" href="#"
							data-widget="iframe-close" data-type="all-other">Close All
							Other</a>
					</div>
				</div>
				<a class="nav-link bg-light" href="#"
					data-widget="iframe-scrollleft"><i
					class="fas fa-angle-double-left"></i></a>
				<ul class="navbar-nav overflow-hidden" role="tablist"></ul>
				<a class="nav-link bg-light" href="#"
					data-widget="iframe-scrollright"><i
					class="fas fa-angle-double-right"></i></a> <a class="nav-link bg-light"
					href="#" data-widget="iframe-fullscreen"><i
					class="fas fa-expand"></i></a>
			</div>
			<!-- Main content -->
			<div class="tab-content">
				<div class="tab-empty">
					<div class="container-fluid" style="margin-top: -600px;">
						<!-- Small boxes (Stat box) -->
						<div class="row">
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-info">
									<div class="inner">
										<h3>150</h3>
										<p>등록상품</p>
									</div>
									<div class="icon">
										<i class="ion ion-bag"></i>
									</div>
									<a href="#" class="small-box-footer">More info <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-success">
									<div class="inner">
										<h3>323</h3>

										<p>생성 QR Code</p>
									</div>
									<div class="icon">
										<i class="ion ion-stats-bars"></i>
									</div>
									<a href="./list" class="small-box-footer">More info <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- 메인페이지 small-box 추가 
						<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-warning">
									<div class="inner">
										<h3>9343</h3>

										<p>이용 하객</p>
									</div>
									<div class="icon">
										<i class="ion ion-person-add"></i>
									</div>
									<a href="#" class="small-box-footer">More info <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-6">
								<!-- small box -->
								<div class="small-box bg-danger">
									<div class="inner">
										<h3>265</h3>

										<p>추천상품</p>
									</div>
									<div class="icon">
										<i class="ion ion-pie-graph"></i>
									</div>
									<a href="#" class="small-box-footer">More info <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
						</div>
					</div>
				</div>
				<div class="tab-loading">
					<div>
						<h2 class="display-4">
							Tab is loading <i class="fa fa-sync fa-spin"></i>
						</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h6 class="m-0"></h6>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->
		<footer>
			<jsp:include page="footer.jsp" />
		</footer>

		<!-- /.content -->
	</div>
	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget
				.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="board/admin/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="board/admin/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script src="board/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="board/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="board/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="board/admin/plugins/moment/moment.min.js"></script>
	<script src="board/admin/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="board/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="board/admin/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- Channel Plugin Scripts -->
	<script>
		(
						function() {
							var w = window;
							if (w.ChannelIO) {
								return (window.console.error
										|| window.console.log || function() {
								})('ChannelIO script included twice.');
							}
							var ch = function() {
								ch.c(arguments);
							};
							ch.q = [];
							ch.c = function(args) {
								ch.q.push(args);
							};
							w.ChannelIO = ch;
							function l() {
								if (w.ChannelIOInitialized) {
									return;
								}
								w.ChannelIOInitialized = true;
								var s = document.createElement('script');
								s.type = 'text/javascript';
								s.async = true;
								s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
								s.charset = 'UTF-8';
								var x = document.getElementsByTagName('script')[0];
								x.parentNode.insertBefore(s, x);
							}
							if (document.readyState === 'complete') {
								l();
							} else if (window.attachEvent) {
								window.attachEvent('onload', l);
							} else {
								window.addEventListener('DOMContentLoaded', l,
										false);
								window.addEventListener('load', l, false);
							}
						})();
		ChannelIO('boot', {
			"pluginKey" : "a9c853e7-aba2-4a9d-b476-e2e1e4bb3f4e"
		});
	</script>
	<!-- End Channel Plugin -->
	<script type="text/javascript">
		document.onkeydown = trapRefresh;
		function trapRefresh() {
			if (event.keyCode == 116) {
				event.keyCode = 0;
				event.cancleBubble = true;
				event.returnValue = true;
				document.main.location.reload();
			}
		}
	</script>
</body>
</html>
