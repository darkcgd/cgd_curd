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
    <link href="${APP_PATH}/css/base.css" rel="stylesheet" type="text/css">

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
                <div class="col-xs-12 col-md-8">
                    <ul class="nav nav-tabs nav-justified">
                        <%--1待付款2待发货3发货中4待评价5已完成6已取消7已删除--%>
                        <li id="li_status1" role="presentation" onclick="clickLi(id)" class="active"><a href="#">近3个月订单</a></li>
                        <li id="li_status2" role="presentation" onclick="clickLi(id)"><a href="#">待发货</a></li>
                        <li id="li_status3" role="presentation"  onclick="clickLi(id)"><a href="#">待付款</a></li>
                        <li id="li_status4" role="presentation" onclick="clickLi(id)"><a href="#">已发货</a></li>
                        <li id="li_status5" role="presentation" onclick="clickLi(id)"><a href="#">退款退货</a></li>
                        <li id="li_status6" role="presentation" onclick="clickLi(id)"><a href="#">已完成</a></li>
                        <li id="li_status7" role="presentation" onclick="clickLi(id)"><a href="#">历史订单</a></li>
                    </ul>
                </div>
                <!-- 显示表格数据 -->
                <div class="row">
                    <div class="col-md-10" style="margin-top: 20px">
                        <table class="table table-hover" id="order_table">
                            <thead >
                            <tr>
                                <th style='vertical-align: middle;text-align: center;'>商品</th>
                                <th style='vertical-align: middle;text-align: center;'>单价(元)</th>
                                <th style='vertical-align: middle;text-align: center;'>数量</th>
                                <th style='vertical-align: middle;text-align: center;'>金额(元)</th>
                                <th style='vertical-align: middle;text-align: center;'>买家</th>
                                <th style='vertical-align: middle;text-align: center;'>状态</th>
                                <th style='vertical-align: middle;text-align: center;'>操作</th>
                            </tr>
                            <%--<div style='vertical-align: middle;'>
                                <input type="checkbox" id="check_all" style="margin-left: 30px"/><span style="margin-left: 4px">全选</span>
                            </div>--%>
                            </thead>



                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- 显示分页信息 -->
                <div class="row">
                    <!--分页文字信息  -->
                    <div class="col-md-6 col-md-offset-1" id="page_info_area"></div>
                    <!-- 分页条信息 -->
                    <div class="col-md-6 col-md-offset-7" id="page_nav_area">

                    </div>
                </div>
            </div>
        </div>



    </div>
</div>

