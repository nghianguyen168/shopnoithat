<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/khuyenmai" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">THÊM KHUYẾN MÃI</h3>
	<form class="form-horizontal" id="sample-form" action="${contextPath}/add" method="post">

		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên sản phẩm:</label>

			<div class="col-xs-12 col-sm-5">
				<select id="inputWarning" name="idSanPham" class="width-100">
					<c:if test="${not empty sanPhamList }">
						<c:forEach items="${sanPhamList}" var="sp">
							<option value="${sp.id}">${sp.tenSanPham}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên đợt khuyến mãi:</label>

			<div class="col-xs-12 col-sm-5">
				<select id="inputWarning" name="idDotKhuyenMai" class="width-100">
					<c:if test="${not empty dotKMList }">
						<c:forEach items="${dotKMList}" var="dkm">
							<option value="${dkm.id}">${dkm.tenKhuyenMai}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Hình thức :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="hinhThuc" class="width-100">
				</span>
			</div>
		</div>
		<div class="form-group has-success">
			<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tỉ lệ :</label>

			<div class="col-xs-12 col-sm-5">
				<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="tiLe" class="width-100">
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