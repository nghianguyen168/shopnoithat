<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/donhang" />
<div class="row">

	<div class="col-xs-12">

		<div>
			<div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
				<div class="row">
					<div class="col-xs-12">
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
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending">Mã đơn hàng</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Tên khách hàng</th>
							<th class="hidden-480 sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Clicks: activate to sort column ascending">Tổng</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Ngày đặt</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Số điện thoại</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Email</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Địa chỉ</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Hình thức TT</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Trạng thái đơn hàng</th>
							<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${not empty listDonHang}">
							<c:forEach items="${listDonHang}" var="dh">
								<c:set var="urlEdit" value="${contextPath}/edit/${dh.id}" />
								<c:set var="urlDel" value="${contextPath}/del/${dh.id}" />
								<c:set var="detail" value="${pageContext.request.contextPath}/admin/ctdonhang/detail/${dh.id}" />
								<tr role="row" class="odd">
									<td class="center"><label class="pos-rel"> <input type="checkbox" class="ace"> <span class="lbl"></span>
									</label></td>

									<td>${dh.id}</td>
									<td>${dh.khachHang.hoTen}</td>
									<td>${dh.tong}</td>
									<fmt:formatDate value="${dh.ngayDat }" pattern="dd-MM-yyyy" var="ngaydat"/>
									<td>${ngaydat}</td>
									<td>${dh.sdtNguoiMua}</td>
									<td>${dh.emailNguoiMua}</td>
									<td>${dh.diaChiNguoiMua}</td>
									<td>${dh.hinhThucThanhToan.hinhThucTT}</td>
									<td>${dh.trangThaiDonHang}</td>

									<td>
										<div class="hidden-sm hidden-xs action-buttons">
											<a href="${detail}"><i class="ace-icon fa fa-search-plus bigger-130"></i></a> <a class="green" href="${urlEdit}"> <i class="ace-icon fa fa-pencil bigger-130"></i>
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