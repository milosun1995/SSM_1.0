<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-9 col-md-9 row">
	<!-- left -->
	<!--滚动图-->
	<div class="slider_main">
		<div class="slider">
			<div class="bd">
				<ul>
					<li><a href="#" target="_blank"><img
							src="${pageContext.request.contextPath}/static/img/temp/banner1.jpg"></a></li>
					<li><a href="#" target="_blank"><img
							src="${pageContext.request.contextPath}/static/img/temp/banner8.png"></a></li>
				</ul>
			</div>
			<ol class="hd cl dots">
				<li>1</li>
				<li>2</li>
			</ol>
			<a class="slider-arrow prev" href="javascript:void(0)"></a> <a
				class="slider-arrow next" href="javascript:void(0)"></a>
		</div>
	</div>
	
	<div class="mt-20 bg-fff box-shadow radius mb-5">
		<div class="tab-category">
			<a href=""><strong class="current">最新发布</strong></a>
		</div>
	</div>
	<div class="art_content">
		<ul class="index_arc">
		<c:forEach var="blog" items="${blogList}">
			<li class="index_arc_item">
				<a href="javascript:void(0)" class="pic"><img class="lazyload" data-original="${blog.titlePic }" alt="Milo Blog" /></a>
				<h4 class="title">
					<a href="${pageContext.request.contextPath}/blog/articles/${blog.id}.html"><b>${blog.title }</b></a>
				</h4>
				<div class="date_hits">
					<span>Milo</span> <span>
					<fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm" /></span> 
					<p class="hits"><i class="Hui-iconfont" title="点击量">&#xe6c1;</i> (${blog.clickHit})°</p>
					<p class="commonts"><i class="Hui-iconfont" title="评论量">&#xe622;</i> <span class="cy_cmt_count">(${blog.replyHit})</span></p>
				</div>
				<div class="desc">${blog.summary }...</div>
				</li>
			 </c:forEach>
		</ul>
	</div>
		<nav class="nav_page">
	 	 <ul class="pagination">
	 	  ${pageCode }
		  </ul>
		</nav>
</div>

<!--right-->
  <div class="col-sm-3 col-md-3">
  	<!--站点声明-->
        <div class="panel panel-default mb-30">
            <div class="panel-body">
                <i class="Hui-iconfont" style="float: left;">&#xe62f;&nbsp;</i>
                <div class="slideTxtBox">
                    <div class="bd">
                        <ul>
                            <li><a href="javascript:void(0);">Milo博客测试版上线，欢迎访问</a></li>
                            <li><a href="javascript:void(0);">内容如有侵犯，请立即联系管理员删除</a></li>
                            <li><a href="javascript:void(0);">本站内容仅供学习和参阅，不做任何商业用途</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  		<!--博主信息-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>博主信息</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd">
                	<li class="index_recd_item"><img src="${pageContext.request.contextPath}/static/userImages/${blogger.imageName }" alt="" width="200" height="354"></li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe653;</i>姓名：${blogger.nickName }</li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe70d;</i>职业：${blogger.profession }</li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe63b;</i>邮箱：<a href="mailto:${blogger.email!=null?blogger.email:'javascript:void(0)'}">${blogger.email}</a></li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe671;</i>定位：${blogger.address }</li>
                </ul>
            </div>
        </div>
  	
  		<!--日志类别-->
  		<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>日志类别</strong></a>
			</div>
			<div class="tab-category-item">
				<ul class="index_recd">
					<c:forEach var="blogTypeCount" items="${blogTypeCountList }">
						<li><span><a href="${pageContext.request.contextPath}/index.html?typeId=${blogTypeCount.id }">${blogTypeCount.typeName }(${blogTypeCount.blogCount })</a></span></li>
					</c:forEach>	
				</ul>
			</div>
		</div>
		
		<!--日志日期-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>日志日期</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd clickTop">
	                <c:forEach var="blogCount" items="${blogCountList }">
						<li><span><a href="${pageContext.request.contextPath}/index.html?releaseDateStr=${blogCount.releaseDateStr }">${blogCount.releaseDateStr }(${blogCount.blogCount })</a></span></li>
					</c:forEach>
                </ul>
            </div>
        </div>
        
		<!--标签-->
		<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>标签云</strong></a>
			</div>
			<div class="tab-category-item">
				<div class="tags"> <a href="http://www.h-ui.net/">H-ui前端框架</a> <a href="http://www.h-ui.net/websafecolors.shtml">Web安全色</a> <a href="http://www.h-ui.net/Hui-4.4-Unslider.shtml">jQuery轮播插件</a> <a href="http://idc.likejianzhan.com/vhost/korea_hosting.php">韩国云虚拟主机</a> <a href="http://www.h-ui.net/bug.shtml">IEbug</a> <a href="http://www.h-ui.net/site.shtml">IT网址导航</a> <a href="http://www.h-ui.net/icon/index.shtml">网站常用小图标</a> <a href="http://www.h-ui.net/tools/jsformat.shtml">web工具箱</a> <a href="http://www.h-ui.net/bg/index.shtml">网站常用背景素材</a> <a href="http://www.h-ui.net/yuedu/chm.shtml">H-ui阅读</a> <a href="http://www.h-ui.net/easydialog-v2.0/index.html">弹出层插件</a> <a href="http://www.h-ui.net/SuperSlide2.1/demo.html">SuperSlide插件</a> <a href="http://www.h-ui.net/TouchSlide1.1/demo.html">TouchSlide</a></div>
			</div>
		</div>
		<!--图片-->
		<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>扫我关注</strong></a>
			</div>
			<div class="tab-category-item">
				<img data-original="${pageContext.request.contextPath}/static/img/wx_pic.png" class="img-responsive lazyload" alt="响应式图片">
			</div>
		</div>
		
		<!--友情链接-->
		<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>隔壁邻居</strong></a>
			</div>
			<div class="tab-category-item">
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">百度</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">淘宝</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">腾讯</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">慕课网</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="#" class="btn-link">h-ui</a></span>
			</div>
		</div>
		<!--最近访客-->
		<div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>最近访客</strong></a>
            </div>
            <div class="panel-body">
                <ul class="recent">
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                    <div class="item"><img src="${pageContext.request.contextPath}static/img/40.jpg" alt=""></div>
                </ul>
            </div>
        </div>
        
		<!--分享-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>站点分享</strong></a>
            </div>
            <div class="panel-body">
                <div class="bdsharebuttonbox Hui-share"><a href="#" class="bds_weixin Hui-iconfont" data-cmd="weixin" title="分享到微信">&#xe694;</a><a href="#" class="bds_qzone Hui-iconfont" data-cmd="qzone" title="分享到QQ空间">&#xe6c8;</a> <a href="#" class="bds_sqq Hui-iconfont" data-cmd="sqq" title="分享到QQ好友">&#xe67b;</a> <a href="#" class="bds_tsina Hui-iconfont" data-cmd="tsina" title="分享到新浪微博">&#xe6da;</a> <a href="#" class="bds_tqq Hui-iconfont" data-cmd="tqq" title="分享到腾讯微博">&#xe6d9;</a></div>
            </div>
        </div>
    </div>