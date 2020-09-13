<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="page-header">
	<h1>
		Quán lý Banner 
	</h1>
</div>
<div class="col-md-6">
						<a href="/doan/admin/banner/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm banner</a> &nbsp;
					<br>
					</div>
<div class="row">
	<div class="col-xs-12">
	
	<c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
				</c:if>
		<table id="simple-table" class="table  table-bordered table-hover">
			<thead>
				<tr>
					
					<th>ID</th>
					<th>Tiêu đề ngắn</th>
					<th class="hidden-480">Tiêu đề dài</th>
					<th>Hình ảnh</th>
					<th class="hidden-480">Status</th>

					<th></th>
				</tr>
			</thead>

			<tbody>
			<c:if test="${bannerList ne null }">
				<c:forEach items="${bannerList }" var="ban">
			
				<tr>
					<td>${ban.id }</td>
					<td>${ban.small_title }</td>
					<td class="hidden-480">${ban.big_title }</td>
						<td><img width="100px" height="70px" src="${pageContext.request.contextPath}/images/${ban.picture}" /></td>
					<td>
							<div class="hidden-sm hidden-xs action-buttons">
											<a class="green" href="/doan/admin/banner/edit/${ban.id }"> <i class="ace-icon fa fa-pencil bigger-130"></i>
											</a> 
											<a class="red" onclick="return confirm('Bạn có chắc chắn muốn xóa?');" href="/doan/admin/banner/del/${ban.id }"> <i class="ace-icon fa fa-trash-o bigger-130"></i>
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
	</div>
	<!-- /.span -->
</div>