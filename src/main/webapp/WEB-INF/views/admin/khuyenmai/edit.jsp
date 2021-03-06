<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/khuyenmai" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">SỬA THÔNG TIN KHUYỄN MÃI</h3>
	<c:if test="${khuyenMaiItem ne null}">
		<form class="form-horizontal" id="sample-form" action="${contextPath}/editKM/${khuyenMaiItem.id}" method="post">

			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên sản phẩm :</label>
				<div class="col-xs-12 col-sm-5">
					<select id="inputWarning" name="idSanPham" class="width-100">
						<c:if test="${not empty sanPhamList }">
							<c:forEach items="${sanPhamList}" var="sp">
								<c:choose>
									<c:when test="${sp.getId() == idSanPham }">
										<option value="${sp.id}">${dm.tenSanPham}</option>
									</c:when>
									<c:otherwise>
										<option selected="selected" value="${sp.id}">${sp.tenSanPham}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Ten đợt khuyến mãi :</label>
				<div class="col-xs-12 col-sm-5">
					<select id="inputWarning" name="idDotKhuyenMai" class="width-100">
						<c:if test="${not empty dotKMList }">
							<c:forEach items="${dotKMList}" var="dkm">
								<c:choose>
									<c:when test="${dkm.getId() == idDotKhuyenMai }">
										<option value="${dkm.id}">${dkm.tenKhuyenMai}</option>
									</c:when>
									<c:otherwise>
										<option selected="selected" value="${dkm.id}">${dkm.tenKhuyenMai}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Hình thức:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="hinhThuc" class="width-100" value="${khuyenMaiItem.hinhThuc }">
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tỉ lệ:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="tiLe" class="width-100" value="${khuyenMaiItem.tiLe}">
					</span>
				</div>
			</div>
			<div class="clearfix form-actions" style="text-align: center;">
				<div class="card-footer">
					<button type="submit" class="btn btn-primary btn-sm">
						<i class="fa fa-dot-circle-o"></i>Edit
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
