<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="com.cgd.crud.util.TokenUtil" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录</title>
	<%
		pageContext.setAttribute("APP_PATH", request.getContextPath());
	%>
	<!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
	<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${APP_PATH }/js/util.js"></script>
	<script src="${APP_PATH }/js/jquerysession.js"></script>

	<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${APP_PATH }/css/login.css" rel="stylesheet">
	<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/des3/tripledes2.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/des3/cipher-core.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/des3/core.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/des3/mode-ecb.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/js/des3/md5.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<form class="form-horizontal" name="formUserRegistOrLogin"
				  id="formUserRegistOrLogin" onsubmit="return sumbit();">
				<span class="heading">用户登录</span>
				<div class="form-group">
					<!-- placeholder="用户名(2-5位中文或者6-16位英文和数字的组合)" placeholder="密码"   placeholder="确认密码"-->
					<input type="text" class="form-control" id="inputName" name="name"
						   value="浪漫满店"> <span class="help-block"></span>
				</div>
				<div class="form-group help">
					<input type="password" class="form-control" id="inputPassword"
						   name="pwd" value="123456"> <span class="help-block"></span>
				</div>
				<div id="div_confirm_pwd" class="form-group help hidden">
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
					<button id="btn_login" type="submit" class="btn btn-primary">登录</button>
				</div>
				<span id="span_status"></span>
			</form>

		</div>
	</div>
