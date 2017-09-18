<%@ page import="com.cgd.crud.util.Constant" %><%--
  Created by IntelliJ IDEA.
  User: szmg
  Date: 17/9/7
  Time: 下午5:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台-商品</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <% pageContext.setAttribute("BASE_URL", Constant.BASE_URL); %>

    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery.lazyload.js"></script>
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${APP_PATH }/static/js/util.js"></script>
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/base.css" rel="stylesheet">

</head>
<body>

<div class="modal fade" id="div_edit_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"> 修改商品</h4>
            </div>
            <div class="modal-body">
                <div id="div_update_product" class="container-fluid" style="margin-top:20px;">
                    <div class="row" >
                        <div class="col-md-12">
                            <form class="form-horizontal" id="form_update_product">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品名称</label>
                                    <div class="col-md-8">
                                        <input type="text" name="productName" class="form-control"
                                               id="input_update_name" placeholder="商品名称,例如小米6（2499/2899）"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品标题</label>
                                    <div class="col-md-8">
                                        <input type="text" name="title" class="form-control"
                                               id="input_update_title" placeholder="可不填"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">成本价(进货价)</label>
                                    <div class="col-md-3">
                                        <input type="text" name="buyPrice" class="form-control"
                                               id="input_update_buy_price" placeholder="如36"> <span
                                            class="help-block"></span>
                                    </div>

                                    <label class="col-md-2 control-label">原价</label>
                                    <div class="col-md-3">
                                        <input type="text" name="originalPrice" class="form-control"
                                               id="input_update_original_price" placeholder="如100"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">折扣</label>
                                    <div class="col-md-3">
                                        <input type="text" name="discount" class="form-control"
                                               id="input_update_discount" placeholder="6.5折即填65"> <span
                                            class="help-block"></span>
                                    </div>

                                    <label class="col-md-2 control-label">售价</label>
                                    <div class="col-md-3">
                                        <input type="text" name="nowPrice" class="form-control"
                                               id="input_update_now_price" placeholder="如65"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品分类</label>
                                    <div class="col-md-3">
                                        <!-- 提交品牌id即可 -->
                                        <select id="select_update_category" class="form-control" name="categoryId"></select>
                                    </div>
                                    <label class="col-md-2 control-label">商品标签</label>
                                    <div class="col-md-3">
                                        <!-- 提交平台id即可 -->
                                        <select id="select_update_tag" class="form-control" name="productTagId"></select>
                                    </div>
                                </div>




                                <div class="form-group">
                                    <label class="col-md-2 control-label">上架</label>
                                    <div class="checkbox">
                                        <label >是否上架</label>
                                        <input id="select_update_xiajia" type="checkbox" style="margin-left: 10px" value="remember-me">

                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-2 control-label">简介</label>
                                    <div class="col-md-8">
                                        <textarea id="input_update_summary" class="col-sm-12" rows="5" name="summary" placeholder="商品简介"></textarea>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div>
                                            <!-- 点击图片添加文件方式 -->
                                            <button id="btn_edit_update_logo" type="button" class="btn btn-primary" onclick="getElementById('input_file').click()">点此添加logo</button>
                                            <input type="file" name="image" style="opacity:0;filter:alpha(opacity=0);" id="input_file"/>
                                        </div>
                                        <img id="img_edit_logo" src="http://f7-preview.awardspace.com/zjmainstay.co.cc/jQueryExample/jquery_upload_image/files/addfile.jpg"
                                             width="160px" height="80px">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div>
                                            <!-- 点击图片添加文件方式 -->
                                            <button id="btn_edit_update_image" type="button" class="btn btn-primary" onclick="getElementById('input_multipart_file').click()">点此添加商品封面(可上传4张)</button>
                                            <input type="file" multiple="multiple" name="image" style="opacity:0;filter:alpha(opacity=0);" id="input_multipart_file"/>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-2">
                                                <img id="img_update_upload0" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px"/>
                                            </div>
                                            <div class="col-md-2" style="margin-left: 30px">
                                                <img id="img_update_upload1" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px"/>
                                            </div>
                                            <div class="col-md-2" style="margin-left: 30px">
                                                <img id="img_update_upload2" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px"/>
                                            </div>
                                            <div class="col-md-2" style="margin-left: 30px">
                                                <img id="img_update_upload3" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </form>

                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_modal_edit">确定更新</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="div_delete_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">温馨提示</h4>
            </div>
            <div class="modal-body">
                <h4>是否删除</h4>
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_modal_del">确定删除</button>
            </div>
        </div>
    </div>
