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
                <div class="container-fluid" style="margin-top:20px;">
                    <div class="row" >
                        <div class="col-md-6">
                            <form class="form-horizontal" id="formAddQianggoubiao">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品名称</label>
                                    <div class="col-md-8">
                                        <input type="text" name="qianngouName" class="form-control"
                                               id="input_name" placeholder="商品名称,例如小米6（2499/2899）"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品标题</label>
                                    <div class="col-md-8">
                                        <input type="text" name="qianngouName" class="form-control"
                                               id="input_title" placeholder="可不填"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">成本价(进货价)</label>
                                    <div class="col-md-3">
                                        <input type="text" name="qianngouName" class="form-control"
                                               id="input_buy_price" placeholder="如36"> <span
                                            class="help-block"></span>
                                    </div>

                                    <label class="col-md-2 control-label">原价</label>
                                    <div class="col-md-3">
                                        <input type="text" name="qianngouName" class="form-control"
                                               id="input_original_price" placeholder="如100"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">折扣</label>
                                    <div class="col-md-3">
                                        <input type="text" name="qianngouName" class="form-control"
                                               id="input_discount" placeholder="如6.5"> <span
                                            class="help-block"></span>
                                    </div>

                                    <label class="col-md-2 control-label">售价</label>
                                    <div class="col-md-3">
                                        <input type="text" name="qianngouName" class="form-control"
                                               id="input_now_price" placeholder="如65"> <span
                                            class="help-block"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">商品分类</label>
                                    <div class="col-md-3">
                                        <!-- 提交品牌id即可 -->
                                        <select id="select_category" class="form-control" name="qianggouBrandId"></select>
                                    </div>
                                    <label class="col-md-2 control-label">商品标签</label>
                                    <div class="col-md-3">
                                        <!-- 提交平台id即可 -->
                                        <select id="select_tag" class="form-control" name="qianggouPlatformId"></select>
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
                                        <textarea id="input_summary" class="col-sm-12" rows="5" name="directeUrl" placeholder="商品简介"></textarea>
                                        <span class="help-block"></span>
                                    </div>
                                </div>



                            </form>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-12 control-label">Logo</label>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <form class="form form-horizontal" action=""  method="post"  id="form_upload">
                                            <div class="row">
                                                <input type="file" class="input-text"  width="120px" id="file_upload" name="file">
                                                <input type="submit" value="上传" style="margin-top: 10px" onclick="doUpload()">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="col-md-2">
                                            <a id="a_upload" class="thumbnail hide"><img id="img_upload" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"
                                                                                         alt="logo" width="100px" height="100px"/></a>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12 control-label">商品封面(可上传4张)</label>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <form class="form form-horizontal" action=""  method="post"  id="form_upload_multipart_file">
                                            <div class="row">
                                                <input id="file_upload_multipart_file" type="file" name="file" multiple="multiple"  width="120px">
                                                <input type="submit" value="上传" style="margin-top: 10px" onclick="doUploadMultipartFile()">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="col-md-2">
                                            <a id="a_upload0" class="thumbnail hide"><img id="img_upload0" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"
                                                                                          alt="logo" width="100px" height="100px"/></a>
                                        </div>
                                        <div class="col-md-2">
                                            <a id="a_upload1" class="thumbnail hide"><img id="img_upload1" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"
                                                                                          alt="logo" width="100px" height="100px"/></a>
                                        </div>
                                        <div class="col-md-2">
                                            <a id="a_upload2" class="thumbnail hide"><img id="img_upload2" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"
                                                                                          alt="logo" width="100px" height="100px"/></a>
                                        </div>
                                        <div class="col-md-2">
                                            <a id="a_upload3" class="thumbnail hide"><img id="img_upload3" class="img-rounded" src="${APP_PATH }/static/image/bg_default_add_image.png"
                                                                                          alt="logo" width="100px" height="100px"/></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-offset-3 col-md-6" style="margin-top: 30px">
                        <button id="btn_add" class="btn btn-lg btn-primary btn-block"
                                type="submit" onclick="doSubmit()">确定添加</button>
                    </div>
                    <span id="span_status" style="color: green;"></span>

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    //ajax提交
    $(document).ready(function() {

    });

    getCategory("#select_category");
    getTag("#select_tag");


    clickMenu("#div_main");
    clickMenu("#div_product");
    clickMenu("#div_order");
    clickMenu("#div_user");
    clickMenu("#div_message");
    clickMenu("#div_setting");

    function clickProductMenu(id){
        $("#bt_add_product").removeClass("btn-primary");
        $("#bt_product_oprate").removeClass("btn-primary");

        $("#"+id).addClass("btn-primary");

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

        var is_sale;
        if($('#select_xiajia').is(':checked')) {
            is_sale=1;
        }else{
            is_sale=0;
        }
        var summary = $("#input_summary").val();

        if(title==undefined||title==""){
            title=product_name;
        }

        var shop_id=1;
        var product_code=2003;
        var graphic_detail=summary;

        var params = $("#formAddQianggoubiao").serialize();
        //alert(params);
        //2、发送ajax请求保存抢购信息
        $.ajax({
            url : "${APP_PATH}/qianggoubiao/save",
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



</script>

</body>
</html>