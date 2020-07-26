<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/taikhoan" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">SỬA THÔNG TIN TÀI KHOẢN</h3>
	<c:if test="${taiKhoanItem ne null}">
		<form class="form-horizontal" id="sample-form" action="${contextPath}/editTK/${taiKhoanItem.id}" method="post">

			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên khách hàng:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="taiKhoan" class="width-100" value="${taiKhoanItem.taiKhoan }">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mật khẩu:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="matKhau" class="width-100" value="${taiKhoanItem.matKhau}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Phân quyền :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="phanQuyen" class="width-100" value="${taiKhoanItem.phanQuyen}">
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
	</c:if>
</div>
