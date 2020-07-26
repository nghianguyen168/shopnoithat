<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/nhacungcap" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">THÊM NHÀ SẢN XUẤT</h3>
	<c:if test="${not empty msg}">
		<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
			<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
		</div>
	</c:if>
	<form action="${contextPath}/add" method="post" class="form-horizontal" id="sample-form">
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên nhà cung cấp :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="tenNCC" class="width-100">
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Địa chỉ:</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="diaChiNCC" class="width-100">
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Số điện thoại :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="sdtNCC" class="width-100">
				</span>
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