<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>轮播</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${APP_PATH }/static/css/login.css" rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

<div class="row">
  <div class="col-md-9 col-md-pull-3">

	<div id="myCarousel" class="carousel slide"data-ride="carousel">
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
					 <div class="center-block">
						<div class="col-md-1">周日</div>
						<div class="col-md-1">周一</div>
						<div class="col-md-1">周二</div>
						<div class="col-md-1">周三</div>
						<div class="col-md-1">周四</div>
						<div class="col-md-1">周五</div>
						<div class="col-md-1">周六</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="container">
					<div class="center-block">
						<div class="col-md-1">周日</div>
						<div class="col-md-1">周一</div>
						<div class="col-md-1">周二</div>
						<div class="col-md-1">周三</div>
						<div class="col-md-1">周四</div>
						<div class="col-md-1">周五</div>
						<div class="col-md-1">周六</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="container">
					<div class="center-block">
						<div class="col-md-1">周日</div>
						<div class="col-md-1">周一</div>
						<div class="col-md-1">周二</div>
						<div class="col-md-1">周三</div>
						<div class="col-md-1">周四</div>
						<div class="col-md-1">周五</div>
						<div class="col-md-1">周六</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
	</div>
	</div>
	</div>


</body>
<script type="text/javascript">
	  $(document).ready(function(){
   		 $('#myCarousel').carousel('pause');
    });
	  
	</script>
</html>