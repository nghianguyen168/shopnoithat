
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/banner" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">THÊM BANNER</h3>
	<form action="${contextPath}/add" method="post" class="form-horizontal" id="sample-form" enctype="multipart/form-data">
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tiêu đề nhỏ :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="small_title" class="width-100" required>
				</span>
			</div>
		</div>
		
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tiêu đề lớn :</label>
			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="big_title" class="width-100" required>
				</span>
			</div>
		</div>
		
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Hình ảnh :</label>

			<div class="col-xs-12 col-sm-5">
				<input type="file" name=ha class="width-100" required>

			</div>
		</div>
		<div class="clearfix form-actions" style="text-align: center;">
			<div class="card-footer">
				<button type="submit" class="btn btn-primary btn-sm">
					<i class="fa fa-dot-circle-o"></i> Add
				</button>
				<button type="reset" class="btn btn-danger btn-sm">
					<i class="fa fa-ban"></i> Reset
				</button>
				<a type="cancer" class="btn btn-danger btn-sm" href="${contextPath}/index"> <i class="fa fa-ban"></i> Hủy
				</a>
			</div>
		</div>
	</form>
</div>

