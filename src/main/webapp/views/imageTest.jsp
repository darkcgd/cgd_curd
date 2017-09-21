<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图片浏览器</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${APP_PATH }/css/login.css" rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>



	<div class="container">
		<div id="myCarousel" class="carousel slide pad_010 b_k"
			data-ride="carousel">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner bor_btm">
				<div class="item active">
					<div class="container">
						<div class="row">
							<div class="col-md-1">周日</div>
							<div class="col-md-1">周一</div>
							<div class="col-md-1">周二</div>
							<div class="col-md-1">周三</div>
							<div class="col-md-1">周四</div>
							<div class="col-md-1">周五</div>
							<div class="col-md-1">周六</div>
							<div class="col-md-1">周日</div>
							<div class="col-md-1">周一</div>
							<div class="col-md-1">周二</div>
							<div class="col-md-1">周三</div>
							<div class="col-md-1">周四</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<div class="row">
							<div class="col-md-1">周日</div>
							<div class="col-md-1">周一</div>
							<div class="col-md-1">周二</div>
							<div class="col-md-1">周三</div>
							<div class="col-md-1">周四</div>
							<div class="col-md-1">周五</div>
							<div class="col-md-1">周六</div>
							<div class="col-md-1">周日</div>
							<div class="col-md-1">周一</div>
							<div class="col-md-1">周二</div>
							<div class="col-md-1">周三</div>
							<div class="col-md-1">周四</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<div class="row">
							<div class="col-md-1">周日</div>
							<div class="col-md-1">周一</div>
							<div class="col-md-1">周二</div>
							<div class="col-md-1">周三</div>
							<div class="col-md-1">周四</div>
							<div class="col-md-1">周五</div>
							<div class="col-md-1">周六</div>
							<div class="col-md-1">周日</div>
							<div class="col-md-1">周一</div>
							<div class="col-md-1">周二</div>
							<div class="col-md-1">周三</div>
							<div class="col-md-1">周四</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>

	<!-- <nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<button type="button" class="btn btn-default btn-lg">
			<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 收藏
		</button>
		<button type="button" class="btn btn-default btn-lg">
			<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 设置
		</button>
		<button type="button" class="btn btn-primary btn-lg">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页
		</button>
	</div>
	</nav> -->

	<div class="container" style="margin-top: 80px">
		<div class="row">

			<ul class="list-group">
				<li class="list-group-item">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">@</span> <input
							type="text" class="form-control" placeholder="Username"
							aria-describedby="basic-addon1">
					</div>

					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Recipient's username"
							aria-describedby="basic-addon2"> <span
							class="input-group-addon" id="basic-addon2">@example.com</span>
					</div>

					<div class="input-group">
						<span class="input-group-addon">$</span> <input type="text"
							class="form-control" aria-label="Amount (to the nearest dollar)">
						<span class="input-group-addon">.00</span>
					</div> <label for="basic-url">Your vanity URL</label>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon3">https://example.com/users/</span>
						<input type="text" class="form-control" id="basic-url"
							aria-describedby="basic-addon3">
					</div>
				</li>
				<li class="list-group-item">
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="#">Home</a></li>
						<li role="presentation"><a href="#">Profile</a></li>
						<li role="presentation"><a href="#">Messages</a></li>
					</ul>

					<ul class="nav nav-pills  nav-justified">
						<li role="presentation" class="active"><a href="#">Home</a></li>
						<li role="presentation"><a href="#">Profile</a></li>
						<li role="presentation"><a href="#">Messages</a></li>
					</ul>
				</li>
				<li class="list-group-item"></li>
				<li class="list-group-item"></li>
			</ul>

			<p class="navbar-text navbar-left">
				<a href="#" class="navbar-link">DarkDarkDarkDarkDarkDarkDarkDarkDarkDarkDarkDark</a>
			</p>


			<div class="alert alert-danger" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span> <span class="sr-only"></span> 书写有误!
			</div>


			<a href="#">Inbox <span class="badge">42</span></a>

			<button class="btn btn-primary" type="button">
				Messages <span class="badge">4</span>
			</button>


		</div>


		<div class="jumbotron">
			<div class="container">
				<h1>Hello, world!</h1>
				<p>This is a simple hero unit, a simple jumbotron-style
					component for calling extra attention to featured content or
					information.</p>
				<p>
					<a class="btn btn-primary btn-lg" href="#" role="button">Learn
						more</a>
				</p>
			</div>
		</div>



		<div class="row">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="${APP_PATH }/static/image/logo.png" alt="测试">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
				style="width: 40%">
				<span class="sr-only">40% Complete (success)</span>
			</div>
		</div>





	</div>
	<script type="text/javascript">
	  var userid = "<%=request.getParameter("userid")%>";  
	  var username = "<%=request.getParameter("username")%>";
		var useridSession = $.session.get('userId');
		var usernameSession = $.session.get('userName');
		//alert(userid+":"+username+":"+useridSession+":"+usernameSession);

		$(document).ready(function() {
			$('#myCarousel').carousel();
		});
	</script>
</body>
</html>