</div>
<script type="text/javascript">

    $(function(){
		/* var isLogin =  $.session.get('isLogin');
		 if (isLogin) {
		 window.location.href = "admin.jsp";
		 window.event.returnValue = false;
		 }*/
    });

    //ajax提交
    $("#btn_login").click(function() {
        doLogin(); //如果元素为隐藏,则登录

		/*var isLogin =  $.session.get('isLogin');
		 if (isLogin) {
		 window.location.href = "admin.jsp";
		 window.event.returnValue = false;
		 } else {
		 if ($("#div_confirm_pwd").is(":hidden")) {
		 doLogin(); //如果元素为隐藏,则登录
		 } else {
		 doRegist(); //如果元素为显现,则注册
		 }
		 }*/
    })

    function doLogin() {
        $("#btn_login").blur(); //去除焦点
        //1、拿到要校验的数据，使用正则表达式
        var empName = $("#inputName").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            show_validate_msg("#inputName", "error",
                "用户名需要是2-5位中文或者6-16位英文和数字的组合!");
            return false;
        } else {
            show_validate_msg("#inputName", "success", "");
        }
        ;

        //2.校验密码是否为空 是否一致
        var inputPassword = $("#inputPassword").val();
        if (inputPassword == null || inputPassword == "") {
            show_validate_msg("#inputPassword", "error", "密码不能为空!");
            return false;
        } else {
            show_validate_msg("#inputPassword", "success", "");
        }
        ;

        //name=dark_cgd&pwd=123456&confirmpwd=123456
        //var params = $("#formUserRegistOrLogin").serialize();

        inputPassword = encryptByDES(inputPassword,"abc123.*abc123.*abc123.*abc123.*");
        var params = "name="+empName+"&pwd="+inputPassword;
        //alert(params);

        /**
         {
  "code": 100,
  "msg": "登录成功",
  "data": {
    "phone": null,
    "sex": 1,
    "name": "cyx123",
    "headUrl": null,
    "userId": 47,
    "age": 22,
    "email": null,
    "token": "8759401F6C20B8179EC337C6DEE3A620"
  }
}
         */

        //2、发送ajax请求保存员工
        $.ajax({
            url : "${APP_PATH}"+DO_SHOP_LOGIN,
            type : "GET",
            data : params,
            success : function(result) {
                var code = result.code;
                if (code != 100) {
                    $("#span_status").addClass("has-error");
                    $("#span_status").text(result.msg);
                    $.session.remove('isLogin');
                } else {
                    $("#span_status").addClass("has-success");
                    $("#span_status").text(result.msg);
                    var msg = result.msg;
                    var data = result.data;
                    var shopId = data.shopId;
                    var shopName = data.shopName;
                    var token = data.token;
                    $.session.set('shopId', shopId);
                    $.session.set('shopName', shopName);
                    $.session.set('isLogin', true);
                    $.session.set('token', token);

                    window.location.href = "admin.jsp";

                }
            }
        });

        window.event.returnValue = false;
    };

    function doRegist() {
        $("#btn_login").blur(); //去除焦点
        //1、拿到要校验的数据，使用正则表达式
        var empName = $("#inputName").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            show_validate_msg("#inputName", "error",
                "用户名需要是2-5位中文或者6-16位英文和数字的组合!");
            return false;
        } else {
            show_validate_msg("#inputName", "success", "");
        }
        ;

        //2.校验密码是否为空 是否一致
        var inputPassword = $("#inputPassword").val();
        var inputConfirmPassword = $("#inputConfirmPassword").val();
        if (inputPassword == null || inputPassword == "") {
            show_validate_msg("#inputPassword", "error", "密码不能为空!");
            return false;
        } else {
            show_validate_msg("#inputPassword", "success", "");
        }
        ;
        if (inputConfirmPassword == null || inputConfirmPassword == "") {
            show_validate_msg("#inputConfirmPassword", "error", "确认密码不能为空!");
            return false;
        } else {
            show_validate_msg("#inputConfirmPassword", "success", "");
        }
        ;
        if (inputPassword != inputConfirmPassword) {
            show_validate_msg("#inputConfirmPassword", "error", "两次密码不一致!");
            return false;
        } else {
            show_validate_msg("#inputConfirmPassword", "success", "");
        }
        ;
        //name=dark_cgd&pwd=123456&confirmpwd=123456
        //var params = $("#formUserRegistOrLogin").serialize();

        inputPassword = encryptByDES(inputPassword,"abc123.*abc123.*abc123.*abc123.*");
        inputConfirmPassword = encryptByDES(inputConfirmPassword,"abc123.*abc123.*abc123.*abc123.*");
        var params = "name="+empName+"&pwd="+inputPassword;
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
            url : "${APP_PATH}"+DO_USER_REGIST,
            type : "GET",
            data : params,
            success : function(result) {
                var code = result.code;
                if (code != 100) {
                    $("#span_status").addClass("has-error");
                    $("#span_status").text(result.msg);
                    $.session.remove('isLogin');
                } else {
                    $("#span_status").addClass("has-success");
                    $("#span_status").text(result.msg);
                    var msg = result.msg;
                    var data = result.data;
                    var shopId = data.shopId;
                    var shopName = data.shopName;
                    var token = data.token;
                    $.session.set('shopId', shopId);
                    $.session.set('shopName', shopName);
                    $.session.set('isLogin', true);
                    $.session.set('token', token);

                    //window.location.href="views/imageTest.jsp?userid="+data.user_id+"&username="+data.user_name;
                    window.location.href = "admin.jsp";
                    //window.event.returnValue=false;

                }
            }
        });

        window.event.returnValue = false;

    }

    //显示校验结果的提示信息
    function show_validate_msg(ele, status, msg) {
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        $("#span_status").removeClass("has-success has-error");
        $("#span_status").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //焦点离开时 校验用户名是否可用
    $("#inputName")
        .change(
            function() {
                //1、拿到要校验的数据，使用正则表达式
                var empName = $("#inputName").val();
                var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
                if (!regName.test(empName)) {
                    //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    show_validate_msg("#inputName", "error",
                        "用户名需要是2-5位中文或者6-16位英文和数字的组合");
                    return false;
                } else {
                    show_validate_msg("#inputName", "success", "");
                }
                ;
            });

    //des3加密
    function encryptByDES(message, key) {
        var keyHex = CryptoJS.enc.Utf8.parse(key);
        var encrypted = CryptoJS.DES.encrypt(message, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        return encrypted.toString();
    }

    //des3解密
    function decryptByDES(ciphertext, key) {
        var keyHex = CryptoJS.enc.Utf8.parse(key);
        // direct decrypt ciphertext
        var decrypted = CryptoJS.DES.decrypt({
            ciphertext: CryptoJS.enc.Base64.parse(ciphertext)
        }, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        return decrypted.toString(CryptoJS.enc.Utf8);
    }

</script>

</body>
</html>