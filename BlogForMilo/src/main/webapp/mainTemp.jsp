<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="utf-8">
<title>Milo个人博客 — 一个站在java开发之路上的草根程序员个人博客网站</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<!-- <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" /> -->
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="keywords" content="个人博客,Milo个人博客,个人博客系统,Milo博客,Milo">
<meta name="description" content="Milo博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
<link rel="Shortcut Icon" href="favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="/staticRes/js/html5shiv.js"></script>
<script type="text/javascript" src="/staticRes/js/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet"  href="${pageContext.request.contextPath}/static/plugin/h-ui/css/H-ui.min.css" />
<link rel="stylesheet"  href="${pageContext.request.contextPath}/static/css/blog/blog.css" />
<link rel="stylesheet"  href="${pageContext.request.contextPath}/static/plugin/Hui-iconfont/1.0.8/iconfont.min.css" />
<link rel="stylesheet"  href="${pageContext.request.contextPath}/static/css/common.css" />
<link rel="stylesheet"  href="${pageContext.request.contextPath}/static/plugin/pifu/pifu.css" />
<link rel="stylesheet"  href="${pageContext.request.contextPath}/static/css/timeline.css" />
<!--[if lt IE 9]>
<link href="/staticRes/lib/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } function showSide(){$('.navbar-nav').toggle();}</script>
</head>
<body style="margin-top: 0px;">
<jsp:include page="/foreground/common/head.jsp"/>
<section class="container pt-20">
	<jsp:include page="${mainPage }"></jsp:include>
</section>
<jsp:include page="/foreground/common/foot.jsp"/>
${mainPage }
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/layer/3.0/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/pifu/pifu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
<script> $(function(){ $(window).on("scroll",backToTopFun); backToTopFun(); }); </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>

<script>
$(function(){
//幻灯片
jQuery(".slider_main .slider").slide({mainCell: ".bd ul", titCell: ".hd li", trigger: "mouseover", effect: "leftLoop", autoPlay: true, delayTime: 700, interTime: 2000, pnLoop: true, titOnClassName: "active"})
//tips
jQuery(".slideTxtBox").slide({titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "top", autoPlay: true});
//标签
	$(".tags a").each(function(){
		var x = 9;
		var y = 0;
		var rand = parseInt(Math.random() * (x - y + 1) + y);
		$(this).addClass("tags"+rand)
	});
	
	$("img.lazyload").lazyload({failurelimit : 3});
});
</script> 
</html>
