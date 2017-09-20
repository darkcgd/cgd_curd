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
    <script src="http://bootboxjs.com/bootbox.js"></script>
    <%--https://github.com/nakupanda/bootstrap3-dialog--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet">
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
                                        <input id="select_update_xiajia" type="checkbox" style="margin-left: 10px">

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
                                            <button id="btn_edit_update_logo" type="button" class="btn btn-primary" onclick="getElementById('input_file').click()">点此修改logo</button>
                                            <input type="file" name="file" style="opacity:0;filter:alpha(opacity=0);" id="input_file"/>
                                        </div>
                                        <img id="img_edit_logo" src="${APP_PATH }/static/image/bg_default_add_image.png" style="display: none"
                                             width="160px" height="80px">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div>
                                            <!-- 点击图片添加文件方式 -->
                                            <button id="btn_edit_update_image" type="button" class="btn btn-primary" onclick="getElementById('input_multipart_file').click()">点此修改商品封面(可上传5张)</button>
                                            <input type="file" multiple="multiple" name="multipartFile" style="opacity:0;filter:alpha(opacity=0);" id="input_multipart_file"/>
                                        </div>
                                                <img id="img_update_upload0" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px" style="margin: 4px"/>
                                                <img id="img_update_upload1" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px" style="margin: 4px"/>
                                                <img id="img_update_upload2" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px" style="margin: 4px"/>
                                                <img id="img_update_upload3" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px" style="margin: 4px"/>
                                                <img id="img_update_upload4" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                     alt="logo" width="100px" height="80px" style="margin: 4px"/>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_modal_edit">确定修改</button>
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
                            <form class="form-horizontal" id="form_add_product">
                                <div class="col-md-6">
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
                                        <input id="select_xiajia" type="checkbox" style="margin-left: 10px" value="0">

                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-2 control-label">简介</label>
                                    <div class="col-md-8">
                                        <textarea id="input_summary" class="col-sm-12" rows="5" name="summary" placeholder="商品简介"></textarea>
                                        <span class="help-block"></span>
                                    </div>
                                </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div>
                                                <!-- 点击图片添加文件方式 -->
                                                <button id="btn_add_logo" type="button" class="btn btn-primary" onclick="getElementById('input_file_add').click()">点此添加logo</button>
                                                <input type="file" name="file" style="opacity:0;filter:alpha(opacity=0);" id="input_file_add"/>
                                            </div>
                                            <img id="img_add_logo" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png" style="display: none"
                                                 width="120px" height="80px">
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div>
                                                <!-- 点击图片添加文件方式 -->
                                                <button id="btn_add_image" type="button" class="btn btn-primary" onclick="getElementById('input_multipart_file_add').click()">点此添加商品封面(可上传5张)</button>
                                                <input type="file" multiple="multiple" name="multipartFile" style="opacity:0;filter:alpha(opacity=0);" id="input_multipart_file_add"/>
                                            </div>
                                            <img id="img_add_upload0" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                 alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                            <img id="img_add_upload1" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                 alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                            <img id="img_add_upload2" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                 alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                            <img id="img_add_upload3" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                 alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                            <img id="img_add_upload4" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"  style="display: none"
                                                 alt="logo" width="120px" height="80px" style="margin: 4px"/>
                                        </div>
                                    </div>
                                </div>
                            </form>



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
                    <div class="row" style="margin-top: 10px">
                        <div class="col-md-4">
                            <button class="btn btn-danger" id="btn_delete_all"><span class="glyphicon glyphicon-trash" style="margin-right: 6px"></span>删除</button>
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
    var totalRecord;

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
                //1、解析并显示商品列表数据
                showProductList(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
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


            var imageTd = "<img src='"+'${BASE_URL}'+item.logo+"' class='img-rounded img-responsive center-block' style='width: 50px;height: 50px;'>";
            var nameTd =$("<h5></h5>").append(item.productName);
            var titleTd =$("<small></small>").append(item.title);

            var imageDivTd =$("<div style='vertical-align: middle;text-align: center;'></div>").append(imageTd).addClass("col-md-1");
            var divTd =$("<div></div>").append(nameTd).append(titleTd).addClass("col-md-11");
            var productNameTd = $("<td style='vertical-align: middle;'></td>").append(imageDivTd).append(divTd);


            var buyPriceTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append("￥"+item.buyPrice);
            var originalPriceTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append("￥"+item.originalPrice);
            var nowPriceTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append("￥"+item.nowPrice);

            var isSaleTd = $("<td style='vertical-align: middle;text-align: center;'></td>").append(item.isSale==1?"是":"否");
            /**
             <button class="">
             <span class="" aria-hidden="true"></span>
             编辑
             </button>
             */
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前商品id
            editBtn.attr("productId",item.productId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的商品id
            delBtn.attr("productId",item.productId);
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
                getProductList(1)
            });
            prePageLi.click(function(){
                getProductList(result.data.pagerNumber -1)
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.data.isLastPage == true){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                getProductList(result.data.pagerNumber +1);
            });
            lastPageLi.click(function(){
                getProductList(result.data.totalPage);
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
                getProductList(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


    //完成全选/全不选功能
    $("#check_all").click(function(){
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //check_item
    $(document).on("click",".check_item",function(){
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //点击全部删除，就批量删除
    $("#btn_delete_all").click(function(){
         //$("#btn_delete_all").blur(); //去除焦点
        var del_idstr = "";
        $.each($(".check_item:checked"),function(){
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+",";
        });
        if(del_idstr==''){
            //https://github.com/nakupanda/bootstrap3-dialog
            showDialog("请至少选择一条数据");
            return;
        }
        var checkedLength=$(".check_item:checked").length;
        BootstrapDialog.show({
            type:  BootstrapDialog.TYPE_PRIMARY,
            title: '提示',
            message: "确定删除选中的"+checkedLength+"条数据吗？",
            buttons: [{
                label: '再想想',
                action: function(dialogRef){
                    dialogRef.close();
                }
            },{
                icon: 'glyphicon glyphicon-send',
                label: '确定',
                cssClass: 'btn-primary',
                autospin: true,
                action: function(dialogRef){
                    dialogRef.enableButtons(false);
                    dialogRef.setClosable(false);
                    dialogRef.getModalBody().html('删除中...');

                    //发送ajax请求删除
                    $.ajax({
                        url:"${APP_PATH}/doDeleteProductByIds?ids="+del_idstr,
                        type:"DELETE",
                        success:function(result){
                            dialogRef.close();
                            //回到当前页面
                            getProductList(pagerNumber);
                            $("#check_all").prop("checked",false);

                        },
                        error: function (data) {
                            showDialog("删除失败!");
                        }
                    });
                }
            }
            ]
        });

    });


    $("#input_file").change(function(){
        $("#btn_edit_update_logo").blur(); //去除焦点
        //创建FormData对象
        var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
        if (objUrl) {
            $("#img_edit_logo").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
            $("#img_edit_logo").show();
            window.event.returnValue = false;
        }

    });
    $("#input_multipart_file").change(function(){
        $("#btn_edit_update_image").blur(); //去除焦点
        if($('#input_multipart_file')[0].files.length>=1){
            $("#img_update_upload0").hide();
            $("#img_update_upload1").hide();
            $("#img_update_upload2").hide();
            $("#img_update_upload3").hide();
            $("#img_update_upload4").hide();
        }
        //创建FormData对象
        $.each($('#input_multipart_file')[0].files, function(i, file) {
            var objUrl = getObjectURL(file) ; //获取图片的路径，该路径不是图片在本地的路径
            if (objUrl) {
                $("#img_update_upload"+i).attr("src", objUrl) ; //将图片路径存入src中，显示出图片
                $("#img_update_upload"+i).show();
                window.event.returnValue = false;
            }
        });
    });
    $("#input_file_add").change(function(){
        $("#btn_add_logo").blur(); //去除焦点
        //创建FormData对象
        var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
        if (objUrl) {
            $("#img_add_logo").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
            $("#img_add_logo").show();
            window.event.returnValue = false;
        }

    });
    $("#input_multipart_file_add").change(function(){
        $("#btn_add_image").blur(); //去除焦点
        //创建FormData对象
        if($('#input_multipart_file_add')[0].files.length>=1){
            $("#img_add_upload0").hide();
            $("#img_add_upload1").hide();
            $("#img_add_upload2").hide();
            $("#img_add_upload3").hide();
            $("#img_add_upload4").hide();
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
            showDialog('请选择文件上传');
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
                    showDialog(obj);
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
            showDialog('请选择文件上传');
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
                    showDialog("上传失败")
                }
            });
        }
    }



    function doSubmit(){
        doAddproduct(); //添加商品

    }

    /*function doAddproduct(){
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
     showDialog("请上传logo");
            return;
        }

        var params = $("#form_add_product").serialize();
     showDialog(params);
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

     showDialog(params);
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
    }*/


    function doAddproduct(){
        $("#btn_add").blur(); //去除焦点
        var summary = $("#input_summary").val();
        /*var shop_id=1;
        var product_code=2003;
        var graphic_detail=summary;*/
        var formData = new FormData(document.getElementById("form_add_product"));//表单id
        if($('#select_xiajia').is(':checked')) {
            formData.append("isSale", 1);
        }else{
            formData.append("isSale", 0);
        }
        formData.append("shopId", 1);
        formData.append("productCode", 2003);
        formData.append("graphicDetail", summary);
        $.ajax({
            url : "${APP_PATH}/addProduct",
            type : "POST",
            data : formData,
            async : false,
            cache : false,
            contentType : false,
            processData : false,
            success : function(result) {
                var code = result.code;
                if (code != 100) {
                    $("#span_status").addClass("glyphicon glyphicon-remove");
                    $("#span_status").text(result.msg);
                } else {
                    $("#span_status").addClass("glyphicon glyphicon-ok");
                    $("#span_status").text(result.msg);
                }
            },
            error : function(e) {
                showDialog("添加失败");
            }
        });

        window.event.returnValue = false;
    }

    //1、我们是按钮创建之前就绑定了click，所以绑定不上。
    //1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
    //jquery新版没有live，使用on进行替代
    $(document).on("click",".delete_btn",function(){
        var productId=$(this).attr("productId");
        BootstrapDialog.show({
            type:  BootstrapDialog.TYPE_PRIMARY,
            title: '提示',
            message: "确定删除吗？",
            buttons: [{
                label: '再想想',
                action: function(dialogRef){
                    dialogRef.close();
                }
            },{
                icon: 'glyphicon glyphicon-send',
                label: '确定',
                cssClass: 'btn-primary',
                autospin: true,
                action: function(dialogRef){
                    dialogRef.enableButtons(false);
                    dialogRef.setClosable(false);
                    dialogRef.getModalBody().html('删除中...');
                    doDeleteProduct(productId,dialogRef);
                }
            }
            ]
        });


    });

    //点击修改，修改商品列表信息
    $("#btn_modal_del").click(function(){
        $("#div_delete_modal").modal("hide");
    });

    $(document).on("click",".edit_btn",function(){
        //1、查出分类信息，并显示列表
        getCategory("#select_update_category");
        //2、查出标签信息，并显示列表
        getTag("#select_update_tag");

        //2、查出商品信息，显示商品信息
        getProductDetail($(this).attr("productId"));

        //3、把商品的id传递给模态框的修改按钮
        $("#btn_modal_edit").attr("productId",$(this).attr("productId"));
        $("#div_edit_modal").modal('show')
    });

    //点击修改，修改商品信息
    $("#btn_modal_edit").click(function(){
        $("#btn_modal_edit").blur(); //去除焦点
        var summary = $("#input_update_summary").val();
        var formData = new FormData(document.getElementById("form_update_product"));//表单id
        if($('#select_update_xiajia').is(':checked')) {
            formData.append("isSale", 1);
        }else{
            formData.append("isSale", 0);
        }
        formData.append("productId", $("#btn_modal_edit").attr("productId"));
        formData.append("shopId", 1);
        formData.append("productCode", 2003);
        formData.append("graphicDetail", summary);
        $.ajax({
            url : "${APP_PATH}/doUpdateProduct",
            type : "POST",
            data : formData,
            async : false,
            cache : false,
            contentType : false,
            processData : false,
            success : function(result) {
                var code = result.code;
                if (code != 100) {

                } else {
                    $("#div_edit_modal").modal("hide");
                    getProductList(pagerNumber);
                }

            },
            error : function(e) {
                showDialog("修改失败");
            }
        });
    });


    //删除商品操作
    $("#btn_modal_del").click(function(){
        var productId=$(this).attr("productId");
        doDeleteProduct(productId);
    });

    function doDeleteProduct(id,dialogRef){
        $.ajax({
            url:"${APP_PATH}/doDeleteProductById?productId="+id,
            type:"GET",
            success:function(result){
                if(result.code==100){
                    dialogRef.close();
                    getProductList(pagerNumber);
                }else{
                    showDialog("删除失败");
                }
            }
        });
    }

    function getProductDetail(id){
        $.ajax({
            url:"${APP_PATH}/getProductDetail?productId="+id,
            type:"GET",
            success:function(result){
                if(result.code==100){
                    var data=result.data;
                    $("#input_update_name").val(data.productName);
                    $("#input_update_title").val(data.title);
                    $("#input_update_buy_price").val(data.buyPrice);
                    $("#input_update_original_price").val(data.originalPrice);
                    $("#input_update_discount").val(data.discount);
                    $("#input_update_now_price").val(data.nowPrice);
                    $("#select_update_category").append(this.categoryName).val(data.categoryId);
                    $("#select_update_tag").append(this.tagName).val(data.productTagId);
                    $("#input_update_summary").val(data.summary);

                    //1上架0下架
                    $("#select_update_xiajia").prop("checked",data.isSale==1?true:false);//全选
                    //$("#select_update_xiajia").prop("checked",'true');//全选

                    $("#img_edit_logo").attr("src", '${BASE_URL}'+data.logo) ; //将图片路径存入src中，显示出图片
                    $("#img_edit_logo").show();

                    if(data.image.length>0){
                        $.each(data.image, function(i, imageStr) {
                            $("#img_update_upload"+i).attr("src", '${BASE_URL}'+imageStr) ; //将图片路径存入src中，显示出图片
                            $("#img_update_upload"+i).show();
                            window.event.returnValue = false;
                        });
                    }
                }else{
                    showDialog("查询商品失败");
                }
            }
        });
    }




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

    function showDialog(msg) {
        BootstrapDialog.show({
            type:  BootstrapDialog.TYPE_PRIMARY,
            title: '提示',
            message: msg,
            closable: true,
            closeByBackdrop: true,
            closeByKeyboard: true,
            buttons: [{
                label: '知道了',
                action: function(dialogRef){
                    dialogRef.close();
                }
            }]
        });
    }



</script>

</body>
</html>