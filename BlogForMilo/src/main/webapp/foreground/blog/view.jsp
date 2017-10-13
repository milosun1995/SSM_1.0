<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	function loadimage(){
		document.getElementById("randImage").src="${pageContext.request.contextPath}/image.jsp?"+Math.random();
	}
	function submitData(){
		var content=$("#content").val();
		var imageCode=$("#imageCode").val();
		if(content==null || content==''){
			alert("请输入评论内容！");
		}else if(imageCode==null || imageCode==''){
			alert("请填写验证码！");
		}else{
			$.post("${pageContext.request.contextPath}/comment/save.do",{'content':content,'imageCode':imageCode,'blog.id':'${blog.id}'},function(result){
				if(result.success){
					window.location.reload();
					alert("评论已提交成功，审核通过后显示！");
				}else{
					alert(result.errorInfo);
				}
			},"json");
		}
	}
	
	function showOtherComment(){
		$('.otherComment').show();
	}
</script>
<!-- article - detail -->
<div class="row w_main_row">
	<div class="col-lg-9 col-md-9 w_main_left">
		<div class="panel panel-default  mb-20">
			<div class="panel-body pt-10 pb-10">
				<h2 class="c_titile">${blog.title }</h2>
				 <div style="padding-bottom: 20px;padding-top: 10px;text-align: center;">
					<div class="bshare-custom"><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count">0</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=1&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
	   			 </div>
				<p class="box_c">
					<span class="d_time">『 <fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>』&nbsp;&nbsp;博客类别：${blog.blogType.typeName}&nbsp;&nbsp; </span>
					<span>编辑：<a href="mailto:18838980210@163.com">Milo</a></span>
					<span>阅读(${blog.clickHit})</span>
					<span>评论(${blog.replyHit})</span>
				</p>
				<ul class="infos">
				<li>
					<p>&nbsp;</p>
					"${blog.content }"					
					<p>&nbsp;</p>
					<p align="center" class="pageLink"></p>
				</li>
				</ul>
				
				<div class="keybq">
					<p>
						<span>关键字</span>：
						<c:choose>
							<c:when test="${keyWords==null}">
								&nbsp;&nbsp;无
							</c:when>
							<c:otherwise>
								<c:forEach var="keyWord" items="${keyWords }">
									<a class="label label-default" href="${pageContext.request.contextPath}/blog/q.html?q=${keyWord}" target="_blank">${keyWord }</a>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
				<div class="nextinfo">
					${pageCode }
				</div>
			</div>
		</div>

		<div class="panel panel-default  mb-20">
			<div class="tab-category">
				<a href=""><strong>评论区</strong></a>
			</div>
			<div class="panel-body">
				<div class="panel-body" style="margin: 0 3%;">
					<div class="mb-20">
						<ul class="commentList">
                            <li class="item cl">
							<img src="${pageContext.request.contextPath}/static/images/comment_icon.png"/>
							评论信息    
							<c:if test="${commentList.size()>10}">
								<a href="javascript:showOtherComment()" style="float: right;padding-right: 40px;">显示所有评论</a>
							</c:if>
							</li>
							<c:choose>
								<c:when test="${commentList.size()==0}">
									 <li class="item cl">暂无评论</li>
								</c:when>
								<c:otherwise>
									<c:forEach var="comment" items="${commentList }" varStatus="status">
											<c:choose>
												<c:when test="${status.index<10 }">
												 <li class="item cl">
												 	<a href="#"><i class="avatar size-L radius"><img alt="" src="http://qzapp.qlogo.cn/qzapp/101388738/1CF8425D24660DB8C3EBB76C03D95F35/100"></i></a><br>
												 	<span>${status.index+1 }楼</span>
												    	<div class="comment-main">
                                   							<header class="comment-header">
                                        						<div class="comment-meta"><a class="comment-author" href="#"><b style="font-size:large; ">${comment.userIp }</b>:</a><br>
                                           								 <i><time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20" >[&nbsp;<fmt:formatDate value="${comment.commentDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>&nbsp;]</time></i>
                                        						</div>
                                						    </header>
						                                    <div class="comment-body">
						                                        <p>${comment.content }</p>
						                                    </div>
						                                </div>
													</li>		
												</c:when>
												<c:otherwise>
												<div class="otherComment">
													 <li class="item cl">
													 	<a href="#"><i class="avatar size-L radius"><img alt="" src="http://qzapp.qlogo.cn/qzapp/101388738/1CF8425D24660DB8C3EBB76C03D95F35/100"></i></a><br>
													 	<span>${status.index+1 }楼</span>
													    	<div class="comment-main">
	                                   							<header class="comment-header">
	                                        						<div class="comment-meta"><a class="comment-author" href="#"><b style="font-size:large; ">${comment.userIp }</b>说道:</a><br/>
	                                           								 <i><time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20" style="">[&nbsp;<fmt:formatDate value="${comment.commentDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>&nbsp;]</time></i>
	                                        						</div>
	                                						    </header>
							                                    <div class="comment-body">
							                                        <p>${comment.content }</p>
							                                    </div>
							                                </div>
													 </li>
												</div>	
												</c:otherwise>
											</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<div class="line"></div>
						<!--用于评论-->
					<div class="data_list" >
						<div class="data_list_title">
							<img src="${pageContext.request.contextPath}/static/images/publish_comment_icon.png"/>
							发表评论
						</div>
						<div class="publish_comment">
							<div>
								<textarea class="textarea" style="width: 100%" rows="5" id="content" name="content" placeholder="来说两句吧..."></textarea>
							</div>
							<br>
							<div class="form-group">
								<div class="control-label">验证码：</div>
								<div class="">
									<input class="input-text" type="text" value="${imageCode }" name="imageCode"  id="imageCode" onkeydown= "if(event.keyCode==13)form1.submit()"/>
								</div>
								<div class="">
									<img onclick="javascript:loadimage();" class="control-label" title="换一张试试" name="randImage" id="randImage" src="${pageContext.request.contextPath}/image.jsp" width="60" height="20" border="1" align="absmiddle">
								</div>
								<div class="col-sm-1"></div>
							</div>
							<div class="publishButton">
									<button class="btn btn-primary" type="button" onclick="submitData()">发表评论</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-3 col-md-3">
		<!--热门推荐-->
		<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>热门推荐</strong></a>
			</div>
			<div class="tab-category-item">
				<ul class="index_recd">
					<c:forEach var="blog" items="${blogClickHitList }">
					<li><span><a href="${pageContext.request.contextPath}/blog/articles/${blog.id}.html">${blog.title }(${blog.clickHit })</a></span></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<!--图片-->
		<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>扫我关注</strong></a>
			</div>
			<div class="tab-category-item">
				<img data-original="http://a2.qpic.cn/psb?/V14Pp6h83A9Qyt/ACb1RJ6CMMDuZid1ZdmzRsOcb1zRwU2hIjPPVFbxb58!/b/dGkBAAAAAAAA&ek=1&kp=1&pt=0&bo=MgE0AQAAAAADFzQ!&vuin=1248497033&tm=1505304000&sce=60-2-2&rf=viewer_4" class="img-responsive lazyload"
					alt="响应式图片">
			</div>
		</div>

	</div>
</div>
