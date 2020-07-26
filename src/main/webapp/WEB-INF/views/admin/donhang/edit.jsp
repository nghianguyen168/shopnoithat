<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/donhang" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">SỬA THÔNG TIN ĐƠN HÀNG</h3>
	<c:if test="${donHangItem ne null}">
		<form class="form-horizontal" id="sample-form" action="${contextPath}/editDH/${donHangItem.id}" method="post">

			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mã khách hàng:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="idKhachHang" class="width-100" value="${donHangItem.idKhachHang}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tổng:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="tong" class="width-100" value="${donHangItem.tong}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mã:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="ma" class="width-100" value="${donHangItem.ma}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Số điện thoại:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="sdtNguoiMua" class="width-100" value="${donHangItem.sdtNguoiMua}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Email:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="emailNguoiMua" class="width-100" value="${donHangItem.emailNguoiMua}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Địa chỉ:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="diaChiNguoiMua" class="width-100" value="${donHangItem.diaChiNguoiMua}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Hình thức thanh toán :</label>
				<div class="col-xs-12 col-sm-5">
					<select id="inputWarning" name="idHinhThucTT" class="width-100">
						<c:if test="${not empty listHttt }">
							<c:forEach items="${listHttt}" var="httt">
								<c:choose>
									<c:when test="${httt.getId() == idHinhThucTT }">
										<option value="${httt.id}">${httt.hinhThucTT}</option>
									</c:when>
									<c:otherwise>
										<option selected="selected" value="${httt.id}">${httt.hinhThucTT}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Trạng thái:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="trangThaiDonHang" class="width-100" value="${donHangItem.trangThaiDonHang}">
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
