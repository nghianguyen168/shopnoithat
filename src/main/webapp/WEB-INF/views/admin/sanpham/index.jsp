<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/sanpham" />
<div class="row">
	<ul class="nav nav-tabs tab-setting" style="padding-left: 20px;">
		<li  ><a href="${contextPath}/index"><i class="fa fa-user"></i> Sản phẩm</a></li>
		<li  ><a href="${pageContext.request.contextPath}/admin/danhmucsanpham/index"><i class="fa fa-truck"></i> Loại sản phẩm</a></li>
	</ul>
	<div class="col-xs-12">
		<div>
			<div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
				<div class="row">
					<div class="col-md-6">
						<a href="${contextPath}/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm sản phẩm</a> &nbsp;
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
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending">Mã sản phẩm</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Tên sản phẩm</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Update: activate to sort column ascending"><i
								class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i> Đơn vị tính</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Số lượng tồn</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">ID danh mục sản phẩm</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">ID nhà cung cấp</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Thuế</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Giá gốc</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Giá khuyến mãi</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Hình ảnh</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Sao</th>
							<th class="hidden-480 sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Clicks: activate to sort column ascending">Mô tả sản phẩm</th>
							<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${not empty listSanPham}">
							<c:forEach items="${listSanPham}" var="sp">
								<c:set var="urlEdit" value="${contextPath}/edit/${sp.id}" />
								<c:set var="urlDel" value="${contextPath}/del/${sp.id}" />
								<tr role="row" class="odd">
									<td class="center"><label class="pos-rel"> <input type="checkbox" class="ace"> <span class="lbl"></span>
									</label></td>

									<td>${sp.id}</td>
									<td>${sp.tenSanPham}</td>
									<td>${sp.donViTinh}</td>
									<td>${sp.soLuongTon}</td>
									<td>${sp.danhMucSanPham.tenDanhMuc}</td>
									<td>${sp.nhaCungCap.tenNCC}</td>
									<td>${sp.thue}</td>
									<td>${sp.giaGoc}</td>
									<td>${sp.giaKhuyenMai}</td>
									<td><img width="100px" height="70px" src="${pageContext.request.contextPath}/images/${sp.hinhAnh}" /></td>
									<td>${sp.sao}%</td>
									<td>${sp.moTaSanPham}</td>

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


				<nav class="text-center" aria-label="..	.">
					<ul class="pagination">
						<c:choose>
							<c:when test="${page >=1 }">
								<li disabled="disabled" class=""><a href="${contextPath}/index/1" aria-label="Previous"><span aria-hidden="">«</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="${contextPath}/index/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
							</c:otherwise>
						</c:choose>
						<c:set var="active" value="active" />
						<c:forEach begin="1" end="${totalPage}" var="i">
							<li class="<c:if test="${i eq currentPage }">active</c:if>"><a href="${contextPath}/index/${i}">${i} <span class="sr-only">(current)</span></a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${page<totalPage }">
								<li class=""><a href="${contextPath}/index/${page+1}" aria-label="Next"><span aria-hidden="">»</span></a></li>
							</c:when>
							<c:otherwise>
								<li class=""><a href="${contextPath}/index/${totalPage}" aria-label="Previous"><span aria-hidden="true">»</span></a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>

