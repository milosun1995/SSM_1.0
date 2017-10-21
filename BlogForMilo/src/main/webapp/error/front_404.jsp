<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<% response.setStatus(HttpServletResponse.SC_OK);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>404</title>
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

<body>
<div class="middle-box text-center animated fadeInDown" >
    <h1>404</h1>
    <h3 > 页面未能够找到！! !</h3>
    <div >
        抱歉，页面好像去火星啦！
        <form class="form-inline m-t" role="form" action="http://www.baidu.com/s" method="get">
            <div class="form-group">
                <input type="text" id="search-input" name="wd"  class="form-control" placeholder="请输入你需要查找的内容..." />
            </div>
            <button type="submit" class=" btn btn-primary">搜索</button>
            <br>
            <a href="${pageContext.request.contextPath}/login.do">返回登录页</a> <a href="javascript:history.go(-1);" style="margin-left:50px;">返回上一层</a>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/admin/js/bootstrap.min.js"></script> 
</body>
</html>