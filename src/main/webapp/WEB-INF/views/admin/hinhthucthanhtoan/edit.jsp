<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/admin/hinhthuctt" />
<div class="step-pane active" data-step="1">
	<h3 class="lighter block green">SỬA THÔNG TIN HÌNH THỨC THANH TOÁN</h3>
	<c:if test="${htttItem ne null}">
		<form class="form-horizontal" id="sample-form" action="${contextPath}/editHttt/${htttItem.id}" method="post">

			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">Tên hình thức thanh toán:</label>

				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right"> <input type="text" id="inputWarning" name="hinhThucTT" class="width-100" value="${htttItem.hinhThucTT }">
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
