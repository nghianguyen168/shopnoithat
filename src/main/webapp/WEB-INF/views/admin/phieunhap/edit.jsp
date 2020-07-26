<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/phieunhap" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">SỬA THÔNG TIN PHIẾU NHẬP</h3>
	<c:if test="${phieuNhapItem ne null}">
		<form class="form-horizontal" id="sample-form" action="${contextPath}/editPN/${phieuNhapItem.id}" method="post">

			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Ngày in hóa đơn:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="date" id="inputWarning" name="ngayInHoaDon" class="width-100" value="${phieuNhapItem.ngayInHoaDon }">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mã nhà cung cấp:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="idNhaCungCap" class="width-100" value="${phieuNhapItem.idNhaCungCap}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Địa chỉ :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="diaChi" class="width-100" value="${phieuNhapItem.diaChi}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Người giao :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="nguoiGiao" class="width-100" value="${phieuNhapItem.nguoiGiao}">
					</span>
				</div>
			</div>
						<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mã kho :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="idKho" class="width-100" value="${phieuNhapItem.idKho}">
					</span>
				</div>
			</div>
						<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Chú thích :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="chuThich" class="width-100" value="${phieuNhapItem.chuThich}">
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