</div>

<div>
    <div class="container-fluid" >
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
                    <span class="glyphicon glyphicon-user" style="color: #FFFFFF"></span> <span style="color: #FFFFFF;margin-right: 10px">Dark</span><span class="caret"></span>
                </button>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-2 col-md-1" style="padding-left:0px;padding-right:0px;">
                <div id="div_main" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: #EFEFEF">
                    <span class="glyphicon glyphicon-scale" style="color: #454545"></span> <span style="color: #454545"> 控制台 </span>
                </div>

                <div style="width: 100%;height: 1px;background: #d7d7d7"></div>

                <div  id="div_product" style="padding-left:20px;padding-top: 16px;padding-bottom: 16px;background: white">
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
            <div class="col-xs-10 col-md-11" style="margin-top: 10px;">
                <div>
                    <button id="bt_add_product" type="button" class="btn btn-primary" onclick="clickProductMenu(id)">添加商品</button>
                    <button id="bt_product_oprate" type="button" class="btn btn-default" onclick="clickProductMenu(id)">商品操作</button>
                </div>

                <%--商品名称
                商品标题(可不填)
                成本价
                原价
                折扣
                售价(由折扣所得)
                商品编码(可不填)
                商品分类
                商品标签
                logo
                图片(最多4张)
                富文本
                是否上架
                 简介(可不填)
                --%>
                <div id="div_add_product" class="container-fluid" style="margin-top:20px;">
                    <div class="row" >
                        <div class="col-md-6">
                            <form class="form-horizontal" id="form_add_product">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品名称</label>
                                    <div class="col-md-8">
                                        <input type="text" name="productName" class="form-control"
                                               id="input_name" placeholder="商品名称,例如小米6（2499/2899）"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品标题</label>
                                    <div class="col-md-8">
                                        <input type="text" name="title" class="form-control"
                                               id="input_title" placeholder="可不填"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">成本价(进货价)</label>
                                    <div class="col-md-3">
                                        <input type="text" name="buyPrice" class="form-control"
                                               id="input_buy_price" placeholder="如36"> <span
                                            class="help-block"></span>
                                    </div>

                                    <label class="col-md-2 control-label">原价</label>
                                    <div class="col-md-3">
                                        <input type="text" name="originalPrice" class="form-control"
                                               id="input_original_price" placeholder="如100"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">折扣</label>
                                    <div class="col-md-3">
                                        <input type="text" name="discount" class="form-control"
                                               id="input_discount" placeholder="6.5折即填65"> <span
                                            class="help-block"></span>
                                    </div>

                                    <label class="col-md-2 control-label">售价</label>
                                    <div class="col-md-3">
                                        <input type="text" name="nowPrice" class="form-control"
                                               id="input_now_price" placeholder="如65"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品分类</label>
                                    <div class="col-md-3">
                                        <!-- 提交品牌id即可 -->
                                        <select id="select_category" class="form-control" name="categoryId"></select>
                                    </div>
                                    <label class="col-md-2 control-label">商品标签</label>
                                    <div class="col-md-3">
                                        <!-- 提交平台id即可 -->
                                        <select id="select_tag" class="form-control" name="productTagId"></select>
                                    </div>
                                </div>




                                <div class="form-group">
                                    <label class="col-md-2 control-label">上架</label>
                                    <div class="checkbox">
                                        <label >是否上架</label>
                                        <input id="select_xiajia" type="checkbox" style="margin-left: 10px" value="remember-me">

                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-2 control-label">简介</label>
                                    <div class="col-md-8">
                                        <textarea id="input_summary" class="col-sm-12" rows="5" name="summary" placeholder="商品简介"></textarea>
                                        <span class="help-block"></span>
                                    </div>
                                </div>



                            </form>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <div>
                                        <!-- 点击图片添加文件方式 -->
                                        <button id="btn_add_logo" type="button" class="btn btn-primary" onclick="getElementById('input_file_add').click()">点此添加logo</button>
                                        <input type="file" name="file" style="opacity:0;filter:alpha(opacity=0);" id="input_file_add"/>
                                    </div>
                                    <img id="img_add_logo" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"
                                         width="120px" height="80px">
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-lg-12"  style="margin-top: 20px">
                                    <div>
                                        <!-- 点击图片添加文件方式 -->
                                        <button id="btn_add_image" type="button" class="btn btn-primary" onclick="getElementById('input_multipart_file_add').click()">点此添加商品封面(可上传4张)</button>
                                        <input type="file" multiple="multiple" name="file" style="opacity:0;filter:alpha(opacity=0);" id="input_multipart_file_add"/>
                                    </div>
                                    <img id="img_add_upload0" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                         alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                    <img id="img_add_upload1" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                         alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                    <img id="img_add_upload2" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                         alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                    <img id="img_add_upload3" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                         alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-offset-3 col-md-6" style="margin-top: 30px">
                        <button id="btn_add" class="btn btn-lg btn-primary btn-block"
                                type="submit" onclick="doSubmit()">确定添加</button>
                        <div class="col-md-offset-6 col-md-6" style="margin-top: 50px">
                            <span id="span_status" style="color: green;"></span>
                        </div>
                    </div>


                </div>


                <!-- 商品操作  搭建显示页面 -->
                <div id="div_oprate_product" class="container-fluid" style="display: none">
                    <!-- 按钮 -->
                    <div class="row">
                        <div class="col-md-4 col-md-offset-8">
                            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
                            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
                        </div>
                    </div>
                    <!-- 显示表格数据 -->
                    <div class="row">
                        <div class="col-md-10">
                            <table class="table table-hover" id="product_table">
                                <thead>
                                <tr>
                                    <th style='vertical-align: middle;text-align: center;'>
                                        <input type="checkbox" id="check_all"/>
                                    </th>
                                    <th style='vertical-align: middle;text-align: center;'>序号</th>
                                    <th style='vertical-align: middle;text-align: center;'>商品信息</th>
                                    <th style='vertical-align: middle;text-align: center;'>成本价</th>
                                    <th style='vertical-align: middle;text-align: center;'>原价</th>
                                    <th style='vertical-align: middle;text-align: center;'>现价</th>
                                    <th style='vertical-align: middle;text-align: center;'>是否上架</th>
                                    <th style='vertical-align: middle;text-align: center;'>操作</th>
                                </tr>
                                </thead>
                                <tbody >

                                </tbody>
                            </table>
                        </div>
                    </div>


                    <!-- 显示分页信息 -->
                    <div class="row">
                        <!--分页文字信息  -->
                        <div class="col-md-6" id="page_info_area"></div>
                        <!-- 分页条信息 -->
                        <div class="col-md-6" id="page_nav_area">

                        </div>
                    </div>

                </div>

            </div>

        </div>




    </div>


