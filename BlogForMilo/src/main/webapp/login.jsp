<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Milo个人博客管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/login.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
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
</head>

<body class="user-select">
<div class="container">
  <div class="siteIcon"><img src="${pageContext.request.contextPath}/static/admin/images/icon/icon.png" alt="" data-toggle="tooltip" data-placement="top" title="欢迎使用Milo个人博客管理系统" draggable="false" /></div>
  <form action="${pageContext.request.contextPath}/blogger/login.do" method="post" method="post" autocomplete="off" class="form-signin">
    <h2 class="form-signin-heading">管理员登录</h2>
    <label for="userName" class="sr-only">用户名</label>
    <input type="text" id="userName" name="userName" class="form-control" placeholder="请输入用户名" required autofocus autocomplete="off" maxlength="10" value="java1234">
    <label for="userPwd" class="sr-only">密码</label>
    <input type="password" id="userPwd" name="password" class="form-control" placeholder="请输入密码" required autocomplete="off" maxlength="18" value="123456">
    <button class="btn btn-lg btn-primary btn-block" type="submit" id="signinSubmit">登录</button>
  </form>
  <div class="footer">
    <p><a href="index.html" data-toggle="tooltip" data-placement="left" title="不知道自己在哪?">回到前台 →</a></p>
  </div>
</div>
<div style="text-align:center;padding-top: 25%">
Copyright © 2014-2018 Milo个人博客 版权所有
</div>
<script src="${pageContext.request.contextPath}/static/admin/js/bootstrap.min.js"></script> 
<script>
$('[data-toggle="tooltip"]').tooltip();
window.oncontextmenu = function(){
	//return false;
};
$('.siteIcon img').click(function(){
	window.location.reload();
});
$('#signinSubmit').click(function(){
	if($('#userName').val() === ''){
		$(this).text('用户名不能为空');
	}else if($('#userPwd').val() === ''){
		$(this).text('密码不能为空');
	}else{
		$(this).text('请稍后...');
	}
});
</script>
</body>
</html>