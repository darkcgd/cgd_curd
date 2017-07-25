<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大家返 返大家</title>

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
<link href="${APP_PATH }/static/css/base.css" rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

	<!-- <div class="container">
		<div class="row myCenter" style="margin-top: 100px">
			<div class="col-md-offset-3 col-md-6">
				<form >
					<span >用户登录</span>
				</form>
			</div>
		</div>
	</div> -->


	<!-- <div class="container">  
  <div class="row">  
    <div class="col-xs-6 col-md-4 col-center-block">  
      <form class="form-signin">  
        <h2 class="form-signin-heading">请登录</h2>  
        <label for="username" class="sr-only">用户名</label>  
        <input type="text" id="username" class="form-control" placeholder="用户名" required autofocus>  
        <label for="inputPassword" class="sr-only">密码</label>  
        <input type="password" id="inputPassword" class="form-control" placeholder="密码" required>  
        <div class="checkbox">  
          <label>  
            <input type="checkbox" value="remember-me">  
            记住我 </label>  
        </div>  
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>  
      </form>  
    </div>  
  </div>  
</div>   -->



	<div class="main-nav">
		<div class="container">
			<div class="row " style="margin-top: 50px">
			
	<img src="${APP_PATH }/static/image/logo.png" alt="公告"
					class="img-circle  center-block magintop20">
			
				<nav class="navbar navbar-default"  style="margin-top: 50px" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">首页</a>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li><a href="#">天猫优惠券</a></li>
							<li><a href="#">京东优惠券</a></li>
							<li><a href="#">预约提醒</a></li>
							<li><a href="http://www.qianggou8.cn">大家返</a></li>

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">抢购常用链接 <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">华为常用链接</a></li>
									<li><a href="#">小米常用链接</a></li>
									<li><a href="#">魅族常用链接</a></li>
									<li><a href="#">其他</a></li>
								</ul></li>
							<li><a href="#">抢购软件</a></li>
							<li><a href="#">每日报价参考 </a></li>
							<li><a href="http://www.qianggou8.cn">关于大家返 </a></li>

						</ul>
					</div>
				</div>
				</nav>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row" style="margin-top: 30px">
			<div class="col-xs-4" style="text-align: center">
				<img src="${APP_PATH }/static/image/bg_gonggao.jpg" alt="公告"
					class="img-rounded">
				<img src="${APP_PATH }/static/image/bg_gonggao.jpg" alt="公告"
					class="img-circle magintop20">
					<br>
				<img src="${APP_PATH }/static/image/bg_gonggao.jpg" alt="公告"
					class="img-rounded magintop20">
			</div>

			<div class="col-xs-8">

				<div style="background-color: #F1F1F1;padding: 20px">
					<a href="#"">
						<a><span style="font-size: 24px">【7.25周二】手机抢购表(京东数码超级品类日)</span></a>
					</a> 
					<br><br>
					<a  style="font-size: 20px;margin-left: 20px" href="#">00:00【京东数码品类日】</a>
						<br><br>
						<a class="main-list-body">荣耀9 4+64金（2299-5181406）  荣耀9 4+64灰（2299-5181404）</a>
						<br><br>
						<a class="main-list-body">荣耀9 4+64蓝（2299-5181380）  荣耀9 4+64黑（2299-4538873）</a>
						<br><br>
						<a class="main-list-body">荣耀9​（2299起）</a>
						<br><br>
						<a class="main-list-body">荣耀9​（2299起）</a>
				</div>

				<div style="background-color: #F1F1F1;padding: 20px;margin-top: 20px">
					<a href="#"">
						<a><span style="font-size: 24px">【7.25周二】手机抢购表(京东数码超级品类日)</span></a>
					</a> 
					<br><br>
					<a  style="font-size: 20px;margin-left: 20px" href="#">00:00【京东数码品类日】</a>
						<br><br>
						<a class="main-list-body">荣耀9 4+64金（2299-5181406）  荣耀9 4+64灰（2299-5181404）</a>
						<br><br>
						<a class="main-list-body">荣耀9 4+64蓝（2299-5181380）  荣耀9 4+64黑（2299-4538873）</a>
						<br><br>
						<a class="main-list-body">荣耀9​（2299起）</a>
						<br><br>
						<a class="main-list-body">荣耀9​（2299起）</a>
				</div>

				<div style="background-color: #F1F1F1;padding: 20px;margin-top: 20px">
					<a href="#"">
						<a><span style="font-size: 24px">【7.25周二】手机抢购表(京东数码超级品类日)</span></a>
					</a> 
					<br><br>
					<a  style="font-size: 20px;margin-left: 20px" href="#">00:00【京东数码品类日】</a>
						<br><br>
						<a class="main-list-body">荣耀9 4+64金（2299-5181406）  荣耀9 4+64灰（2299-5181404）</a>
						<br><br>
						<a class="main-list-body">荣耀9 4+64蓝（2299-5181380）  荣耀9 4+64黑（2299-4538873）</a>
						<br><br>
						<a class="main-list-body">荣耀9​（2299起）</a>
						<br><br>
						<a class="main-list-body">荣耀9​（2299起）</a>
				</div>

				<div style="background-color: #F1F1F1;padding: 20px;margin-top: 20px">
					<a href="#"">
						<a><span style="font-size: 24px">【7.25周二】手机抢购表(京东数码超级品类日)</span></a>
					</a> 
					<br><br>
					<a  style="font-size: 20px;margin-left: 20px" href="#">00:00【京东数码品类日】</a>
						<br><br>
						<a class="main-list-body">荣耀9 4+64金（2299-5181406）  荣耀9 4+64灰（2299-5181404）</a>
						<br><br>
						<a class="main-list-body">荣耀9 4+64蓝（2299-5181380）  荣耀9 4+64黑（2299-4538873）</a>
						<br><br>
						<a class="main-list-body">荣耀9​（2299起）</a>
						<br><br>
						<a class="main-list-body">荣耀9​（2299起）</a>
				</div>
				
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			dropdownOpen();//调用
		});
		/**
		 * 鼠标划过就展开子菜单，免得需要点击才能展开
		 */
		function dropdownOpen() {

			var $dropdownLi = $('li.dropdown');

			$dropdownLi.mouseover(function() {
				$(this).addClass('open');
			}).mouseout(function() {
				$(this).removeClass('open');
			});
		}
		
		
		//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
		$(function(){
			//去首页
			to_page(1);
		});
		
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					/* alert(result);
					console.log(result); */
				}
			});
		}
		
		
	</script>



</body>
</html>