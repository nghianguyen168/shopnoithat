<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/nhacungcap" />
<div class="row">
	<ul class="nav nav-tabs tab-setting" style="padding-left: 20px;">
		<li role=""><a href="${pageContext.request.contextPath}/admin/khachhang/index"><i class="fa fa-user"></i> Khách hàng</a></li>
		<li role=""><a href="${contextPath}/index"><i class="fa fa-truck"></i> Nhà cung cấp</a></li>
	</ul>
	<div class="col-xs-12">
		<div>
			<div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
				<div class="row">
					<div class="col-md-6">
						<a href="${contextPath}/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm nhà cung cấp</a> &nbsp;
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
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending">Mã nhà cung cấp</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Tên nhà cung cấp</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Địa chỉ</th>
							<th class="sorting" tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending">Số điện thoại</th>
							<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${not empty listNCC}">
							<c:forEach items="${listNCC}" var="ncc">
								<c:set var="urlEdit" value="${contextPath}/edit/${ncc.id}" />
								<c:set var="urlDel" value="${contextPath}/del/${ncc.id}" />
								<tr role="row" class="odd">
									<td class="center"><label class="pos-rel"> <input type="checkbox" class="ace"> <span class="lbl"></span>
									</label></td>

									<td>${ncc.id}</td>
									<td>${ncc.tenNCC}</td>
									<td>${ncc.diaChiNCC}</td>
									<td>${ncc.sdtNCC}</td>


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