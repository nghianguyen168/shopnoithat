<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/sanpham" />

<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">THÊM SẢN PHẨM</h3>
	<form action="${contextPath}/add" method="post" class="form-horizontal" id="sample-form" enctype="multipart/form-data">
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên sản phẩm :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="tenSanPham" class="width-100" required>
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Đơn vị tính :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="donViTinh" class="width-100" required>
				</span>
			</div>
		</div>

		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Số lượng  :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="soLuongTon" class="width-100" required>
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Danh mục sản phẩm :</label>

			<div class="col-xs-12 col-sm-5">
				<select id="inputWarning" name="idDanhMucSP" class="width-100" required>
					<c:if test="${not empty listDanhMuc }">
						<c:forEach items="${listDanhMuc}" var="dm">
							<option value="${dm.id}">${dm.tenDanhMuc}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Nhà cung cấp :</label>

			<div class="col-xs-12 col-sm-5">
				<select id="inputWarning" name="idNhaCungCap" class="width-100" required>
					<c:if test="${not empty listNhaCungCap }">
						<c:forEach items="${listNhaCungCap}" var="ncc">
							<option value="${ncc.id}">${ncc.tenNCC}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Thuế :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="thue" class="width-100" required>
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Giá gốc :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="giaGoc" class="width-100" required>
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Giá khuyến mãi :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="giaKhuyenMai" class="width-100" required>
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Hình ảnh :</label>

			<div class="col-xs-12 col-sm-5">
				<input type="file" name="hinhanh" class="width-100" required>

			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Hình ảnh mô tả (Có thể chọn nhiều ảnh):</label>
			<div class="col-xs-12 col-sm-5">
				<input type="file" name="hinhanhmota" multiple="multiple" class="width-100" required required>

			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tỉ lệ sao :</label>

			<div class="col-xs-12 col-sm-5">
				<input type="text" name="sao" class="width-100" required>

			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mô tả sản phẩm :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <textarea id="description" name="moTaSanPham" class="width-100" required></textarea>
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mô tả chi tiết :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <textarea id="description_detail" name="moTaChiTiet" class="width-100" required></textarea>
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

<script>
	var ckeditor=CKEDITOR.replace('description');
	CKFinder.setupCKEditor(ckeditor,'${pageContext.request.contextPath}/resources/admin/ckfinder/');
	
	var ckeditor_detail=CKEDITOR.replace('description_detail');
	CKFinder.setupCKEditor(ckeditor_detail,'${pageContext.request.contextPath}/resources/admin/ckfinder/');
	
</script>