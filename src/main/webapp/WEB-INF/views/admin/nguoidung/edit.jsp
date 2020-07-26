<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/nguoidung" />
	<div class="step-pane active" data-step="1">
		<h3 class="lighter block green">SỬA SẢN PHẨM</h3>
		<c:if test="${nguoiDungItem ne null}">
			<form class="form-horizontal" id="sample-form" action="${contextPath}/editND/${nguoiDungItem.maND}" method="post" enctype="multipart/form-data">

				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Họ lót:</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="hoLot" class="width-100" value="${nguoiDungItem.hoLot }">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="ten" class="width-100" value="${nguoiDungItem.ten}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Giới tính :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="gioiTinh" class="width-100" value="${nguoiDungItem.gioiTinh}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Địa chỉ :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="diaChi" class="width-100" value="${nguoiDungItem.diaChi}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Số điện thoại :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="sdt" class="width-100" value="${nguoiDungItem.sdt}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Ngày sinh:</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="date" id="inputWarning" name="ngaySinh" class="width-100" value="${nguoiDungItem.ngaySinh}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Email :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="email" id="inputWarning" name="email" class="width-100" value="${nguoiDungItem.email}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tài khoản :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="taiKhoan" class="width-100" value="${nguoiDungItem.taiKhoan}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mật khẩu :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="matKhau" class="width-100" value="${nguoiDungItem.matKhau}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Ảnh đại diện :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="file" id="inputWarning" class="width-100" name="anhdaidien"
							src="${pageContext.request.contextPath }/images/${nguoiDungItem.anhDaiDien}"> <br /> <img alt="" src="${contextPath}/images/${nguoiDungItem.anhDaiDien}"
							style="width: 200px; height: 200px;">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Lương :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="luong" class="width-100" value="${nguoiDungItem.luong}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Trạng thái :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="trangThai" class="width-100" value="${nguoiDungItem.trangThai}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Vai trò :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="MaVT" class="width-100" value="${nguoiDungItem.maVt}">
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
