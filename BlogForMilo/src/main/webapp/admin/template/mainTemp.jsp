<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<!-- <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" /> -->
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="keywords" content="个人博客,Milo个人博客,个人博客系统,Milo博客,Milo">
<meta name="description" content="Milo博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/favicon.ico" />
<title>Milo 博客后台管理系统</title>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/static/admin/css/build.css" rel="stylesheet">
<!-- 百度编辑器 ueditor-->
<link href="${pageContext.request.contextPath}/static/plugin/ueditor1_4_3_3-utf8-jsp/utf8-jsp/themes/iframe.css" rel="stylesheet">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<script src="${pageContext.request.contextPath}/static/admin/js/jquery-2.1.4.min.js"></script>
<!--[if gte IE 9]>
  <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/static/admin/js/html5shiv.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/static/admin/js/respond.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/static/admin/js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/plugin/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/plugin/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.all.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/plugin/ueditor1_4_3_3-utf8-jsp/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
// $(document).ready(function(){
// 	  $(".sidebar ul li").click(function(){
// 		  /* 取消已选定菜单高亮显示 */
// 		  $(".sidebar ul li").each(function(){
// 			  $(this).removeClass("active");
// 		  });
// 		  /* 添加新选择菜单高亮显示 */
// 		  $(this).addClass("active").siblings().removeClass("active");
// 		  /* 获取选定指定菜单的url*/
// 		  var url=$(this).children("a").children("input").val();
// 		  /* 将该菜单所呈现的页面回显 */
// 	      $("#body-div").load(url);
// 	  });
// 	});
// 	function clickShow(url){
// 		$("#body-div").load(url);
// 	}
</script>
</head>
<body class="user-select" style="padding-right: 0px;">
<section class="container-fluid">
    <!-- header  menu -->
    <jsp:include page="/admin/template/head.jsp"/>
  <div class="row">
    <!-- left aside menu -->
    <jsp:include page="/admin/template/aside.jsp"/>
    <div id="body-div">
     <jsp:include page="${mainPage }"/>
    <%--  <jsp:include page="/admin/main.jsp"/> --%> 
    </div>
  </div>
</section>

<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">旧密码:</td>
                <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">确认密码:</td>
                <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >登录记录</h4>
      </div>
      <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr>
                <th>登录IP</th>
                <th>登录时间</th>
                <th>状态</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>::1:55570</td>
                <td>2016-01-08 15:50:28</td>
                <td>成功</td>
              </tr>
              <tr>
                <td>::1:64377</td>
                <td>2016-01-08 10:27:44</td>
                <td>成功</td>
              </tr>
              <tr>
                <td>::1:64027</td>
                <td>2016-01-08 10:19:25</td>
                <td>成功</td>
              </tr>
              <tr>
                <td>::1:57081</td>
                <td>2016-01-06 10:35:12</td>
                <td>成功</td>
              </tr>
            </tbody>
          </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="${pageContext.request.contextPath}/static/admin/images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="${pageContext.request.contextPath}/static/admin/images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问异清轩博客</li>
    <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/static/admin/js/bootstrap.js"></script> 
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/static/admin/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/static/admin/js/dataTables.bootstrap.js"></script>
<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/static/admin/js/admin-scripts.js"></script>
<!--bootbox.js  -->
<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/static/admin/js/bootbox.min.js"></script>
<!--  -->
<script id="uploadEditor" type="text/plain" style="display:none;"></script>
<!-- <script type="text/javascript">
    function changeState(el) {
        if (el.readOnly) el.checked=el.readOnly=false;
        else if (!el.checked) el.readOnly=el.indeterminate=true;
    }
</script> -->
</body>
</html>