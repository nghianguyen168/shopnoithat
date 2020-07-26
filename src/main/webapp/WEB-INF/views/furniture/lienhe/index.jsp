<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<%-- <c:set var="contexPath" value="${pageContext.request.contextPath}/furniture/lienhe" /> --%>
<div class="main-container col2-right-layout">
	<div class="main container">
		<div class="row">
			<section class="col-main col-sm-9 wow">
				<div class="page-title">
					<h2>LIÊN HỆ CHÚNG TÔI</h2>
				</div>
				<form action="${pageContext.request.contextPath}/furniture/lienhe/index" method="post" class="form-horizontal" id="sample-form">
					<div class="static-contain">
						<c:if test="${not empty msg}">
							<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
								<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
							</div>
						</c:if>
						<fieldset class="group-select">
							<ul>
								<li id="billing-new-address-form">
									<fieldset>
										<ul>
											<li>
												<div class="customer-name">
													<div class="input-box name-firstname">
														<label for="billing:firstname"> Họ tên<span class="required">*</span></label> <br> <input type="text" id="billing:firstname" name="hoTen" value="" title="First Name"
															class="input-text ">
													</div>
													<div class="input-box name-lastname">
														<label for="billing:lastname"> Địa chỉ email <span class="required">*</span>
														</label> <br> <input type="text" id="billing:lastname" name="email" value="" title="" class="input-text">
													</div>
												</div>
											</li>
											<li>
												<div class="input-box">
													<label for="billing:company">Công ty</label> <br> <input type="text" id="billing:company" name="congTy" value="" title="Company" class="input-text">
												</div>
												<div class="input-box">
													<label for="billing:email">Số điện thoại <span class="required">*</span></label> <br> <input type="text" name="sdt" id="billing:email" value="" title="Email Address"
														class="input-text validate-email">
												</div>
											</li>
											<li><label for="billing:street1">Địa chỉ <span class="required">*</span></label> <br> <input type="text" title="Street Address" name="diaChi" id="billing:street1  street1"
												value="" class="input-text required-entry"></li>
											<li class=""><label for="comment">Bình luận<em class="required">*</em></label> <br>
												<div style="float: none" class="">
													<textarea name="binhLuan" id="comment" title="Comment" class="required-entry input-text" cols="5" rows="3"></textarea>
												</div></li>
										</ul>
									</fieldset>
								</li>
								<p class="require">
									<em class="required">* </em>Phần bắt buộc
								</p>
								<input type="text" name="hideit" id="hideit" value="" style="display: none !important;">
								<div class="buttons-set">
									<button type="submit" title="Submit" class="button submit">
										<span> Submit </span>
									</button>
								</div>
							</ul>
						</fieldset>
					</div>
				</form>
			</section>
		</div>
	</div>
</div>
&nbsp;
