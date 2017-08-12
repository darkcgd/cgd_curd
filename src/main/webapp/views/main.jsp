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
	<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
	<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/static/js/util.js"></script>
	<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${APP_PATH }/static/css/base.css" rel="stylesheet">

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
							<li><a href="https://chaoshi.tmall.com/coupon.htm?spm=a3204.7084717.1998159245.1.pJ4Z6z">天猫优惠券</a></li>
							<li><a href="https://sale.jd.com/act/RvoSGBc4pH0.html?cpdad=1DLSUE">京东优惠券</a></li>
							<li><a href="http://www.qianggou8.cn">预约提醒</a></li>
							<li><a href="http://www.qianggou8.cn">大家返</a></li>

							<li class="dropdown"><a href="#" class="dropdown-toggle"
													data-toggle="dropdown">抢购常用链接 <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="http://consumer.huawei.com/cn/mobile-phones/index.htm">华为常用链接</a></li>
									<li><a href="https://www.mi.com">小米常用链接</a></li>
									<li><a href="https://www.meizu.com">魅族常用链接</a></li>
									<li><a href="https://www.taobao.com">其他</a></li>
								</ul></li>
							<li><a href="http://www.qianggou8.cn">抢购软件</a></li>
							<li><a href="https://mp.weixin.qq.com/s?__biz=MzAxNzMzNDU3OA==&mid=206097994&idx=1&sn=8a1098c664e1a4fe536ac2829d9614b8#rd">每日报价参考 </a></li>
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


		<div class="col-xs-8">


			<ul class="nav nav-tabs nav-justified">
				<li id="li_day1" role="presentation" onclick="clickLi(id)"><a href="#">明天</a></li>
				<li id="li_day2" role="presentation" onclick="clickLi(id)"  class="active"><a href="#">今天(8月9日)</a></li>
				<li id="li_day3" role="presentation"  onclick="clickLi(id)"><a href="#">昨天</a></li>
				<li id="li_day4" role="presentation" onclick="clickLi(id)"><a href="#">8月7日</a></li>
				<li id="li_day5" role="presentation" onclick="clickLi(id)"><a href="#">8月6日</a></li>
				<li id="li_day6" role="presentation" onclick="clickLi(id)"><a href="#">8月5日</a></li>
			</ul>

			<div style="background-color: #FFFFFF;padding: 20px">
				<%--<a href="#">
                    <a><span style="font-size: 24px">【7.25周二】手机抢购表(京东数码超级品类日)</span></a>
                </a> --%>
				<h2 id="a_title_body" style="font-size: 20px;margin-left: 20px"><%--00:00【京东数码品类日】--%></h2>
				<%--<br><br>
                <a class="main-list-body">荣耀9 4+64金（2299-5181406）  荣耀9 4+64灰（2299-5181404）</a>
                <br><br>
                <a class="main-list-body">荣耀9 4+64蓝（2299-5181380）  荣耀9 4+64黑（2299-4538873）</a>
                <br><br><br><br>
                <a class="main-list-body">荣耀9​（2299起）</a>
                <br><br>
                <a class="main-list-body">荣耀9​（2299起）</a>--%>
			</div>

		</div>
		<div class="col-xs-4" style="text-align: center">
			<div>
				<span style="font-size: 30px;color: #ff0a27">公告:</span>
				<br><br>
				1.请加抢购群:143314905
				<br><br>
				2.每天会不定时更新抢购信息
				<br><br>
				<span style="font-size: 16px;color: #ff0a27">明天的小米7抢购会很激烈,各位抢友要给力啦!</span>
			</div>
			<img src="${APP_PATH }/static/image/qrcode.jpg" alt="公告"
				 class="img-rounded img-responsive center-block magintop20">
			<br>
			<a href="https://detail.ju.taobao.com/home.htm?spm=a220o.1000855.1998059570.1.4732a2bdmEZBXA&item_id=549049522944&ali_trackid=2:mm_31735899_13434959_53336292:1501666709_310_1044786802">
				<img src="${APP_PATH }/static/image/ad1.jpg" alt="公告"
					 class="img-rounded img-responsive center-block magintop20">
			</a>
			<a href="https://detail.ju.taobao.com/home.htm?spm=a220o.1000855.1998059570.1.4732a2bdmEZBXA&item_id=549049522944&ali_trackid=2:mm_31735899_13434959_53336292:1501666709_310_1044786802">
				<img src="${APP_PATH }/static/image/ad2.jpg" alt="公告"
					 class="img-rounded img-responsive center-block magintop20">
			</a>
			<a href="https://detail.ju.taobao.com/home.htm?spm=a220o.1000855.1998059570.1.4732a2bdmEZBXA&item_id=549049522944&ali_trackid=2:mm_31735899_13434959_53336292:1501666709_310_1044786802">
				<img src="${APP_PATH }/static/image/ad3.jpg" alt="公告"
					 class="img-rounded img-responsive center-block magintop20">
			</a>
			<a href="https://detail.ju.taobao.com/home.htm?spm=a220o.1000855.1998059570.1.4732a2bdmEZBXA&item_id=549049522944&ali_trackid=2:mm_31735899_13434959_53336292:1501666709_310_1044786802">
				<img src="${APP_PATH }/static/image/ad4.jpg" alt="公告"
					 class="img-rounded img-responsive center-block magintop20">
			</a>
		</div>

	</div>
	<div class="text-center" style="margin-top: 50px;margin-bottom: 60px">
		© 2012-2017 大家返 版权所有 粤ICP备17088525号
		<br><br>
		声明：本站版权归原作者所有，如果有侵犯到您的权益，请联系本站删除 网站管理员QQ：492404822
	</div>

