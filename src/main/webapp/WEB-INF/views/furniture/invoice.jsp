<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>

					<div class="main container">
	<div class="col-main">	
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="space-6"></div>

								<div class="row">
									<div class="col-sm-10 col-sm-offset-1">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-large">
												<h3 class="widget-title grey lighter">
													<i class="ace-icon fa fa-leaf green"></i>
													Chi Tiết Đơn Hàng
												</h3>

												<div class="widget-toolbar hidden-480">
													<a href="#">
														<i class="ace-icon fa fa-print"></i>
													</a>
												</div>
											</div>
											<form action="${pageContext.request.contextPath }/furniture/invoice" method="post">
											<div class="widget-body">
												<div class="widget-main padding-24">
													<div class="row">
														<div class="col-sm-6">
															<div class="row">
																<div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
																	<b>Thông tin khách hàng</b>
																</div>
															</div>

															<div>
																<ul class="list-unstyled spaced">
																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>Họ tên: <input  name="hoTen" type="text" style="border: none;font-weight: bold;" value="${thongTinDatHang.hoTen }">
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>SĐT: <input name="sdt" type="text" style="border: none;font-weight: bold;" value="${thongTinDatHang.sdt }">
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>Địa chỉ: <input name="diaChi" type="text" style="border: none;font-weight: bold;" value="${thongTinDatHang.diaChi }">
																	</li>
																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>Email: <input name="email" type="text" style="border: none;font-weight: bold;" value="${thongTinDatHang.email }">
																	</li> 

																

																	<li class="divider"></li>
																	<br>
																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>
																		<strong style="font-size: 16px;">Thông tin đơn hàng:</strong>
																	</li>
																</ul>
															</div>
														</div><!-- /.col -->

													
													</div><!-- /.row -->

													<div class="space"></div>

													<div>
														<table class="table table-striped table-bordered">
															<thead>
																<tr>
																	<th class="center">STT</th>
																	<th>Tên sản phẩm</th>
																	<th class="hidden-xs">Số lượng</th>
																	<th class="hidden-480">Giá</th>
																	<th>Tổng</th>
																</tr>
															</thead>

															<tbody>
															
															<c:forEach var="item" items="${gioHangList }" varStatus="stt">
															
																<tr>
																	<td class="center">${stt.index+1 }</td>

																	<td>
																		<a href="#">${item.sanPham.tenSanPham }</a>
																	</td>
																	<td class="hidden-xs">
																		${item.soluong }
																	</td>
																	<c:set var="gia"
																		value="${item.sanPham.giaGoc - item.sanPham.giaKhuyenMai}" />
																	<fmt:formatNumber currencySymbol="VNĐ" type="number" var="giatien" value="${gia}" />
																	<td class="hidden-480"> $${giatien}</td>
																	<c:set var="tong"
																		value="${(item.sanPham.giaGoc - item.sanPham.giaKhuyenMai)*item.soluong}" />
																	<fmt:formatNumber currencySymbol="VNĐ" type="number" var="tongtien" value="${tong}" />
																	<td>$${tongtien }</td>
																</tr>
																
																<c:set var="sumall"
																value="${sumall+(item.sanPham.giaGoc-item.sanPham.giaKhuyenMai)*item.soluong}" />
															<fmt:formatNumber currencySymbol="VNĐ" type="number"
																var="tongthanhtoan" value="${sumall}" />
															</c:forEach>
																
															</tbody>
														</table>
													</div>

													<div class="hr hr8 hr-double hr-dotted"></div>

													<div class="row">
														<div class="col-sm-5 pull-right">
															<h4 class="pull-right">
																Tổng thanh toán :
																<span class="red"><strong>$${tongthanhtoan}</strong></span>
															</h4>
														</div>
														
													</div>

													<div class="space-6"></div>
													
													<h4 class="mb-3">Chọn phương thức thanh toán</h4>

											        <div class="d-block my-3">
											          <div class="custom-control custom-radio">
											            <input id="credit" name="paymentMethod" value="1" type="radio" class="custom-control-input" checked required>
											            <label class="custom-control-label" for="credit">Thanh toán khi nhận hàng</label>
											          </div>
											          <div class="custom-control custom-radio">
											            <input id="debit" name="paymentMethod" value="2" type="radio" class="custom-control-input" required>
											            <label class="custom-control-label" for="debit">Chuyển khoản ngân hàng</label>
											         	<ul style="margin-left: 20px;" class="list-unstyled spaced">
																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>Ngân hàng Viettinbank 
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>Chủ tài khoản: <strong>Nguyễn Văn Nghĩa</strong> 
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>Số tài khoản: <strong>106867091705</strong>
																	</li>
																	
																</ul>
											          </div>
											          <div class="custom-control custom-radio">
											            <input id="paypal" name="paymentMethod" value="3" type="radio" class="custom-control-input" required>
											            <label class="custom-control-label" for="paypal">PayPal</label>
											            <!-- PayPal Logo --><table border="0" cellpadding="" cellspacing="0" ><tr><td ></td></tr><tr><td align="center"><a href="https://www.paypal.com/c2/webapps/mpp/paypal-popup?locale.x=en_C2" title="PayPal" onclick="javascript:window.open('https://www.paypal.com/c2/webapps/mpp/paypal-popup?locale.x=en_C2','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;"><img src="https://www.paypalobjects.com/digitalassets/c/website/marketing/apac/C2/logos-buttons/optimize/26_Yellow_PayPal_Pill_Button.png" alt="PayPal" /></a></td></tr></table><!-- PayPal Logo -->
											          </div>
											          <br>
											          <button type="submit" class="button btn-proceed-checkout" title="Proceed to Checkout">
														<span>Proceed to Checkout</span>
													</button>
											        </div>
											        <br>
											        <div class="well">
														Thank you for choosing Ace Company products.
														We believe you will be satisfied by our services.
													</div>
												</div>
											</div>
											</form>
										</div>
									</div>
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						</div></div>
		