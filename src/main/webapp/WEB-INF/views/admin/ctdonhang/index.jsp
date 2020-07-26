<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">CHI TIẾT THÔNG TIN ĐƠN HÀNG</h3>
	<c:if test="${chiTietDonHangItem ne null}">
		<form class="form-horizontal" id="sample-form" action="" method="post">
			<div class="form-group has-success"  >
				<label for="inputWarning" class="col-xs-6 col-sm-4 control-label no-padding-right">Mã đơn hàng: ${chiTietDonHangItem.id}</label>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-4 control-label no-padding-right">Mã: ${chiTietDonHangItem.ma}</label>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-4 control-label no-padding-right">Mã sản phẩm: ${chiTietDonHangItem.sanPham.tenSanPham}</label>
			</div>
				<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-4 control-label no-padding-right">Số lượng: ${chiTietDonHangItem.soLuong}</label>
			</div>
				<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-4 control-label no-padding-right">Thành tiền: ${chiTietDonHangItem.tongTien}</label>
			</div>
				<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-4 control-label no-padding-right">Trạng thái: ${chiTietDonHangItem.trangThai}</label>
			</div>

			<div class="clearfix form-actions" style="text-align: center;">
				<div class="card-footer">
					<a type="cancer" class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/donhang/index"> <i class="fa fa-ban"></i> EXIT
					</a>
				</div>
			</div>
		</form>
	</c:if>
</div>
		