<script type="text/javascript">
    var pagerNumber=1;
    var orderStatus=0;

    $(function(){
        var isLogin=$.session.get('isLogin');
        if(isLogin){
            $("#span_user_name").text($.session.get('shopName')==undefined?"admin":$.session.get('shopName'));
            clickMenu("#div_main");
            clickMenu("#div_product");
            clickMenu("#div_order");
            clickMenu("#div_user");
            clickMenu("#div_message");
            clickMenu("#div_setting");

            getOrderList(1);
            getOrderStatusCount();
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

        if(id=="li_status1"){
            orderStatus=0;
        }else if(id=="li_status2"){
            $("#li_status2 a span").show();
            orderStatus=2;
        }else if(id=="li_status3"){
            $("#li_status3 a span").show();
            orderStatus=1;
        }else if(id=="li_status4"){
            $("#li_status3 a span").show();
            orderStatus=3;
        }else if(id=="li_status5"){
            $("#li_status3 a span").show();
            orderStatus=6;
        }else if(id=="li_status6"){
            $("#li_status3 a span").show();
            orderStatus=5;
        }else if(id=="li_status7"){
            $("#li_status3 a span").show();
            orderStatus=0;
        }

        $("#"+id).addClass("active");
        getOrderList(pagerNumber,orderStatus);

    }

    function getOrderList(pagerNumber,orderStatus) {
        if(orderStatus==undefined){
            orderStatus=0
        }
        $.ajax({
            url:"${APP_PATH}"+GET_ORDER_LIST,
            //默认显示10条数据
            data:"pagerNumber="+pagerNumber+"&pagerSize=10&shopId="+$.session.get('shopId')+"&token="+$.session.get('token')+"&orderStatus="+orderStatus,
            type:"GET",
            success:function(result){
                showOrderList(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }
    function getOrderStatusCount() {
        $.ajax({
            url:"${APP_PATH}"+GET_ORDER_STATUS_COUNT,
            //默认显示10条数据
            data:"shopId="+$.session.get('shopId')+"&token="+$.session.get('token'),
            type:"GET",
            success:function(result){
                if(result.code==100){
                    var data=result.data;
                    $("#li_status1 a").text(data.total==undefined?"近3个月订单":"近3个月订单("+data.total+")");
                    $("#li_status2 a").text(data.unsendCount==undefined?"待发货":"待发货("+data.unsendCount+")");
                    $("#li_status3 a").text(data.unpayCount==undefined?"待付款":"待付款("+data.unsendCount+")");
                    $("#li_status4 a").text(data.senddingCount==undefined?"已发货":"已发货("+data.senddingCount+")");
                    $("#li_status5 a").text(data.cancelCount==undefined?"退款退货":"退款退货("+data.cancelCount+")");
                    $("#li_status6 a").text(data.successCount==undefined?"已完成":"已完成("+data.successCount+")");
                    $("#li_status7 a").text(data.total==undefined?"历史订单":"历史订单("+data.total+")");
                }

            }
        });
    }

    //1待付款2待发货3发货中4待评价5已完成6已取消7已删除
    var statusAry=["未知状态订单","待付款","待发货","发货中","待评价","已完成","已取消","已删除"];
    //ajax提交
    function showOrderList(result) {
        //清空table表格
        $("#order_table tbody").empty();
        var orderList = result.data.list;
        $.each(orderList,function(index,item){
            var checkBoxTd = $("<td style='vertical-align: middle;text-align: center;'><input type='checkbox' class='check_item'/></td>");
            var productNameTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append(item.orderSn);
            var productPriceTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append("￥"+item.productPrice);
            var productCountTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append(item.productCount);
            var totalPriceTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append("￥"+item.productPrice);
            var reciverNameTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append(item.reciverName);
            var orderStatusTd = $("<td style='vertical-align: middle;text-align: center;'></td>")
                .append($("<span></span>")
                    .append(item.orderStatus==undefined?statusAry[0]:statusAry[item.orderStatus]));

            (item.orderStatus==1||item.orderStatus==2)?orderStatusTd.css("color","red"):orderStatusTd.css("color","")
                //.addClass((item.orderStatus==1||item.orderStatus==2)?"text-red-color":"");


            /**
             <button class="">
             <span class="" aria-hidden="true"></span>
             编辑
             </button>
             */
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前商品id
            editBtn.attr("orderId",item.orderId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的商品id
            delBtn.attr("orderId",item.orderId);
            var btnTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>")/*.append(checkBoxTd)*/
                .append(productNameTd)
                .append(productPriceTd)
                .append(productCountTd)
                .append(totalPriceTd)
                .append(reciverNameTd)
                .append(orderStatusTd)
                .append(btnTd)
                .appendTo("#order_table tbody");//添加到哪里
        });
    }

    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.data.pagerNumber+"页,总"+
            result.data.totalPage+"页,总"+
            result.data.totalCount+"条记录");
        totalRecord = result.data.totalPage;
        pagerNumber = result.data.pagerNumber;
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.data.isFirstPage == true){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                getOrderList(1,orderStatus)
            });
            prePageLi.click(function(){
                getOrderList(result.data.pagerNumber -1,orderStatus)
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.data.isLastPage == true){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                getOrderList(result.data.pagerNumber +1,orderStatus);
            });
            lastPageLi.click(function(){
                getOrderList(result.data.totalPage,orderStatus);
            });
        }



        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.data.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.data.pagerNumber == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                getOrderList(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }



</script>

</body>
</html>
