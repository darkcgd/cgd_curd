<%--
  Created by IntelliJ IDEA.
  User: szmg
  Date: 17/9/7
  Time: 上午10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理后台-控制台</title>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
    <link href="${APP_PATH }/css/clock.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${APP_PATH }/static/js/util.js"></script>
    <script src="${APP_PATH }/js/clock.js"></script>
    <script src="${APP_PATH }/js/jquerysession.js"></script>
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH }/css/base.css" rel="stylesheet">


</head>
<body>




<div>
    <div class="container-fluid" >
        <!-- Stack the columns on mobile by making one full-width and the other half-width -->
        <div class="row" style="background: #1A7CAF;padding-top: 10px;padding-bottom: 10px;padding-left: 30px">
            <div class="col-xs-3 col-md-6"><span style="color:#ffffff;font-size: 20px">后台管理系统</span></div>
            <div class="pull-right">
                <button type="button" class="btn btn-default btn-sm" style="background: #810E54;margin-right: 10px">
                    <span class="glyphicon glyphicon-gift" style="color: #FFFFFF"></span> <span style="color: #FFFFFF">通知</span>  <span class="badge" style="background: #FFFFFF;color: #FF0000">42</span>
                </button>
                <button type="button" class="btn btn-default btn-sm" style="background: #007C4F;margin-right: 10px">
                    <span class="glyphicon glyphicon-comment" style="color: #FFFFFF"></span> <span style="color: #FFFFFF">消息</span> <span class="badge" style="background: #FFFFFF;color: #FF0000">20</span>
                </button>
                <button type="button" class="btn btn-default btn-sm" style="background: #3B99CB;margin-right: 20px">
                    <span class="glyphicon glyphicon-user" style="color: #FFFFFF"></span> <span id="span_user_name" style="color: #FFFFFF;margin-right: 10px"></span><span class="caret"></span>
                </button>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-2 col-md-1" style="padding-left:0px;padding-right:0px;">
                <div id="div_main" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: white">
                    <span class="glyphicon glyphicon-scale" style="color: #454545"></span> <span style="color: #454545"> 控制台 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

                <div  id="div_product" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: #EFEFEF">
                    <span class="glyphicon glyphicon-shopping-cart" style="color: #454545"></span> <span style="color: #454545"> 商品模块 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

                <div id="div_order" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: #EFEFEF">
                    <span class="glyphicon glyphicon-credit-card" style="color: #454545"></span> <span style="color: #454545"> 订单模块 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

                <div id="div_user" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: #EFEFEF">
                    <span class="glyphicon glyphicon-user" style="color: #454545"></span> <span style="color: #454545"> 用户模块 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

                <div id="div_message" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: #EFEFEF">
                    <span class="glyphicon glyphicon-envelope" style="color: #454545"></span> <span style="color: #454545"> 消息模块 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

                <div id="div_setting" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: #EFEFEF">
                    <span class="glyphicon glyphicon-asterisk" style="color: #454545"></span> <span style="color: #454545"> 设置 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

            </div>
            <div class="col-xs-10 col-md-11">
                <div class="container-fluid" >
                    <div class="row" style="margin-top: 20px">
                        <div class="col-xs-6 col-md-3" style="height: 160px;background: #f0f0f0;margin-left: 10px">
                            <div class="row" style="margin-left: 40px;margin-top: 20px">
                                <a href="#" class="media-left">
                                    <img src="${APP_PATH }/static/image/home_bt01.png" class="center-block" width="120px" height="120px">
                                </a>
                                <div class="media-body" style='vertical-align: middle;'>
                                    <h1 class="media-heading">￥23636</h1>
                                    <h5 style="margin-left: 10px">今日订单金额</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-3" style="height: 160px;background: #f0f0f0;margin-left: 10px">
                            <div class="row" style="margin-left: 40px;margin-top: 20px">
                                <a href="#" class="media-left">
                                    <img src="${APP_PATH }/static/image/home_bt02.png" width="120px" height="120px">
                                </a>
                                <div class="media-body" style='vertical-align: middle;'>
                                    <h1 class="media-heading">10</h1>
                                    <h5 style="margin-left: 2px">今日订单成交数</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-3" style="height: 160px;background: #f0f0f0;margin-left: 10px;">
                            <div class="row" style="margin-left: 40px;margin-top: 20px">
                                <a href="#" class="media-left">
                                    <img src="${APP_PATH }/static/image/home_bt03.png" width="120px" height="120px">
                                </a>
                                <div class="media-body" style='vertical-align: middle;'>
                                    <h1 class="media-heading">261</h1>
                                    <h5 style="margin-left: 2px">今日新增会员</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-top: 20px">
                        <div class="col-xs-6 col-md-6" style="height: 300px;background: #f0f0f0;margin-left: 10px;">
                            <div class="row" style="background: #f8f8f8;padding-left: 10px;padding-top: 10px;padding-bottom: 10px">
                                <a href="#" class="media-left">
                                    <img src="${APP_PATH }/static/image/home_bt04.png" class="center-block" width="30px" height="30px">
                                </a>
                                <div class="media-body" style="vertical-align: middle">
                                    <h4 class="media-heading" style="margin-top: 7px">待处理事务</h4>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 col-md-6" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;padding-left: 10px;">
                                        <p class="pull-left" style="margin-top: 6px">待发货订单</p>
                                        <a href="#" class="pull-right" style="padding-right:16px;font-size: 26px;color: red">14条</a>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8"></div>
                                </div>
                                <div class="col-xs-3 col-md-6">
                                    <div class="row" style="margin-top: 30px;padding-left: 10px;">
                                        <p class="pull-left" style="margin-top: 6px">会员提现</p>
                                        <a href="#" class="pull-right" style="padding-right:16px;font-size: 26px;color: red">2条</a>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8"></div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 col-md-6" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;padding-left: 10px;">
                                        <p class="pull-left" style="margin-top: 6px">站内私信</p>
                                        <a href="#" class="pull-right" style="padding-right:16px;font-size: 26px;color: red">2条</a>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8"></div>
                                </div>
                                <div class="col-xs-3 col-md-6">
                                    <div class="row" style="margin-top: 30px;padding-left: 10px;">
                                        <p class="pull-left" style="margin-top: 6px">商品咨询</p>
                                        <a href="#" class="pull-right" style="padding-right:16px;font-size: 26px;color: red">2条</a>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8"></div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 col-md-6" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;padding-left: 10px;">
                                        <p class="pull-left" style="margin-top: 6px">已达到警戒库存商品</p>
                                        <a href="#" class="pull-right" style="padding-right:16px;font-size: 26px;color: red">20件</a>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8"></div>
                                </div>
                                <div class="col-xs-3 col-md-6">
                                    <div class="row" style="margin-top: 30px;padding-left: 10px;">
                                        <p class="pull-left" style="margin-top: 6px">意见反馈</p>
                                        <a href="#" class="pull-right" style="padding-right:16px;font-size: 26px;color: red">5条</a>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8"></div>
                                </div>
                            </div>


                        </div>
                        <div class="col-xs-6 col-md-3" style="height: 300px;background: #f0f0f0;margin-left: 20px;">
                            <div class="row" style="background: #f8f8f8;padding-left: 10px;padding-top: 10px;padding-bottom: 10px">
                                <a href="#" class="media-left">
                                    <img src="${APP_PATH }/static/image/home_bt01.png" class="center-block" width="30px" height="30px">
                                </a>
                                <div class="media-body" style="vertical-align: middle">
                                    <h4 class="media-heading" style="margin-top: 7px">商城信息统计</h4>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 col-md-6" style="height:120px;">
                                    <div class="row" style="margin-top: 26px;text-align: center">
                                        <a href="#" style="font-size: 26px;color: #00C5CD">4280位</a>
                                        <p style="margin-top: 4px">会员总数</p>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8;margin-top: 10px;"></div>
                                </div>
                                <div class="col-xs-3 col-md-6" style="height:120px;">
                                    <div class="row" style="margin-top: 26px;text-align: center">
                                        <a href="#" style="font-size: 26px;color: #00C5CD">27492条</a>
                                        <p style="margin-top: 4px">商品总数</p>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8;margin-top: 10px;"></div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 col-md-6" style="height:120px;">
                                    <div class="row" style="margin-top: 26px;text-align: center">
                                        <a href="#" style="font-size: 26px;color: #00C5CD">￥355245.78</a>
                                        <p style="margin-top: 4px">预付款总额</p>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8;margin-top: 10px;"></div>
                                </div>
                                <div class="col-xs-3 col-md-6" style="height:120px;">
                                    <div class="row" style="margin-top: 26px;text-align: center">
                                        <a href="#" style="font-size: 26px;color: #00C5CD">￥2365125.63</a>
                                        <p style="margin-top: 4px">近30天订单金额</p>
                                    </div>
                                    <div style="width:100%;height:1px;background: #d8d8d8;margin-top: 10px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-xs-6 col-md-6" style="height: 170px;background: #f0f0f0;margin-left: 10px;">
                            <div class="row" style="background: #f8f8f8;padding-left: 10px;padding-top: 10px;padding-bottom: 10px">
                                <a href="#" class="media-left">
                                    <img src="${APP_PATH }/static/image/home_bt04.png" class="center-block" width="30px" height="30px">
                                </a>
                                <div class="media-body" style="vertical-align: middle">
                                    <h4 class="media-heading" style="margin-top: 7px">运营快捷入口</h4>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 col-md-2" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;text-align: center">
                                        <a href="#">
                                            <img src="${APP_PATH }/static/image/home_bt04.png" class="center-block" width="30px" height="30px">
                                            <p style="margin-top: 10px">会员总数</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-md-2" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;text-align: center">
                                        <a href="#">
                                            <img src="${APP_PATH }/static/image/home_bt04.png" class="center-block" width="30px" height="30px">
                                            <p style="margin-top: 10px">订单列表</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-md-2" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;text-align: center">
                                        <a href="#">
                                            <img src="${APP_PATH }/static/image/home_bt04.png" class="center-block" width="30px" height="30px">
                                            <p style="margin-top: 10px">会员管理</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-md-2" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;text-align: center">
                                        <a href="#">
                                            <img src="${APP_PATH }/static/image/home_bt04.png" class="center-block" width="30px" height="30px">
                                            <p style="margin-top: 10px">会员预存款</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-md-2" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;text-align: center">
                                        <a href="#">
                                            <img src="${APP_PATH }/static/image/home_bt04.png" class="center-block" width="30px" height="30px">
                                            <p style="margin-top: 10px">网站流量</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-md-2" style="height:80px;">
                                    <div class="row" style="margin-top: 30px;text-align: center">
                                        <a href="#">
                                            <img src="${APP_PATH }/static/image/home_bt04.png" class="center-block" width="30px" height="30px">
                                            <p style="margin-top: 10px">短信营销</p>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div style="margin-top: 70px;height: 130px;text-align: center">
                                <div class="dowebok">
                                    <div class="hours"></div>
                                    <div class="minutes"></div>
                                    <div class="seconds"></div>
                                </div>
                            </div>

                        </div>




                        <div class="col-xs-6 col-md-3" style="height: 300px;background: #f0f0f0;margin-left: 20px;">
                            <div class="row" style="background: #f8f8f8;padding-left: 10px;padding-top: 10px;padding-bottom: 10px">
                                <a href="#" class="media-left">
                                    <img src="${APP_PATH }/static/image/home_bt01.png" class="center-block" width="30px" height="30px">
                                </a>
                                <div class="media-body" style="vertical-align: middle">
                                    <h4 class="media-heading" style="margin-top: 7px">公告动态</h4>
                                </div>
                            </div>

                            <div style="margin-left: 0px;margin-top: 16px">
                                <a href="#">
                                    <div class="row" style="margin-top: 3px;padding-left: 10px;">
                                        <p class="pull-left" style="width: 70%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                                            公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题</p>
                                        <p class="pull-right" style="padding-right:16px;font-size: 16px;color: #a4a4a4">2017-09-20</p>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="row" style="margin-top: 3px;padding-left: 10px;">
                                        <p class="pull-left" style="width: 70%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                                            公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题</p>
                                        <p class="pull-right" style="padding-right:16px;font-size: 16px;color: #a4a4a4">2017-09-20</p>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="row" style="margin-top: 3px;padding-left: 10px;">
                                        <p class="pull-left" style="width: 70%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                                            公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题</p>
                                        <p class="pull-right" style="padding-right:16px;font-size: 16px;color: #a4a4a4">2017-09-20</p>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="row" style="margin-top: 3px;padding-left: 10px;">
                                        <p class="pull-left" style="width: 70%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                                            公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题</p>
                                        <p class="pull-right" style="padding-right:16px;font-size: 16px;color: #a4a4a4">2017-09-20</p>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="row" style="margin-top: 3px;padding-left: 10px;">
                                        <p class="pull-left" style="width: 70%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                                            公告标题公告标题公告标题公告标题公告标题公告标题公告标题公告标题</p>
                                        <p class="pull-right" style="padding-right:16px;font-size: 16px;color: #a4a4a4">2017-09-20</p>
                                    </div>
                                </a>
                            </div>


                        </div>



                    </div>

                </div>
            </div>
        </div>



    </div>
</div>

<script type="text/javascript">
    //ajax提交
    $(document).ready(function() {
        var isLogin=$.session.get('isLogin');
        if(isLogin){
            $("#span_user_name").text($.session.get('shopName')==undefined?"admin":$.session.get('shopName'));
            $('.dowebok').flipTimer({
                seconds: true
            });
        }else{
            window.location.href = "login.jsp";
        }
    });

    clickMenu("#div_main");
    clickMenu("#div_product");
    clickMenu("#div_order");
    clickMenu("#div_user");
    clickMenu("#div_message");
    clickMenu("#div_setting");


    function clickMenu(ele){
        $(ele).click(function() {
            if(ele=="#div_main"){
                window.location.href = "admin.jsp";
            }else if(ele=="#div_product"){
                window.location.href = "adminProduct.jsp";
            }else if(ele=="#div_order"){
                window.location.href = "adminOrder.jsp";
            }else if(ele=="#div_user"){
                window.location.href = "adminUser.jsp";
            }else if(ele=="#div_message"){
                window.location.href = "adminMessage.jsp";
            }else if(ele=="#div_setting"){
                window.location.href = "adminSetting.jsp";
            }
            window.event.returnValue = false;
        })
    }



</script>

</body>
</html>