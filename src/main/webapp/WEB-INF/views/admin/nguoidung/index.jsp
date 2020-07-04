<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/nguoidung" />
<div class="row">

	<div class="col-xs-12">

		<a href="${contextPath}/add" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">+ Thêm sản phẩm</a>
		<!-- div.table-responsive -->

		<!-- div.dataTables_borderWrap -->
		<div>
			<div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
				<div class="row">
					<div class="col-xs-6">
						<div class="dataTables_length" id="dynamic-table_length">
							<label>Display <select name="dynamic-table_length" aria-controls="dynamic-table" class="form-control input-sm"><option value="10">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="100">100</option></select> records
							</label>
						</div>
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
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending">Mã người dùng</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Họ lót</th>
							<th class="hidden-480 sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Clicks: activate to sort column ascending">Tên</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Update: activate to sort column ascending"><i
								class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>Giới tính</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Địa chỉ</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Số điện thoại</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Ngày sinh</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Email</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Tài khoản</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Mật khẩu</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Ảnh đại diện</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Lương</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Trạng thái</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Vai trò</th>
							<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${not empty listNguoiDung}">
							<c:forEach items="${listNguoiDung}" var="nd">
								<c:set var="urlEdit" value="${contextPath}/edit/${nd.maND}" />
								<c:set var="urlDel" value="${contextPath}/del/${nd.maND}" />
								<tr role="row" class="odd">
									<td class="center"><label class="pos-rel"> <input type="checkbox" class="ace"> <span class="lbl"></span>
									</label></td>

									<td>${nd.maND}</td>
									<td>${nd.hoLot}</td>
									<td>${nd.ten}</td>
									<td>${nd.gioiTinh}</td>
									<td>${nd.diaChi}</td>
									<td>${nd.sdt}</td>
									<td>${nd.ngaySinh}</td>
									<td>${nd.email}</td>
									<td>${nd.taiKhoan}</td>
									<td>${nd.matKhau}</td>
									<td>${nd.anhDaiDien}</td>
									<td>${nd.luong}</td>
									<td>${nd.trangThai}</td>
									<td>${nd.maVT}</td>

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