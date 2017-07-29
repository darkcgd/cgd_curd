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
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/jquerysession.js"></script>
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
				<form class="form-horizontal" name="formUserRegistOrLogin"
					id="formUserRegistOrLogin" onsubmit="return sumbit();">
					<span class="heading">用户注册</span>
					<div class="form-group">
						<!-- placeholder="用户名(2-5位中文或者6-16位英文和数字的组合)" placeholder="密码"   placeholder="确认密码"-->
						<input type="text" class="form-control" id="inputName" name="name"
							value="dark_cgd"> <span class="help-block"></span>
					</div>
					<div class="form-group help">
						<input type="password" class="form-control" id="inputPassword"
							name="pwd" value="123456"> <span class="help-block"></span>
					</div>
					<div id="div_confirm_pwd" class="form-group help">
						<input type="password" class="form-control" name="confirmpwd"
							id="inputConfirmPassword" value="123456"> <span
							class="help-block"></span>
					</div>
					<div class="form-group">
						<div class="main-checkbox">
							<input type="checkbox" value="None" id="checkbox1" name="check" />
							<label for="checkbox1"></label>
						</div>
						<span class="text">记住我</span>
						<button id="btn_login" type="submit" class="btn btn-primary">注册</button>
					</div>
					<span id="span_status" class="help-block"></span>
				</form>

			</div>
		</div>
	</div>
	<script type="text/javascript">
	/* $("#btn_login").bind("click", function() {
			 if($("#div_confirm_pwd").is(":hidden")){
			       $("#div_confirm_pwd").show();    //如果元素为隐藏,则将它显现
			}else{
			      $("#div_confirm_pwd").hide();     //如果元素为显现,则将其隐藏
			}
			 
			 alert($("#formUserRegistOrLogin form").serialize());
			 
			window.event.returnValue=false;
			//$("#btn_login").blur(); //去除焦点 
		}); */
	
	 //ajax提交  
    $("#btn_login").click(function() {  
    	doRegist();
    })  
    
    
    function doRegist() {
			 $("#btn_login").blur(); //去除焦点 
		    	//1、拿到要校验的数据，使用正则表达式
				var empName = $("#inputName").val();
				var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
				if(!regName.test(empName)){
					//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
					show_validate_msg("#inputName", "error", "用户名需要是2-5位中文或者6-16位英文和数字的组合!");
					return false;
				}else{
					show_validate_msg("#inputName", "success", "");
				};
				
				//2.校验密码是否为空 是否一致
				var inputPassword = $("#inputPassword").val();
				var inputConfirmPassword = $("#inputConfirmPassword").val();
				 if(inputPassword==null || inputPassword==""){  
					 show_validate_msg("#inputPassword","error", "密码不能为空!");
					 return false;
				 }else{
						show_validate_msg("#inputPassword", "success", "");
					};
				 if(inputConfirmPassword==null || inputConfirmPassword==""){  
					 show_validate_msg("#inputConfirmPassword","error", "确认密码不能为空!");
					 return false;
				 }else{
						show_validate_msg("#inputConfirmPassword", "success", "");
					};
					 if(inputPassword!=inputConfirmPassword){  
						 show_validate_msg("#inputConfirmPassword","error", "两次密码不一致!");
						 return false;
					 }else{
							show_validate_msg("#inputConfirmPassword", "success", "");
						};
		        var params = $("#formUserRegistOrLogin").serialize();
		        
		        /**
		        {
    "code": 100,
    "msg": "注册成功",
    "data": {
        "user_sex": null,
        "user_email": null,
        "user_id": 20,
        "user_name": "dark_cgd",
        "user_phone": null,
        "user_token": null
    }
}
		        */
		        
		      //2、发送ajax请求保存员工
				$.ajax({
					url:"${APP_PATH}/regist",
					type:"GET",
					data:params,
					success:function(result){
						var code=result.code;
						if(code!=100){
							$("#span_status").addClass("has-error");
							$("#span_status").text(result.msg);
						}else{
							$("#span_status").addClass("has-success");
							$("#span_status").text(result.msg);
							var msg=result.msg;
							var data=result.data;
							var userId=data.user_id;
							var userName=data.user_name;
							
							/**
							添加数据
    $.session.set('key', 'value')

删除数据
    $.session.remove('key');

获取数据
    $.session.get('key');

清除数据
    $.session.clear();
							*/
							
							//request.getSession().setAttribute("userId", data.user_id);  
							//request.getSession().setAttribute("userName", data.user_name);  
							
							$.session.set('userId', data.user_id)
							$.session.set('userName', data.user_name)
							
							 //window.location.href="views/imageTest.jsp?userid="+data.user_id+"&username="+data.user_name;
							 window.location.href="views/imageTest.jsp";
							//window.event.returnValue=false; 
							
						}
						/*
						console.log("code:"+code+"\t"+"msg:"+msg+"\t"+"userId:"+userId+"\t"+"userName:"+userName+"\t");
						*/
					}
				});
		      
				window.event.returnValue=false;
		      
				
	}
    
    //显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			$("#span_status").removeClass("has-success has-error");
			$("#span_status").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		
		//焦点离开时 校验用户名是否可用
		$("#inputName").change(function(){
			//1、拿到要校验的数据，使用正则表达式
			var empName = $("#inputName").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(empName)){
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				show_validate_msg("#inputName", "error", "用户名需要是2-5位中文或者6-16位英文和数字的组合");
				return false;
			}else{
				show_validate_msg("#inputName", "success", "");
			};
		});
    
		
	</script>

</body>
</html>