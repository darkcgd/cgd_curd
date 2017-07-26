<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
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
<link href="${APP_PATH }/static/css/login.css" rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form class="form-horizontal"  id="formUserRegistOrLogin" ">
					<span class="heading">用户注册</span>
					<div class="form-group">
						<input type="email" class="form-control" id="inputEmail"
							placeholder="用户名或电子邮件"> <i class="fa fa-user"></i>
					</div>
					<div class="form-group help">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="密码"> <i class="fa fa-lock"></i> <a href="#"
							class="fa fa-question-circle"></a>
					</div>
					<div id="div_confirm_pwd" class="form-group help">
						<input type="password" class="form-control"
							id="confirmInputPassword" placeholder="确认密码"> <i
							class="fa fa-lock"></i> <a href="#" class="fa fa-question-circle"></a>
					</div>
					<div class="form-group">
						<div class="main-checkbox">
							<input type="checkbox" value="None" id="checkbox1" name="check" />
							<label for="checkbox1"></label>
						</div>
						<span class="text">Remember me</span>
						<button id="btn_login" type="submit" class="btn btn-primary" >注册</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$("#btn_login").bind("click", function() {
			 /*if($("#div_confirm_pwd").is(":hidden")){
			       $("#div_confirm_pwd").show();    //如果元素为隐藏,则将它显现
			}else{
			      $("#div_confirm_pwd").hide();     //如果元素为显现,则将其隐藏
			}*/
			 
			 alert($("#formUserRegistOrLogin form").serialize());
			 
			window.event.returnValue=false;
			//$("#btn_login").blur();  
		});
		
		function submit(){
            //alert($('#formUserRegistOrLogin').serialize());
            alert($("#formUserRegistOrLogin form").serialize());
        };
	</script>

</body>
</html>