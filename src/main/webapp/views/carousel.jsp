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
<link href="${APP_PATH }/static/css/base.css" rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-8 col-center-block">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators hide">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="text-center"
						style="padding-right: 10px; margin-left: 20px; margin-right: 20px">
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner bor_btm" style="height: 60px">
							<div class="item active">
								<div class="container">
									<div class="row">
										<div class="col-xs-12  col-md-12 col-center-block">
											<div class="col-md-1">
												<div id="div1" class="div-choose-green"
													onclick="clickDay(this.id)">
													<h5 id="h1_week1"></h5>
													<h5 id="h1_day1"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div2" onclick="clickDay(this.id)">
													<h5 id="h1_week2"></h5>
													<h5 id="h1_day2"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div3" onclick="clickDay(this.id)">
													<h5 id="h1_week3"></h5>
													<h5 id="h1_day3"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div4" onclick="clickDay(this.id)">
													<h5 id="h1_week4"></h5>
													<h5 id="h1_day4"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div5" onclick="clickDay(this.id)">
													<h5 id="h1_week5"></h5>
													<h5 id="h1_day5"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div6" onclick="clickDay(this.id)">
													<h5 id="h1_week6"></h5>
													<h5 id="h1_day6"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div7" onclick="clickDay(this.id)">
													<h5 id="h1_week7"></h5>
													<h5 id="h1_day7"></h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="container">
									<div class="row">
										<div class="col-xs-12 col-md-12">
											<div class="col-md-1">
												<div id="div8" onclick="clickDay(this.id)">
													<h5 id="h2_week1"></h5>
													<h5 id="h2_day1"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div9" onclick="clickDay(this.id)">
													<h5 id="h2_week2"></h5>
													<h5 id="h2_day2"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div10" onclick="clickDay(this.id)">
													<h5 id="h2_week3"></h5>
													<h5 id="h2_day3"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div11" onclick="clickDay(this.id)">
													<h5 id="h2_week4"></h5>
													<h5 id="h2_day4"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div12" onclick="clickDay(this.id)">
													<h5 id="h2_week5"></h5>
													<h5 id="h2_day5"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div13" onclick="clickDay(this.id)">
													<h5 id="h2_week6"></h5>
													<h5 id="h2_day6"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div14" onclick="clickDay(this.id)">
													<h5 id="h2_week7"></h5>
													<h5 id="h2_day7"></h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="container">
									<div class="row">
										<div class="col-xs-12 col-md-12">
											<div class="col-md-1">
												<div id="div15" onclick="clickDay(this.id)">
													<h5 id="h3_week1"></h5>
													<h5 id="h3_day1"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div16" onclick="clickDay(this.id)">
													<h5 id="h3_week2"></h5>
													<h5 id="h3_day2"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div17" onclick="clickDay(this.id)">
													<h5 id="h3_week3"></h5>
													<h5 id="h3_day3"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div18" onclick="clickDay(this.id)">
													<h5 id="h3_week4"></h5>
													<h5 id="h3_day4"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div19" onclick="clickDay(this.id)">
													<h5 id="h3_week5"></h5>
													<h5 id="h3_day5"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div20" onclick="clickDay(this.id)">
													<h5 id="h3_week6"></h5>
													<h5 id="h3_day6"></h5>
												</div>
											</div>
											<div class="col-md-1">
												<div id="div21" onclick="clickDay(this.id)">
													<h5 id="h3_week7"></h5>
													<h5 id="h3_day7"></h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="carousel-control left" href="#myCarousel"
					style="padding-top: 4px;" data-slide="prev"> <img alt="左边"
					src="${APP_PATH}/static/image/ic_left.png">
				</a> 
				<a class="carousel-control right" href="#myCarousel"
					style="padding-top: 4px" data-slide="next"> <img alt="右边"
					src="${APP_PATH}/static/image/ic_right.png">
				</a>
			</div>

		</div>

	</div>


