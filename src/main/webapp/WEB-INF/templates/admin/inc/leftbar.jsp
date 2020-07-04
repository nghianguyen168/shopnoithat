<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin" />
<div id="sidebar" class="sidebar responsive ace-save-state" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true">
	<script type="text/javascript">
		try {
			ace.settings.loadState('sidebar')
		} catch (e) {
		}
	</script>


	<ul class="nav nav-list" style="top: 0px;">
		<li class=""><a href="${contextPath}/index"> <i class="menu-icon fa fa-tachometer"></i> <span class="menu-text"> Dashboard </span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/sanpham/index"> <i class="fa fa-barcode"></i> <span class="menu-text">Quản lý SP & DM</span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/nhacungcap/index"> <i class="fa fa-users"></i> <span class="menu-text">Quản lý KH & NCC</span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/nhanvien/index"> <i class="fa fa-user"></i> <span class="menu-text">Quản lý NV & TK</span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/kho/index"> <i class="fa fa-truck"></i> <span class="menu-text">Quản lý kho</span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/phieuxuat/index"> <i class="fa fa-file-text"></i> <span class="menu-text">Quản lý PN & PX</span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/donhang/index"> <i class="fa fa-shopping-cart"></i> <span class="menu-text">Quản lý đơn hàng</span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/donvi/index"> <i class="fa fa-usd"></i> <span class="menu-text">Quản lý đơn vị</span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/khuyenmai/index"> <i class="fa fa-signal"></i> <span class="menu-text">Quản lý KM & DKM</span>
		</a> <b class="arrow"></b></li>
		<li class=""><a href="${contextPath}/hinhthuctt/index"> <i class="fa fa-cogs"></i> <span class="menu-text">Quản lý hình thức TT</span>
		</a> <b class="arrow"></b></li>


	</ul>
	<!-- /.nav-list -->

	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
</div>
