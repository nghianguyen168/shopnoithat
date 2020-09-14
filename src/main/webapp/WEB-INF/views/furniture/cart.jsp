<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<br>
<div class="main container">
	<div class="col-main">
		<div class="cart wow">
			<div class="page-title">
				<h2>Shopping Cart</h2>
			</div>
			<div class="table-responsive">
				<form method="post" action="#updatePost/" id="cart-hihi">
					<input type="hidden" value="Vwww7itR3zQFe86m" name="form_key">
					<fieldset>
						<table class="data-table cart-table" id="shopping-cart-table">
							<colgroup>
								<col width="1">
								<col>
								<col width="1">
								<col width="1">
								<col width="1">
								<col width="1">
								<col width="1">
							</colgroup>
							<thead>
								<tr class="first last">
									<th rowspan="1">&nbsp;</th>
									<th rowspan="1"><span class="nobr">Tên sản phẩm</span></th>
									<th rowspan="1"></th>
									<th colspan="1" class="a-center"><span class="nobr">Giá</span></th>
									<th class="a-center" rowspan="1">Số lượng</th>
									<th colspan="1" class="a-center">Tổng</th>
									<th class="a-center" rowspan="1">&nbsp;</th>
								</tr>
							</thead>
							<tfoot>
								<tr class="first last">
									<td class="a-right last" colspan="50"><button
											onclick="setLocation('#')" class="button btn-continue"
											title="Continue Shopping" type="button">
											<span><span>Tiếp tục mua sắm</span></span>
										</button>
										<button class="button btn-update" title="Update Cart"
											value="update_qty" name="update_cart_action" type="submit">
											<span><span>Cập nhật</span></span>
										</button>
										<button id="empty_cart_button" class="button btn-empty"
											title="Clear Cart" value="empty_cart"
											name="update_cart_action" type="submit">
											<span><span>Clear Cart</span></span>
										</button></td>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="cart" items="${gioHangList }">

									<tr class="first odd">
										<td class="image"><a class="product-image"
											title="Sample Product" href="#/women-s-crepe-printed-black/"><img
												width="75" alt="Sample Product"
												src="${pageContext.request.contextPath }/images/${cart.sanPham.hinhAnh}"></a></td>
										<td><h2 class="product-name">
												<a href="#/women-s-crepe-printed-black/">${cart.sanPham.tenSanPham }</a>
											</h2></td>
										<td class="a-center"><a title="Edit item parameters"
											class="edit-bnt" href="#configure/id/15945/"></a></td>
										<fmt:formatNumber currencySymbol="VNĐ" type="number" var="gia"
											value="${cart.sanPham.giaGoc-cart.sanPham.giaKhuyenMai}" />
										<td class="a-right"><span class="cart-price"> <span
												class="price">${gia }</span>
										</span></td>

										<td style="width: 200px;" class="a-center movewishlist">
											<div class="custom pull-left">
												<button id="quanlity_down${cart.sanPham.id }"
													onclick="var result = document.getElementById('qty${cart.sanPham.id }'); var qty${cart.sanPham.id } = result.value; if( !isNaN( qty${cart.sanPham.id } ) &amp;&amp; qty${cart.sanPham.id } > 0 ) result.value--;return false;"
													class="reduced items-count" type="button">
													<i class="icon-minus">&nbsp;</i>
												</button>
												<input maxlength="12" class="input-text qty"
													id="qty${cart.sanPham.id }" title="Qty" size="4"
													value="${cart.soluong }" name="cart[15945][qty]">
												<button id="quanlity_up${cart.sanPham.id }"
													onclick="var result = document.getElementById('qty${cart.sanPham.id }'); var qty${cart.sanPham.id } = result.value; if( !isNaN( qty${cart.sanPham.id } )&amp;&amp; qty${cart.sanPham.id } < 10 ) result.value++;return false;"
													class="increase items-count" type="button">
													<i class="icon-plus">&nbsp;</i>
												</button>

											</div>
										</td>
										<fmt:formatNumber currencySymbol="VNĐ" type="number"
											var="sumgia"
											value="${(cart.sanPham.giaGoc-cart.sanPham.giaKhuyenMai)*cart.soluong}" />
										<td class="a-right movewishlist"><span class="cart-price">
												<span class="price">${sumgia }</span>
										</span></td>
										<td class="a-center last"><a class="button remove-item"
											id="xoa_sp_cart${cart.giohang_id }" title="Remove item"
											href="#"><span><span>Xóa sản phẩm</span></span></a></td>
									</tr>
									<c:set var="sumall"
										value="${sumall+(cart.sanPham.giaGoc-cart.sanPham.giaKhuyenMai)*cart.soluong}" />
									<fmt:formatNumber currencySymbol="VNĐ" type="number"
										var="tongtien" value="${sumall}" />
									<script
										src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
									<script type="text/javascript">
			
										window.document_clicked = false;
																$(document).on('click','#quanlity_down${cart.sanPham.id },#quanlity_up${cart.sanPham.id }',function(e){
																	
																	var id_item_cart = Number(${cart.sanPham.id});
																	var soluong = 	 $('#qty${cart.sanPham.id}').val();
																	
																	$.ajax({
																		url: '${pageContext.request.contextPath}/furniture/cart/update',
																		type : 'POST',
																		cache : false,
																		data : {
																			
																			id_item_cart : id_item_cart,
																			soluong:soluong
																			
																		},
																	success : function(response) {
																		console.log(response);
																		/* location.reload(false);  */
																		
																		 $('#cart-total').html(response);
																		$('#shopping-cart-table').load(" #shopping-cart-table");
																		$('#shopping-cart-totals-table').load(" #shopping-cart-totals-table");
																		
																	},
																	error: function(response)
																    {
																		alert("Có lỗi xảy ra!");
																    }
																	
																	
															});
													
													return false;
													
																	 });
							</script>
									<script
										src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
									<script type="text/javascript">
			
									window.document_clicked = false;
											$(document).on('click','#xoa_sp_cart${cart.giohang_id}',function(e){
															
																	
																	var id_item_cart = Number(${cart.giohang_id});
												
																	$.ajax({
																		url: '${pageContext.request.contextPath}/furniture/cart/del',
																		type : 'GET',
																		cache : false,
																		data : {
																			
																			id_item_cart : id_item_cart
																			
																		},
																	success : function(response) {
																		console.log(response);
																	
																		
																		$('#cart-total').html(response);
																		$('#shopping-cart-table').load(" #shopping-cart-table");
																		$('#shopping-cart-totals-table').load(" #shopping-cart-totals-table");
																		
																	},
																	error: function(response)
																    {
																		alert("Có lỗi xảy ra!");
																    }
																	
			
															});
													return false;
												});
							</script>
								</c:forEach>
							</tbody>
						</table>
					</fieldset>
				</form>

			</div>
			<!-- BEGIN CART COLLATERALS -->
			<form id="shipping-zip-form" method="post"
								action="${pageContext.request.contextPath }/furniture/order">
			<div class="cart-collaterals row">
				<div class="col-sm-4">
				
					<div class="shipping">
						<h3>THÔNG TIN THANH TOÁN</h3>
						
						<div class="shipping-form">
							
								
								<ul class="form-list">
									<li><label class="required" for="country"><em>*</em>Họ Tên</label>
										<div class="input-box">
											<input type="text" name="hoTen" class="input-text" placeholder="Nhập họ tên người nhận hàng" required>
										</div></li>
									<li><label for="region_id" for="place"><em>*</em>Địa chỉ</label>
										<div class="input-box">
											<input type="text" name="diaChi" class="input-text" placeholder="VD: Sỗ XX Đường XX Quận Thanh Khê,Đà Nẵng" required>
											
										</div></li>
									<li><label for="postcode">Số Điện Thoại</label>
										<div class="input-box">
											<input type="text" value="" name="sdt"
											required	id="postcode" class="input-text validate-postcode">
										</div></li>
									<li><label for="postcode">Email</label>
										<div class="input-box">
											<input type="text" value="" name="email"
												id="postcode" class="input-text validate-postcode" required>
										</div></li>
								</ul>
								<!-- <div class="buttons-set11">
									<button class="button get-quote"
										onclick="coShippingMethodForm.submit()" title="Get a Quote"
										type="button">
										<span>Get a Quote</span>
									</button>
								</div> -->
								<!--buttons-set11-->
								<!-- <input type="submit" value="gửi"> -->
						
						</div>
					</div>
				</div>
				<div class="col-sm-4" style="display: none;">
					<div class="discount">
						<h3>Discount Codes</h3>
						<form method="post" action="#couponPost/"
							id="discount-coupon-form">
							<label for="coupon_code">Enter your coupon code if you
								have one.</label> <input type="hidden" value="0" id="remove-coupone"
								name="remove"> <input type="text" value=""
								name="coupon_code" id="coupon_code" class="input-text fullwidth">
							<button value="Apply Coupon" onclick="discountForm.submit(false)"
								class="button coupon " title="Apply Coupon" type="button">
								<span>Apply Coupon</span>
							</button>
						</form>
					</div>
				</div>
				<div class="totals col-sm-4">
					<h3>Shopping Cart Total</h3>
					<div class="inner">
						<table class="table shopping-cart-table-total"
							id="shopping-cart-totals-table">
							<colgroup>
								<col>
								<col width="1">
							</colgroup>
							<tfoot>
								<tr>
									<td colspan="1" class="a-left" style=""><strong>Tổng
											tiền thanh toán</strong></td>
									<td class="a-right" style=""><strong><span
											class="price">${tongtien } VNĐ</span></strong></td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td colspan="1" class="a-left" style="">Tổng</td>
									<td class="a-right" style=""><span class="price">${tongtien }
											VNĐ</span></td>
								</tr>
							</tbody>
						</table>
						<ul class="checkout">
							<li>
								<button type="submit" class="button btn-proceed-checkout"
								onclick="toastr.success('Hi! I am success message.');"	title="Proceed to Checkout" type="button">
									<span>Proceed to Checkout</span>
								</button>
							</li>
							
							<%-- <form method="post" action="${pageContext.request.contextPath }/pay">
								<input type="text" name="price">
								<button type="submit">payment by paypal</button>
							</form> --%>
							<br>
							<li><a title="Checkout with Multiple Addresses"
								href="multiple_addresses.html">Checkout with Multiple
									Addresses</a></li>
							<br>
						</ul>
					</div>
					<!--inner-->
	</form>
				</div>
			</div>
		</div>
		
	</div>
</div>
