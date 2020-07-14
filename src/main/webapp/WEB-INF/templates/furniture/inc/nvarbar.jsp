<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<nav>
	<div class="container">
		<div class="nav-inner">

			<a class="logo-small" title="Magento Commerce" href="index.html"><img alt="Magento Commerce" src="${pageContext.request.contextPath}/resources/furniture/images/logo-small.png"></a>
			<ul id="nav" class="hidden-xs">
				<li class="level0 parent drop-menu"><a href="index.html" class="active"><span>Trang chủ</span> </a></li>
				<c:if test="${listDanhMuc ne null }">
					<c:forEach items="${listDanhMuc }" var="danhmuc">
						<li class="level0 nav-7 level-top parent"><a href="${pageContext.request.contextPath }/furniture/cat/${danhmuc.id}" class="level-top"> <span>${danhmuc.tenDanhMuc }</span></a></li>
					</c:forEach>
				</c:if>
			
				
				<li class="level0 parent drop-menu"><a href="blog.html"><span>Khuyến mãi</span> </a></li>
				<li class="nav-custom-link level0 level-top parent"><a class="level-top" href="${pageContext.request.contextPath}/furniture/lienhe/index"><span>Liên hệ</span></a></li>
			</ul>
		</div>
	</div>
</nav>