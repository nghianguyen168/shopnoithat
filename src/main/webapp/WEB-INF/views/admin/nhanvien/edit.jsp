<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/nhanvien" />
	<div class="step-pane active" data-step="1">
		<h3 class="lighter block green">SỬA NHÂN VIÊN</h3>
		<c:if test="${nhanVienItem ne null}">
			<form class="form-horizontal" id="sample-form" action="${contextPath}/editNV/${nhanVienItem.id}" method="post" >

				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên nhân viên:</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="tenNV" class="width-100" value="${nhanVienItem.tenNV }">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Ngày sinh :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="date" id="inputWarning" name="ngaySinh" class="width-100" value="${nhanVienItem.ngaySinh}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Giới tính :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="gioiTinh" class="width-100" value="${nhanVienItem.gioiTinh}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Địa chỉ :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="diaChi" class="width-100" value="${nhanVienItem.diaChi}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Số điện thoại :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="sdt" class="width-100" value="${nhanVienItem.sdt}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Chức vụ:</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="chucVu" class="width-100" value="${nhanVienItem.chucVu}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Trình độ chuyên môn :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="trinhDoChuyenMon" class="width-100" value="${nhanVienItem.trinhDoChuyenMon}">
						</span>
					</div>
				</div>
				<div class="form-group has-warning">
					<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mã đơn vị :</label>

					<div class="col-xs-12 col-sm-5">
						<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="idDonVi" class="width-100" value="${nhanVienItem.idDonVi}">
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
