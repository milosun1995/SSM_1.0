<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid">
        <div class="timeline">
        	<c:forEach var="blog" items="${blogMoodList }">
					<div class="cd-timeline-block">
					    <div class="cd-timeline-img cd-picture">
					        <img src="static/css/timeline/cd-icon-location.svg" alt="position">
					    </div>
					    <div class="cd-timeline-content">
					        <h4>${blog.title}</h4>
					        <p>${blog.summary}</p>
					        <a href="${pageContext.request.contextPath}/blog/articles/${blog.id}.html" class="f-r"><input class="btn btn-success size-S" type="button" value="更多"></a>
					        <span class="cd-date">${blog.releaseDateStr}</span>
					    </div>
					</div>
			 </c:forEach>
        </div>
    </div>