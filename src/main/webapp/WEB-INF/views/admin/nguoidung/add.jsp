<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/nguoidung" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">THÊM NGƯỜI DÙNG</h3>
		<form class="form-horizontal" id="sample-form" action="${contextPath}/add" method="post" enctype="multipart/form-data">

			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Họ lót:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="hoLot" class="width-100" >
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="ten" class="width-100" >
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Giới tính :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="gioiTinh" class="width-100" >
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Địa chỉ :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="diaChi" class="width-100" >
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Số điện thoại :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="sdt" class="width-100" >
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Ngày sinh:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="date" id="inputWarning" name="ngaySinh" class="width-100" >
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Email :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="email" id="inputWarning" name="email" class="width-100">
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tài khoản :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="taiKhoan" class="width-100">
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mật khẩu :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="matKhau" class="width-100">
					</span>
				</div>
			</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Ảnh đại diện :</label>

			<div class="col-xs-12 col-sm-5">
				<input type="file" name="anhdaidien" class="width-100">

			</div>
		</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Lương :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="luong" class="width-100">
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Trạng thái :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="trangThai" class="width-100">
					</span>
				</div>
			</div>
					<div class="form-group has-success">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Vai trò :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="maVT" class="width-100">
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