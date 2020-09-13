<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/sanpham" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">SỬA SẢN PHẨM</h3>
	<c:if test="${sanPhamItem ne null}">
		<form class="form-horizontal" id="sample-form" action="${contextPath}/editSP/${sanPhamItem.id}" method="post" enctype="multipart/form-data">

			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên sản phẩm :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="tenSanPham" class="width-100" value="${sanPhamItem.tenSanPham }">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Đơn vị tính:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="donViTinh" class="width-100" value="${sanPhamItem.donViTinh}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Số lượng tồn:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="soLuongTon" class="width-100" value="${sanPhamItem.soLuongTon}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Danh mục sản phẩm :</label>
				<div class="col-xs-12 col-sm-5">
					<select id="inputWarning" name="idDanhMucSP" class="width-100">
						<c:if test="${not empty listDanhMuc }">
							<c:forEach items="${listDanhMuc}" var="dm">
								<c:choose>
									<c:when test="${dm.getId() == idDanhMucSP }">
										<option value="${dm.id}">${dm.tenDanhMuc}</option>
									</c:when>
									<c:otherwise>
										<option selected="selected" value="${dm.id}">${dm.tenDanhMuc}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Nhà cung cấp :</label>
				<div class="col-xs-12 col-sm-5">
					<select id="inputWarning" name="idNhaCungCap" class="width-100">
						<c:if test="${not empty listNhaCungCap }">
							<c:forEach items="${listNhaCungCap}" var="ncc">
								<c:choose>
									<c:when test="${ncc.getId() == idNhaCungCap }">
										<option value="${ncc.id}">${ncc.tenNCC}</option>
									</c:when>
									<c:otherwise>
										<option selected="selected" value="${ncc.id}">${ncc.tenNCC}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Thuế :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="thue" class="width-100" value="${sanPhamItem.thue}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Giá gốc :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="giaGoc" class="width-100" value="${sanPhamItem.giaGoc}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Giá khuyến mãi :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="giaKhuyenMai" class="width-100" value="${sanPhamItem.giaKhuyenMai}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Hình ảnh :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="file" id="inputWarning" class="width-100" name="hinhanh"
						src="${pageContext.request.contextPath}/images/${sanPhamItem.hinhAnh}"> <br /> <img width="100px" height="70px" src="${pageContext.request.contextPath}/images/${sanPhamItem.hinhAnh}" />
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tỉ lệ sao :</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="sao" class="width-100" value="${sanPhamItem.sao}">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mô tả sản phẩm:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <textarea id="description" name="moTaSanPham" class="width-100" >${sanPhamItem.moTaSanPham}</textarea>
					</span>
				</div>
			</div>
				<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Mô tả chi tiết :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <textarea id="description_detail" name="moTaChiTiet" class="width-100" required>${sanPhamItem.moTaChiTiet}</textarea>
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
<script>
	var ckeditor=CKEDITOR.replace('description');
	CKFinder.setupCKEditor(ckeditor,'${pageContext.request.contextPath}/resources/admin/ckfinder/');
	
	var ckeditor_detail=CKEDITOR.replace('description_detail');
	CKFinder.setupCKEditor(ckeditor_detail,'${pageContext.request.contextPath}/resources/admin/ckfinder/');
</script>