</body>
<script type="text/javascript">
	var currentWeek = 0;//当前周(一版算一周,初始化为0周)
	var currentPosition=0;//当前导航点的位置(值为0,1,2,循环切换)
	var today = new Array('周日', '周一', '周二', '周三', '周四', '周五', '周六');

	var currentdate = new Date();
	var currentDay;
	
	$(document).ready(function() {
		currentDay = currentdate.getDate(); //获取当前日(1-31)
		$('#myCarousel').carousel('pause');
		initDate(currentWeek);
		initMouseOver();
	});

	function initDate(currentWeek) {
		setDate(currentWeek);
	};
	
	function setDate(currentWeek,isLeftOrRight) {
		var t = currentdate.toLocaleString();

		var getYear = currentdate.getYear(); //获取当前年份(2位)
		var getFullYear = currentdate.getFullYear(); //获取完整的年份(4位,1970-????)
		var getMonth = currentdate.getMonth(); //获取当前月份(0-11,0代表1月)
		var getDate = currentdate.getDate(); //获取当前日(1-31)
		var getDay = currentdate.getDay(); //获取当前星期X(0-6,0代表星期天)
		var getTime = currentdate.getTime(); //获取当前时间(从1970.1.1开始的毫秒数)
		var getHours = currentdate.getHours(); //获取当前小时数(0-23)
		var getHours = currentdate.getHours(); //获取当前分钟数(0-59)
		var getSeconds = currentdate.getSeconds(); //获取当前秒数(0-59)
		var getMilliseconds = currentdate.getMilliseconds(); //获取当前毫秒数(0-999)
		var toLocaleDateString = currentdate.toLocaleDateString(); //获取当前日期
		var mytime = currentdate.toLocaleTimeString(); //获取当前时间

		
		
		if(isLeftOrRight!=undefined){
			if(isLeftOrRight=="isRight"){
				if(currentPosition==0){
					changeDay("#h1_week1", "#h1_day1", currentWeek*7);
					changeDay("#h1_week2", "#h1_day2", currentWeek*7 + 1);
					changeDay("#h1_week3", "#h1_day3", currentWeek*7 + 2);
					changeDay("#h1_week4", "#h1_day4", currentWeek*7 + 3);
					changeDay("#h1_week5", "#h1_day5", currentWeek*7 + 4);
					changeDay("#h1_week6", "#h1_day6", currentWeek*7 + 5);
					changeDay("#h1_week7", "#h1_day7", currentWeek*7 + 6);
				}else if(currentPosition==1){
					changeDay("#h2_week1", "#h2_day1", currentWeek*7 + 7);
					changeDay("#h2_week2", "#h2_day2", currentWeek*7 + 8);
					changeDay("#h2_week3", "#h2_day3", currentWeek*7 + 9);
					changeDay("#h2_week4", "#h2_day4", currentWeek*7 + 10);
					changeDay("#h2_week5", "#h2_day5", currentWeek*7 + 11);
					changeDay("#h2_week6", "#h2_day6", currentWeek*7 + 12);
					changeDay("#h2_week7", "#h2_day7", currentWeek*7 + 13);
				}else if(currentPosition==2){
					changeDay("#h3_week1", "#h3_day1", currentWeek*7 + 14);
					changeDay("#h3_week2", "#h3_day2", currentWeek*7 + 15);
					changeDay("#h3_week3", "#h3_day3", currentWeek*7 + 16);
					changeDay("#h3_week4", "#h3_day4", currentWeek*7 + 17);
					changeDay("#h3_week5", "#h3_day5", currentWeek*7 + 18);
					changeDay("#h3_week6", "#h3_day6", currentWeek*7 + 19);
					changeDay("#h3_week7", "#h3_day7", currentWeek*7 + 20);
				}
			}
		}else{
			changeDay("#h1_week1", "#h1_day1", currentWeek*7);
			changeDay("#h1_week2", "#h1_day2", currentWeek*7 + 1);
			changeDay("#h1_week3", "#h1_day3", currentWeek*7 + 2);
			changeDay("#h1_week4", "#h1_day4", currentWeek*7 + 3);
			changeDay("#h1_week5", "#h1_day5", currentWeek*7 + 4);
			changeDay("#h1_week6", "#h1_day6", currentWeek*7 + 5);
			changeDay("#h1_week7", "#h1_day7", currentWeek*7 + 6);

			changeDay("#h2_week1", "#h2_day1", currentWeek*7 + 7);
			changeDay("#h2_week2", "#h2_day2", currentWeek*7 + 8);
			changeDay("#h2_week3", "#h2_day3", currentWeek*7 + 9);
			changeDay("#h2_week4", "#h2_day4", currentWeek*7 + 10);
			changeDay("#h2_week5", "#h2_day5", currentWeek*7 + 11);
			changeDay("#h2_week6", "#h2_day6", currentWeek*7 + 12);
			changeDay("#h2_week7", "#h2_day7", currentWeek*7 + 13);

			changeDay("#h3_week1", "#h3_day1", currentWeek*7 + 14);
			changeDay("#h3_week2", "#h3_day2", currentWeek*7 + 15);
			changeDay("#h3_week3", "#h3_day3", currentWeek*7 + 16);
			changeDay("#h3_week4", "#h3_day4", currentWeek*7 + 17);
			changeDay("#h3_week5", "#h3_day5", currentWeek*7 + 18);
			changeDay("#h3_week6", "#h3_day6", currentWeek*7 + 19);
			changeDay("#h3_week7", "#h3_day7", currentWeek*7 + 20);
		}
	}
	

	function changeDay(week, day, addDay) {
		var mytime = currentdate.toLocaleTimeString(); //获取当前时间
		//console.log("addDay:"+addDay);
		var d7 = currentdate.setDate(currentDay + addDay);
		var date = new Date(d7);

		var getMonth = date.getMonth(); //获取当前月份(0-11,0代表1月)
		var getDate = date.getDate(); //获取当前日(1-31)
		var getDay = date.getDay(); //获取当前星期X(0-6,0代表星期天)

		$(week).text(today[getDay]);
		$(day).text((getMonth + 1) + "月" + getDate + "日");
		console.log(currentdate.getDate()+":::"+addDay+":::"+mytime+":::"+currentdate.getDate() + addDay+":::"+(getMonth + 1) + "月" + getDate + "日");
	}
	
	var isHadClick = false;
	function clickDay(id) {
		resetDivClass();
		isHadClick = true;
		/*if (!$("#" + id).hasClass("div-choose-green")) {
			$("#" + id).addClass("div-choose-green");
		}*/
		
		$("#" + id).addClass("div-choose-green");
	}
	
	function resetDivClass() {
		$("#div1").removeClass("div-choose-green");	
		$("#div2").removeClass("div-choose-green");	
		$("#div3").removeClass("div-choose-green");	
		$("#div4").removeClass("div-choose-green");	
		$("#div5").removeClass("div-choose-green");	
		$("#div6").removeClass("div-choose-green");	
		$("#div7").removeClass("div-choose-green");	
		$("#div8").removeClass("div-choose-green");	
		$("#div9").removeClass("div-choose-green");	
		$("#div10").removeClass("div-choose-green");	
		$("#div11").removeClass("div-choose-green");	
		$("#div12").removeClass("div-choose-green");	
		$("#div13").removeClass("div-choose-green");	
		$("#div14").removeClass("div-choose-green");	
		$("#div15").removeClass("div-choose-green");	
		$("#div16").removeClass("div-choose-green");	
		$("#div17").removeClass("div-choose-green");	
		$("#div18").removeClass("div-choose-green");	
		$("#div19").removeClass("div-choose-green");	
		$("#div20").removeClass("div-choose-green");	
		$("#div21").removeClass("div-choose-green");	
	}

	$('#myCarousel')
			.on(
					'slide.bs.carousel',
					function(event) {
						var direction=event.direction;
						if(direction!=undefined){
							if(direction=="left"){//说明向右点击,滑动
								currentWeek+=1;
								//currentPosition
								//0 1  2
								//3 10 17
								//currentPosition==0  点击后会变成 1 2 0 此时需要更新0 的数据 即之前第一版的数据  
								//currentPosition==1  点击后会变成 2 0 1 此时需要更新1 的数据 即之前第二版的数据  
								//currentPosition==2  点击后会变成 0 1 2 此时需要更新2 的数据 即之前第三版的数据  
								setDate(currentWeek,"isRight");
							}else if(direction=="right"){//说明向左点击,滑动
								currentWeek-=1;
								setDate(currentWeek,"isLeft");
							}
						}
						var $hoder = $('#myCarousel').find('.item'), $items = $(event.relatedTarget);
						//getIndex就是轮播到当前位置的索引
						currentPosition = $hoder.index($items);
						//alert(getIndex);
						//console.log("currentPosition:"+currentPosition);
					})

	function initMouseOver() {
		setDivMouseOver("#div1");
		setDivMouseOver("#div2");
		setDivMouseOver("#div3");
		setDivMouseOver("#div4");
		setDivMouseOver("#div5");
		setDivMouseOver("#div6");
		setDivMouseOver("#div7");
		setDivMouseOver("#div8");
		setDivMouseOver("#div9");
		setDivMouseOver("#div10");
		setDivMouseOver("#div11");
		setDivMouseOver("#div12");
		setDivMouseOver("#div13");
		setDivMouseOver("#div14");
		setDivMouseOver("#div15");
		setDivMouseOver("#div16");
		setDivMouseOver("#div17");
		setDivMouseOver("#div18");
		setDivMouseOver("#div19");
		setDivMouseOver("#div20");
		setDivMouseOver("#div21");
	}

	var isNotNeedRemove = false;//是否不需要remove样式
	function setDivMouseOver(ele) {
		$(ele).mouseover(function() {
			if ($(ele).hasClass("div-choose-green")) {
				isNotNeedRemove = true;
			} else {
				$(ele).addClass("div-choose-green");
				isNotNeedRemove = false;
			}
		});
		$(ele).mouseout(function() {
			if (!isHadClick) {
				if (!isNotNeedRemove) {
					$(ele).removeClass("div-choose-green");
					isNotNeedRemove = false;
				} else {
					isNotNeedRemove = true;
				}
			}
			isHadClick = false;
		});
	}
</script>
</html>