<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">CHI TIẾT THÔNG TIN PHIẾU NHẬP</h3>
	<c:if test="${chiTietPhieuNhapItem ne null}">
		<form class="form-horizontal" id="sample-form" action="" method="post">
			<div class="form-group has-success"  >
				<label for="inputWarning" class="col-xs-6 col-sm-4 control-label no-padding-right">Mã sản phẩm: ${chiTietPhieuNhapItem.idSanPham}</label>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-4 control-label no-padding-right">Số lượng: ${chiTietPhieuNhapItem.soLuong}</label>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-4 control-label no-padding-right">Thành tiền: ${chiTietPhieuNhapItem.thanhTien}</label>
			</div>

			<div class="clearfix form-actions" style="text-align: center;">
				<div class="card-footer">
					<a type="cancer" class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/phieunhap/index"> <i class="fa fa-ban"></i> EXIT
					</a>
				</div>
			</div>
		</form>
	</c:if>
</div>
	