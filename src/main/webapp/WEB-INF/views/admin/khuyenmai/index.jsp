<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/khuyenmai" />
<div class="row">
	<ul class="nav nav-tabs tab-setting" style="padding-left: 20px;">
		<li role=""><a href="${contextPath}/index"><i class="fa fa-user"></i> Khuyến mãi</a></li>
		<li role=""><a href="${pageContext.request.contextPath}/admin/dotkhuyenmai/index"><i class="fa fa-truck"></i> Đợt khuyến mãi</a></li>
	</ul>
	<div class="col-xs-12">
		<div>
			<div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
				<div class="row">
					<div class="col-md-6">
						<a href="${contextPath}/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm khuyến mãi</a> &nbsp;
					</div>

					<div class="col-xs-6">
						<div id="dynamic-table_filter" class="dataTables_filter">
							<label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="dynamic-table"></label>
						</div>
					</div>
				</div>
				<c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
				</c:if>
				<table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="dynamic-table_info">
					<thead>
						<tr role="row">
							<th class="center sorting_disabled" rowspan="1" colspan="1" aria-label=""><label class="pos-rel"> <input type="checkbox" class="ace"> <span class="lbl"></span>
							</label></th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending">Mã khuyến mãi</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Tên sản phẩm</th>
							<th class="hidden-480 sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Clicks: activate to sort column ascending">Đợt khuyễn mãi</th>
							<th class="hidden-480 sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Clicks: activate to sort column ascending">Hình thức</th>
							<th class="hidden-480 sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Clicks: activate to sort column ascending">Tỉ lệ</th>
							<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${not empty listKM}">
							<c:forEach items="${listKM}" var="km">
								<c:set var="urlEdit" value="${contextPath}/edit/${km.id}" />
								<c:set var="urlDel" value="${contextPath}/del/${km.id}" />
								<tr role="row" class="odd">
									<td class="center"><label class="pos-rel"> <input type="checkbox" class="ace"> <span class="lbl"></span>
									</label></td>

									<td>${km.id}</td>
									<td>${km.sanPham.tenSanPham}</td>
									<td>${km.dotKhuyenMai.tenKhuyenMai}</td>
									<td>${km.hinhThuc}</td>
									<td>${km.tiLe}</td>

									<td>
										<div class="hidden-sm hidden-xs action-buttons">
											<a class="green" href="${urlEdit}"> <i class="ace-icon fa fa-pencil bigger-130"></i>
											</a> <a class="red" href="${urlDel}"> <i class="ace-icon fa fa-trash-o bigger-130"></i>
											</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>