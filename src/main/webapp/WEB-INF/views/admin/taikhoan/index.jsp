<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/taikhoan" />
<div class="row">
	<ul class="nav nav-tabs tab-setting" style="padding-left: 20px;">
		<li role=""><a href="${pageContext.request.contextPath}/admin/nhanvien/index"><i class="fa fa-user"></i> Nhân viên</a></li>
		<li role=""><a href="${contextPath}/index"><i class="fa fa-truck"></i> Tài khoản</a></li>
	</ul>
	<div class="col-xs-12">

		<div>
			<div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
				<div class="row">
					<div class="col-md-6">
						<a href="${contextPath}/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm tài khoản</a> &nbsp;
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
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending">Mã tài khoản</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Tài khoản</th>
							<th class="hidden-480 sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Clicks: activate to sort column ascending">Mật khẩu</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Update: activate to sort column ascending"><i
								class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>Phân quyền</th>
							<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${not empty listTaiKhoan}">
							<c:forEach items="${listTaiKhoan}" var="tk">
								<c:set var="urlEdit" value="${contextPath}/edit/${tk.id}" />
								<c:set var="urlDel" value="${contextPath}/del/${tk.id}" />
								<tr role="row" class="odd">
									<td class="center"><label class="pos-rel"> <input type="checkbox" class="ace"> <span class="lbl"></span>
									</label></td>

									<td>${tk.id}</td>
									<td>${tk.taiKhoan}</td>
									<td>${tk.matKhau}</td>
									<td>${tk.phanQuyen}</td>

									<td>
										<div class="hidden-sm hidden-xs action-buttons">
											<a class="green" href="${urlEdit}"> <i class="ace-icon fa fa-pencil bigger-130"></i>
											</a> <a class="red" href="${urlDel}"> <i class="ace-icon fa fa-trash-o bigger-130"></i>
											</a>
										</div>

										<div class="hidden-md hidden-lg">
											<div class="inline pos-rel">
												<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
													<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
												</button>

												<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
													<li><a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View"> <span class="blue"> <i class="ace-icon fa fa-search-plus bigger-120"></i>
														</span>
													</a></li>

													<li><a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit"> <span class="green"> <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a></li>

													<li><a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete"> <span class="red"> <i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a></li>
												</ul>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div class="row">
					<div class="col-xs-6">
						<div class="dataTables_info" id="dynamic-table_info" role="status" aria-live="polite">Showing 1 to 10 of 23 entries</div>
					</div>
					<div class="col-xs-6">
						<div class="dataTables_paginate paging_simple_numbers" id="dynamic-table_paginate">
							<ul class="pagination">
								<li class="paginate_button previous disabled" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_previous"><a href="#">Previous</a></li>
								<li class="paginate_button active" aria-controls="dynamic-table" tabindex="0"><a href="#">1</a></li>
								<li class="paginate_button " aria-controls="dynamic-table" tabindex="0"><a href="#">2</a></li>
								<li class="paginate_button " aria-controls="dynamic-table" tabindex="0"><a href="#">3</a></li>
								<li class="paginate_button next" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_next"><a href="#">Next</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>