</div>

<script type="text/javascript">
    var currentdate = new Date();
    var currentDay = currentdate.getDate(); //获取当前日(1-31)

    $(document).ready(function() {
        getQianggoubiaoInfo(currentdate.getFullYear()+"-"+(currentdate.getMonth() + 1) + "-" + currentdate.getDate(),1);
        dropdownOpen();//调用
        setDateToLi();
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


    function setDateToLi(){
        change("#li_day1 a",1);
        change("#li_day2 a",0);
        change("#li_day3 a",-1);
        change("#li_day4 a",-2);
        change("#li_day5 a",-3);
        change("#li_day6 a",-4);
    }


    function change(ele,addDay) {
        var d7 = currentdate.setDate(currentDay + addDay);
        var date = new Date(d7);
        var getFullYear = date.getFullYear(); //获取完整的年份(4位,1970-????)
        var getMonth = date.getMonth(); //获取当前月份(0-11,0代表1月)
        var getDate = date.getDate(); //获取当前日(1-31)
        if(addDay==1){
            $(ele).text("明天").val(getFullYear+"-"+(getMonth + 1) + "-" + getDate);
        }else if(addDay==0){
            $(ele).text("今天("+(getMonth + 1)+"月"+ getDate + "日)").val(getFullYear+"-"+(getMonth + 1) + "-" + getDate);
        }else if(addDay==-1){
            $(ele).text("昨天").val(getFullYear+"-"+(getMonth + 1) + "-" + getDate);
        }else{
            $(ele).text((getMonth + 1)+"月"+ getDate + "日").val(getFullYear+"-"+(getMonth + 1) + "-" + getDate);
        }
    }

    function clickLi(id){
        $("#li_day1").removeClass("active");
        $("#li_day2").removeClass("active");
        $("#li_day3").removeClass("active");
        $("#li_day4").removeClass("active");
        $("#li_day5").removeClass("active");
        $("#li_day6").removeClass("active");

        $("#"+id).addClass("active");
        var value = $("#"+id).children().val();
        getQianggoubiaoInfo(value,1);

        //alert(value);
    }


    function getQianggoubiaoInfo(qianggouTime,pn){
        //alert("pagerNumber="+pn+"&qianggoubiaoTime="+qianggouTime);
        console.log("pagerNumber="+pn+"&qianggoubiaoTime="+qianggouTime)
        $.ajax({
            url:"${APP_PATH}/qianggoubiao/getInfo",
            data:"pagerNumber="+pn+"&qianggoubiaoTime="+qianggouTime,
            type:"GET",
            success:function(result){
                $("#a_title_body").empty();
                console.log(result);

                var listInfo = result.data.list;
                var length=listInfo.length;
                if(length==0){
                    $("<h4></h4>").append("该天暂无抢购信息!")
                        .append("<br><br>")
                        .appendTo("#a_title_body");
                }else{
                    $.each(listInfo,function(index,item){
                        var requetQianggoutime=item.qianggoubiaoTime;
                        var qianggoutime=getFormatDateByLong(requetQianggoutime,"hh:mm");
                        var platformName=item.platformName;
                        var brandName=item.brandName;
                        var qianggouInfo=$("<span></span>").append(qianggoutime+" "+platformName+"-"+brandName+" ").css("color","red");
                        $("<a></a>").append(qianggouInfo).append(item.qianngouName).addClass("main-list-body")
                            .attr("href",item.directeUrl).append("<br><br>")
                            .appendTo("#a_title_body");

                        /*<br><br>
                            <a class="main-list-body">荣耀9 4+64金（2299-5181406）  荣耀9 4+64灰（2299-5181404）</a>*/
                    });
                }

            }
        });
    }

</script>



</body>
</html>