</div>


<script type="text/javascript">
    var pagerNumber=1;

    //ajax提交
    $(function(){
        getCategory("#select_category");
        getTag("#select_tag");


        clickMenu("#div_main");
        clickMenu("#div_product");
        clickMenu("#div_order");
        clickMenu("#div_user");
        clickMenu("#div_message");
        clickMenu("#div_setting");

        inputCount("#input_buy_price");
        inputCount("#input_original_price");
        inputCount("#input_discount");
        inputCount("#input_now_price");

        setListener();

    });

    function clickProductMenu(id){
        $("#bt_add_product").removeClass("btn-primary");
        $("#bt_product_oprate").removeClass("btn-primary");

        $("#"+id).blur(); //去除焦点
        $("#"+id).addClass("btn-primary");

        if(id=="bt_add_product"){
            $("#div_add_product").show();
            $("#div_oprate_product").hide();
        }else{
            $("#div_add_product").hide();
            $("#div_oprate_product").show();
            getProductList(pagerNumber);
        }


        window.event.returnValue = false;
    }



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



    function getProductList(pagerNumber){
        $.ajax({
            url:"${APP_PATH}/getAdminProductList",
            //默认显示10条数据
            data:"pagerNumber="+pagerNumber+"&pagerSize=10",
            type:"GET",
            success:function(result){
                //console.log(result);
                //1、解析并显示员工数据
                showProductList(result);
                //2、解析并显示分页信息
                //build_page_info(result);
                //3、解析显示分页条数据
                //build_page_nav(result);
            }
        });
    }

    function showProductList(result) {
        //清空table表格
        $("#product_table tbody").empty();
        var productList = result.data.list;
        $.each(productList,function(index,item){
            var checkBoxTd = $("<td style='vertical-align: middle;text-align: center;'><input type='checkbox' class='check_item'/></td>");
            var productIdTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append(item.productId);


            var imageTd = "<img src='"+item.logo+"' class='img-rounded img-responsive center-block' style='width: 50px;height: 50px;'>";
            var nameTd =$("<h5></h5>").append(item.productName);
            var titleTd =$("<small></small>").append(item.title);

            var imageDivTd =$("<div style='vertical-align: middle;text-align: center;'></div>").append(imageTd).addClass("col-md-1");
            var divTd =$("<div></div>").append(nameTd).append(titleTd).addClass("col-md-11");
            var productNameTd = $("<td style='vertical-align: middle;'></td>").append(imageDivTd).append(divTd);


            var buyPriceTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append("￥"+item.buyPrice);
            var originalPriceTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append("￥"+item.originalPrice);
            var nowPriceTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append("￥"+item.nowPrice);

            var isSaleTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append(item.isSale==0?"否":"是");
            /**
             <button class="">
             <span class="" aria-hidden="true"></span>
             编辑
             </button>
             */
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",item.productId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",item.productId);
            var btnTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(productIdTd)
                .append(productNameTd)
                .append(buyPriceTd)
                .append(originalPriceTd)
                .append(nowPriceTd)
                .append(isSaleTd)
                .append(btnTd)
                .appendTo("#product_table tbody");//添加到哪里
        });
    };


    $("#input_file").change(function(){
        $("#btn_edit_update_logo").blur(); //去除焦点
        //创建FormData对象
        var data = new FormData();
        var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
        if (objUrl) {
            $("#img_edit_logo").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
            window.event.returnValue = false;
        }

    });
    $("#input_multipart_file").change(function(){
        $("#btn_edit_update_image").blur(); //去除焦点
        //创建FormData对象
        var data = new FormData();
        $.each($('#input_multipart_file')[0].files, function(i, file) {
            var objUrl = getObjectURL(file) ; //获取图片的路径，该路径不是图片在本地的路径
            if (objUrl) {
                $("#img_update_upload"+i).attr("src", objUrl) ; //将图片路径存入src中，显示出图片
                $("#img_update_upload"+i).removeClass("hide");
                $("#img_update_upload"+i).addClass("show");
                window.event.returnValue = false;
            }
        });
    });
    $("#input_file_add").change(function(){
        $("#btn_add_logo").blur(); //去除焦点
        //创建FormData对象
        var data = new FormData();
        var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
        if (objUrl) {
            $("#img_add_logo").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
            window.event.returnValue = false;
        }

    });
    $("#input_multipart_file_add").change(function(){
        $("#btn_add_image").blur(); //去除焦点
        //创建FormData对象
        var data = new FormData();
        if($('#input_multipart_file_add')[0].files.length>=1){
            $("#img_add_upload0").hide();
            $("#img_add_upload1").hide();
            $("#img_add_upload2").hide();
            $("#img_add_upload3").hide();
        }

        $.each($('#input_multipart_file_add')[0].files, function(i, file) {
            var objUrl = getObjectURL(file) ; //获取图片的路径，该路径不是图片在本地的路径
            if (objUrl) {
                $("#img_add_upload"+i).attr("src", objUrl) ; //将图片路径存入src中，显示出图片
                $("#img_add_upload"+i).show();
                window.event.returnValue = false;
            }
        });
    });

    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }


    var logo;
    function doUpload(){
        window.event.returnValue = false;
        if ($('#file_upload').val() == null || $('#file_upload').val() == '') {
            alert('请选择文件上传');
        } else {
            var formData = new FormData($("#form_upload")[0]);
            $.ajax({
                url: '${BASE_URL}file/upload?a=Math.random();',
                type: 'POST',
                data: formData,
                async: false,
                contentType: false,
                processData: false,
                success: function (result) {
                    logo=result.data.image;
                    var imageSource='${BASE_URL}'+logo;
                    $('#img_upload').attr('src', imageSource);
                    $("#a_upload").removeClass("hide");
                    $("#a_upload").addClass("show");

                },
                error: function (data) {
                    var obj=data;
                    alert(obj);
                    window.event.returnValue = false;
                }


            });
        }
    }


    var image1;
    var image2;
    var image3;
    var image4;
    function doUploadMultipartFile() {
        window.event.returnValue = false;
        if ($('#file_upload_multipart_file').val() == null || $('#file_upload_multipart_file').val() == '') {
            alert('请选择文件上传');
        } else {
            var formData = new FormData($("#form_upload_multipart_file")[0]);
            $.ajax({
                url: '${BASE_URL}file/uploadMultipartFile',
                type: 'POST',
                data: formData,
                async: false,
                contentType: false,
                processData: false,
                success: function (result) {
                    var obj=result.data.imageList;
                    if(obj!=undefined&&obj.length>0){
                        for (var i=0;i<obj.length;i++){
                            if(obj[i]!=undefined){
                                if(i==0){
                                    image1=obj[i];
                                }else if(i==1){
                                    image2=obj[i];
                                }else if(i==2){
                                    image3=obj[i];
                                }else if(i==3){
                                    image4=obj[i];
                                }
                                var imageSource='${BASE_URL}'+obj[i];
                                $('#img_upload'+i).attr('src', imageSource);
                                $("#a_upload"+i).removeClass("hide");
                                $("#a_upload"+i).addClass("show");
                            }
                        }

                    }


                },
                error: function (data) {
                    alert(data)
                }
            });
        }
    }



    function doSubmit(){
        doAddproduct(); //添加商品

    }

    function doAddproduct(){
        $("#btn_add").blur(); //去除焦点
        //1、拿到要校验的数据，使用正则表达式
        var product_name = $("#input_name").val();
        var title = $("#input_title").val();
        var buy_price = $("#input_buy_price").val();
        var original_price = $("#input_original_price").val();
        var discount = $("#input_discount").val();
        var now_price = $("#input_now_price").val();
        var category_id = $("#select_category").val();
        var product_tag_id = $("#select_tag").val();

        var summary = $("#input_summary").val();

        if(title==undefined||title==""){
            title=product_name;
        }

        var shop_id=1;
        var product_code=2003;
        var graphic_detail=summary;

        if(logo==undefined){
            alert("请上传logo");
            return;
        }

        var params = $("#form_add_product").serialize();
        params+=("&logo="+logo);
        if(image1!=undefined){
            params+=("&image1="+image1);
        }
        if(image2!=undefined){
            params+=("&image2="+image2);
        }
        if(image3!=undefined){
            params+=("&image3="+image3);
        }
        if(image4!=undefined){
            params+=("&image4="+image4);
        }
        if($('#select_xiajia').is(':checked')) {
            params+=("&isSale="+1);
        }else{
            params+=("&isSale="+0);
        }

        alert(params);
        //2、发送ajax请求保存抢购信息
        $.ajax({
            url : "${APP_PATH}/addProduct",
            type : "GET",
            data : params,
            success : function(result) {
                var code = result.code;
                if (code != 100) {
                    $("#span_status").addClass("glyphicon glyphicon-remove");
                    $("#span_status").text(result.msg);
                    $.session.clear();
                } else {
                    $("#span_status").addClass("glyphicon glyphicon-ok");
                    $("#span_status").text(result.msg);
                }
            }
        });

        window.event.returnValue = false;
    }

    //1、我们是按钮创建之前就绑定了click，所以绑定不上。
    //1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
    //jquery新版没有live，使用on进行替代
    $(document).on("click",".delete_btn",function(){
        //1、查出商品信息
        //getProductDetail($(this).attr("edit-id"));

        //3、把商品的id传递给模态框的更新按钮
        $("#btn_modal_del").attr("edit-id",$(this).attr("edit-id"));
        $("#div_delete_modal").modal('show')
    });

    //点击更新，更新员工信息
    $("#btn_modal_del").click(function(){
        $("#div_delete_modal").modal("hide");
    });

    $(document).on("click",".edit_btn",function(){
        //1、查出商品信息
        //getProductDetail($(this).attr("edit-id"));

        //3、把商品的id传递给模态框的更新按钮
        $("#btn_modal_edit").attr("edit-id",$(this).attr("edit-id"));
        $("#div_edit_modal").modal('show')
    });

    //点击更新，更新员工信息
    $("#btn_modal_edit").click(function(){
        $("#div_edit_modal").modal("hide");
    });


    function getCategory(ele) {
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/getAllProductCategoryList",
            type:"GET",
            success:function(result){
                //显示部门信息在下拉列表中
                $.each(result.data.list,function(){
                    var optionEle = $("<option></option>").append(this.categoryName).attr("value",this.categoryId);
                    optionEle.appendTo(ele);
                });
            }
        });
    };
    function getTag(ele) {
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/getAllProductTagList",
            type:"GET",
            success:function(result){
                //显示部门信息在下拉列表中
                $.each(result.data.list,function(){
                    var optionEle = $("<option></option>").append(this.tagName).attr("value",this.tagId);
                    optionEle.appendTo(ele);
                });
            }
        });
    };




    function inputCount(ele) {
        $("ele").keyup(function () {
            var reg = $(this).val().match(/\d+\.?\d{0,2}/);
            var txt = '';
            if (reg != null) {
                txt = reg[0];
            }
            $(this).val(txt);
        }).change(function () {
            $(this).keypress();
            var v = $(this).val();
            if (/\.$/.test(v))
            {
                $(this).val(v.substr(0, v.length - 1));
            }
        });
    }


    var original_price = $("#input_original_price").val();
    var discount = $("#input_discount").val();
    function setListener(){
        $("#original_price").bind("input propertychange change",function(event){
            var original_price = $("#input_original_price").val();
            var discount = $("#input_discount").val();

            if(buy_price!=""&&original_price!=""&&discount!=""){
                $("#input_now_price").val(original_price*discount/10)
            }
        });

        $("#discount").bind("input propertychange change",function(event){
            var original_price = $("#input_original_price").val();
            var discount = $("#input_discount").val();

            if(buy_price!=""&&original_price!=""&&discount!=""){
                $("#input_now_price").val(original_price*discount/10)
            }
        });
    }



</script>

</body>
</html>