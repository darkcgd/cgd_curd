<%--
  Created by IntelliJ IDEA.
  User: szmg
  Date: 17/9/7
  Time: 下午5:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台-订单</title>
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
    <script src="${APP_PATH }/static/js/ajaxUtil.js"></script>
    <script src="${APP_PATH }/js/util.js"></script>
    <script src="${APP_PATH }/js/jquerysession.js"></script>
    <script src="${APP_PATH }/static/js/custom-dialog.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet" type="text/css">

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
                <div id="div_main" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: #EFEFEF">
                    <span class="glyphicon glyphicon-scale" style="color: #454545"></span> <span style="color: #454545"> 控制台 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

                <div  id="div_product" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: #EFEFEF">
                    <span class="glyphicon glyphicon-shopping-cart" style="color: #454545"></span> <span style="color: #454545"> 商品模块 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

                <div id="div_order" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: white">
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
            <div class="col-xs-10 col-md-11" style="margin-top: 10px;">
                <div class="col-xs-12 col-md-6">
                    <ul class="nav nav-tabs nav-justified">
                        <li id="li_status1" role="presentation" onclick="clickLi(id)" class="active"><a href="#">近3个月订单</a></li>
                        <li id="li_status2" role="presentation" onclick="clickLi(id)"><a href="#">待发货<span class="badge li-a-span">40</span></a></li>
                        <li id="li_status3" role="presentation"  onclick="clickLi(id)"><a href="#">待付款<span class="badge li-a-span">30</span></a></li>
                        <li id="li_status4" role="presentation" onclick="clickLi(id)"><a href="#">已发货</a></li>
                        <li id="li_status5" role="presentation" onclick="clickLi(id)"><a href="#">退款退货</a></li>
                        <li id="li_status6" role="presentation" onclick="clickLi(id)"><a href="#">已完成</a></li>
                        <li id="li_status7" role="presentation" onclick="clickLi(id)"><a href="#">历史订单</a></li>
                    </ul>
                </div>
                <!-- 显示表格数据 -->
                <div class="row">
                    <div class="col-md-10" style="margin-top: 20px">
                        <table class="table table-hover" id="product_table">
                            <thead >
                            <tr>
                                <th style='vertical-align: middle;text-align: center;'>商品</th>
                                <th style='vertical-align: middle;text-align: center;'>单价(元)</th>
                                <th style='vertical-align: middle;text-align: center;'>数量</th>
                                <th style='vertical-align: middle;text-align: center;'>买家</th>
                                <th style='vertical-align: middle;text-align: center;'>状态</th>
                                <th style='vertical-align: middle;text-align: center;'>金额</th>
                            </tr>
                            </thead>

                            <th style='vertical-align: middle;'>
                                <input type="checkbox" id="check_all" style="margin-left: 30px"/><span style="margin-left: 4px">全选</span>
                            </th>

                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>



    </div>
</div>

<script type="text/javascript">
    $(function(){
        var isLogin=$.session.get('isLogin');
        if(isLogin){
            $("#span_user_name").text($.session.get('userName')==undefined?"admin":$.session.get('userName'));
            clickMenu("#div_main");
            clickMenu("#div_product");
            clickMenu("#div_order");
            clickMenu("#div_user");
            clickMenu("#div_message");
            clickMenu("#div_setting");

            getOrderList(1);
        }else{
            window.location.href = "login.jsp";
        }
    });

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

    function clickLi(id){
        $("#li_status1").removeClass("active");
        $("#li_status2").removeClass("active");
        $("#li_status3").removeClass("active");
        $("#li_status4").removeClass("active");
        $("#li_status5").removeClass("active");
        $("#li_status6").removeClass("active");
        $("#li_status7").removeClass("active");
        $("#li_status2 a span").hide();
        $("#li_status3 a span").hide();


        if(id=="li_status2"){
            $("#li_status2 a span").show();
        }else if(id=="li_status3"){
            $("#li_status3 a span").show();
        }

        $("#"+id).addClass("active");
        var value = $("#"+id).children().val();
        //getOrderList(value,1);

    }

    function getOrderList(type) {
        showOrderList(""+GET_ORDER_LIST);


        /*$.ajax({
            url:"${APP_PATH}"+GET_ORDER_LIST,
            //默认显示10条数据
            data:"pagerNumber="+pagerNumber+"&pagerSize=10",
            type:"GET",
            success:function(result){
                showOrderList(result);
                //2、解析并显示分页信息
                //build_page_info(result);
                //3、解析显示分页条数据
                //build_page_nav(result);
            }
        });*/
    }

    //ajax提交
    function showOrderList(result) {
        showDialog(result)
    }



</script>

</body>
</html>
