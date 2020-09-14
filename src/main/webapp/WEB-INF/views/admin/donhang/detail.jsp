<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="page-content">
				

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
													Chi tiết hóa đơn - House Furniture
												</h3>

												<div class="widget-toolbar no-border invoice-info">
													<span class="invoice-info-label">Đơn hàng:</span>
													<span class="red">#${donhang.id }</span>

													<br>
													<fmt:formatDate value="${donhang.ngayDat }" var="ngaydat" pattern="dd-MM-yyyy"/>
													<span class="invoice-info-label">Ngày:</span>
													<span class="blue">${ngaydat }</span>
												</div>

												<div class="widget-toolbar hidden-480">
													<a href="#" onclick="window.print()">
														<i class="ace-icon fa fa-print"></i>
													</a>
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-24">
													<div class="row">
														

														<div class="col-sm-6">
															<div class="row">
																<div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
																	<b>Thông tin khách hàng</b>
																</div>
															</div>

															<div>
																<ul class="list-unstyled  spaced">
																	<li>
																		<i class="ace-icon fa fa-caret-right green"></i>Họ tên KH: ${donhang.hoTen }
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right green"></i>SĐT: ${donhang.sdtNguoiMua }
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right green"></i>Địa chỉ: ${donhang.diaChiNguoiMua }
																	</li>

																	<li class="divider"></li>

																	<li>
																		<i class="ace-icon fa fa-caret-right green"></i>
																		Email: ${donhang.emailNguoiMua}
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
																	<th class="center">#</th>
																	<th>Tên sản phẩm</th>
																	<th class="">Số lượng</th>
																	<th class="">Giá(Đã trừ KM)</th>
																	<th>Tổng</th>
																</tr>
															</thead>

															<tbody>
															
															<c:if test="${listOrder ne null }">
																<c:forEach items="${listOrder }" var="order" varStatus="stt" >
																	<tr>
																		<td class="center">${stt.index+1}</td>
	
																		<td>
																			<a href="#">${order.sanPham.tenSanPham }</a>
																		</td>
																		<td class="">
																			${order.soluong }
																		</td>
																		<fmt:formatNumber currencySymbol="VNĐ" type="number" var="gia" value="${order.gia}" />
																		<td class=""> ${gia } </td>
																		
																		
																		<fmt:formatNumber currencySymbol="VNĐ" type="number" var="tong" value="${order.gia * order.soluong}" />
																		<td>${tong}</td>
																	</tr>
																
                                                             </c:forEach>
															</c:if>
															
															</tbody>
														</table>
													</div>

													<div class="hr hr8 hr-double hr-dotted"></div>

													<div class="row">
														<div class="col-sm-5 pull-right">
															<h4 class="pull-right">
															<fmt:formatNumber currencySymbol="VNĐ" type="number" var="tongtien" value="${donhang.tong}" />
																Tổng giá trị đơn hàng :
																<span class="red">${tongtien}</span>
															</h4>
														</div>
														<div class="col-sm-7 pull-left"> Thông tin bổ sung </div>
													</div>

													<div class="space-6"></div>
													
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div>