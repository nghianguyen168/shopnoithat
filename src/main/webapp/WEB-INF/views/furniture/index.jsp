<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div id="magik-slideshow" class="magik-slideshow">
	<div class="wow">
		<div id='rev_slider_4_wrapper' class='rev_slider_wrapper fullwidthbanner-container'>
			<div id='rev_slider_4' class='rev_slider fullwidthabanner'>
				<ul>
				<c:if test="${bannerList ne null }">
					<c:forEach items="${bannerList }" var="ban">
				
					<li data-transition='random' data-slotamount='7' data-masterspeed='1000' data-thumb='${pageContext.request.contextPath}/images/${ban.picture}'><img
						src='${pageContext.request.contextPath}/images/${ban.picture}' data-bgposition='left top' data-bgfit='cover' data-bgrepeat='no-repeat' alt="banner" />
						<div class='tp-caption ExtraLargeTitle sft  tp-resizeme ' data-x='15' data-y='80' data-endspeed='500' data-speed='500' data-start='1100' data-easing='Linear.easeNone' data-splitin='none'
							data-splitout='none' data-elementdelay='0.1' data-endelementdelay='0.1' style='z-index: 2; white-space: nowrap;'>${ban.small_title }</div>
						<div class='tp-caption LargeTitle sfl  tp-resizeme ' data-x='15' data-y='135' data-endspeed='500' data-speed='500' data-start='1300' data-easing='Linear.easeNone' data-splitin='none'
							data-splitout='none' data-elementdelay='0.1' data-endelementdelay='0.1' style='z-index: 3; white-space: nowrap;'>
							<span style="color: 7bbd42;">${ban.big_title }</span>
						</div>
						<div class='tp-caption sfb  tp-resizeme ' data-x='15' data-y='360' data-endspeed='500' data-speed='500' data-start='1500' data-easing='Linear.easeNone' data-splitin='none' data-splitout='none'
							data-elementdelay='0.1' data-endelementdelay='0.1' style='z-index: 4; white-space: nowrap;'>
							<a href='#' class="view-more">Xem thêm</a> 
						</div></li>
						
							</c:forEach>
				</c:if>
					
				</ul>
				<div class="tp-bannertimer"></div>
			</div>
		</div>
	</div>
</div>
<!-- end Slider -->
<!-- header service -->
<div class="header-service">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-sm-6 col-xs-12">
				<div class="content">
					<div class="icon-truck">&nbsp;</div>
					<span><strong>MIỄN PHÍ VẬN CHUYỂN</strong> NỘI THÀNH ĐÀ NẴNG</span>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 col-xs-12">
				<div class="content">
					<div class="icon-support">&nbsp;</div>
					<span><strong>HỖ TRỢ KHÁCH HÀNG</strong>& DỊCH VỤ</span>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 col-xs-12">
				<div class="content">
					<div class="icon-money">&nbsp;</div>
					<span><strong>BẢO HÀNH TRONG VÒNG </strong>3 NGÀY</span>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 col-xs-12">
				<div class="content">
					<div class="icon-dis">&nbsp;</div>
					<span><strong class="orange">GIẢM GIÁ 5% </strong> CHO ĐƠN ĐẶT HÀNG TRÊN 100.000.000</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end header service -->

<!-- offer banner section -->
<div class="offer-banner-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-xs-12 col-md-4 col-sm-4 wow">
				<a href="#"><img alt="offer banner1" src="${pageContext.request.contextPath}/resources/furniture/images/promo-banner1.jpg"></a>
			</div>
			<div class="col-lg-4 col-xs-12 col-md-4 col-sm-4 wow">
				<a href="#"><img alt="offer banner1" src="${pageContext.request.contextPath}/resources/furniture/images/promo-banner2.jpg"></a>
			</div>
			<div class="col-lg-4 col-xs-12 col-md-4 col-sm-4 wow">
				<a href="#"><img alt="offer banner1" src="${pageContext.request.contextPath}/resources/furniture/images/promo-banner3.jpg"></a>
			</div>
		</div>
	</div>
</div>
<!-- end offer banner section -->
<!-- main container -->


<!-- recommend slider -->
<section class="recommend container">
	<div class="new-pro-slider small-pr-slider" style="overflow: visible">
		<div class="slider-items-products">
			<div class="new_title center">
				<h2>SẢN PHẨM MỚI</h2>
			</div>
			

			<div id="recommend-slider" class="product-flexslider hidden-buttons">
				<div class="slider-items slider-width-col3 owl-carousel owl-theme" style="opacity: 1; display: block;">
					<c:if test="${not empty sanphammoiList }">
						<c:forEach items="${sanphammoiList}" var="sp">
							<!-- Item -->
							<div class="owl-wrapper-outer">

								<div class="owl-wrapper" style="width: 2960px; left: 0px; display: block; transition: all 0ms ease 0s; transform: translate3d(0px, 0px, 0px);">
									<div class="owl-item" style="width: 185px;">
										<div class="item">

											<div class="col-item">
												<div class="new-label new-top-right">New</div>
												<div class="images-container">
													<a class="product-image" title="Sample Product" href="product_detail.html"> <img src="${pageContext.request.contextPath}/images/${sp.hinhAnh}" class="img-responsive" alt="a"
														style="width: 500px; height: 180px;">
													</a>
													<div class="actions">
														<div class="actions-inner">
															<ul class="add-to-links">
																<li><a href="wishlist.html" title="Add to Wishlist" class="link-wishlist"><span>Add to Wishlist</span></a></li>
																<li><a href="compare.html" title="Add to Compare" class="link-compare "><span>Add to Compare</span></a></li>
															</ul>
														</div>
													</div>
													<div class="qv-button-container">
														<a href="quick_view.html" class="qv-e-button btn-quickview-1"><span><span>Quick View</span></span></a>
													</div>
												</div>
												<div class="info">
													<div class="info-inner">
														<div class="item-title">
															<a title=" Sample Product" href="${pageContext.request.contextPath}/furniture/detail/${sp.id}"> ${sp.tenSanPham} </a>
														</div>
														<!--item-title-->
														<div class="item-content">
															<div class="ratings">
																<div class="rating-box">
																	<div style="width: ${sp.sao}%" class="rating"></div>
																</div>
															</div>
															<div class="price-box">
																<p class="special-price">
																	<span class="price"> <fmt:formatNumber type="number" groupingUsed="true" value="${sp.giaGoc} " />₫
																	</span>
																</p>
															</div>
														</div>
														<!--item-content-->
													</div>
													<!--info-inner-->
													
													<%
														if(session.getAttribute("taikhoan")==null){
													%>
													<div class="actions">
														<button onclick="location.href = '${pageContext.request.contextPath }/furniture/login';"  type="button" title="Add to Cart" class="button btn-cart">
															<span>Add to Cart</span>
														</button>
													</div>
														<%
														} else {
														%>
														<div class="actions">
															<button id="new_addcart${sp.id}" type="button" title="Add to Cart" class="button btn-cart">
																<span>Add to Cart</span>
															</button>
														</div>
														<%
														}
														%>
														
													<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
													<script type="text/javascript">

				
													$('#new_addcart${sp.id}').click(function(){
														var soluong = 1;
														var id_sanpham = Number(${sp.id});
														var gia = Number(${sp.giaKhuyenMai});
														var hinhanh = "${sp.hinhAnh}";
														var ten_sanPham = "${sp.tenSanPham}";
														var id_user = Number(${taikhoan.id});
														$.ajax({
															url: '${pageContext.request.contextPath}/furniture/cartAjax',
															type : 'POST',
															cache : false,
															data : {
																
																id_sanpham : id_sanpham,
																ten_sanPham : ten_sanPham,
																soluong :soluong,
																hinhanh:hinhanh,
																id_user :id_user
															},
														success : function(response) {
															console.log(response);
															/* location.reload(false);  */
															
															 $('#cart-total').html(response);
															$('#cart-sidebar').load(" #cart-sidebar");
															 
														},
														error: function(response)
													    {
															alert("Có lỗi xảy ra!");
													    }
														

												});
										return false;
									});
				</script>
													
													<!--actions-->
													<div class="clearfix"></div>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- End Item -->


							</div>
						</c:forEach>
					</c:if>
					<div class="owl-controls clickable">
						<div class="owl-buttons">
							<div class="owl-prev">
								<a class="flex-prev"></a>
							</div>
							<div class="owl-next">
								<a class="flex-next"></a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="new-pro-slider small-pr-slider" style="overflow: visible">
		<div class="slider-items-products">
			<div class="new_title center">
				<h2>SẢN PHẨM BÁN CHẠY</h2>
			</div>
			

			<div id="recommend-slider" class="product-flexslider hidden-buttons">
				<div class="slider-items slider-width-col3 owl-carousel owl-theme" style="opacity: 1; display: block;">
					<c:if test="${not empty sanphammoiList }">
						<c:forEach items="${sanphammoiList}" var="sp">
							<!-- Item -->
							<div class="owl-wrapper-outer">

								<div class="owl-wrapper" style="width: 2960px; left: 0px; display: block; transition: all 0ms ease 0s; transform: translate3d(0px, 0px, 0px);">
									<div class="owl-item" style="width: 185px;">
										<div class="item">

											<div class="col-item">
												<div class="new-label new-top-right">Hot</div>
												<div class="images-container">
													<a class="product-image" title="Sample Product" href="product_detail.html"> <img src="${pageContext.request.contextPath}/images/${sp.hinhAnh}" class="img-responsive" alt="a"
														style="width: 500px; height: 180px;">
													</a>
													<div class="actions">
														<div class="actions-inner">
															<ul class="add-to-links">
																<li><a href="wishlist.html" title="Add to Wishlist" class="link-wishlist"><span>Add to Wishlist</span></a></li>
																<li><a href="compare.html" title="Add to Compare" class="link-compare "><span>Add to Compare</span></a></li>
															</ul>
														</div>
													</div>
													<div class="qv-button-container">
														<a href="quick_view.html" class="qv-e-button btn-quickview-1"><span><span>Quick View</span></span></a>
													</div>
												</div>
												<div class="info">
													<div class="info-inner">
														<div class="item-title">
															<a title=" Sample Product" href="product_detail.html"> ${sp.tenSanPham} </a>
														</div>
														<!--item-title-->
														<div class="item-content">
															<div class="ratings">
																<div class="rating-box">
																	<div style="width: ${sp.sao}%" class="rating"></div>
																</div>
															</div>
															<div class="price-box">
																<p class="special-price">
																	<span class="price"> <fmt:formatNumber type="number" groupingUsed="true" value="${sp.giaGoc} " />₫
																	</span>
																</p>
															</div>
														</div>
														<!--item-content-->
													</div>
													<!--info-inner-->
														<%
														if(session.getAttribute("taikhoan")==null){
													%>
													<div class="actions">
														<button onclick="location.href = '${pageContext.request.contextPath }/furniture/login';"  type="button" title="Add to Cart" class="button btn-cart">
															<span>Add to Cart</span>
														</button>
													</div>
														<%
														} else {
														%>
														<div class="actions">
															<button id="hot_addcart${sp.id}" type="button" title="Add to Cart" class="button btn-cart">
																<span>Add to Cart</span>
															</button>
														</div>
														<%
														}
														%>
													<!--actions-->
													<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
														<script type="text/javascript">

				
													$('#hot_addcart${sp.id}').click(function(){
														var soluong = 1;
														var id_sanpham = Number(${sp.id});
														var gia = Number(${sp.giaKhuyenMai});
														var hinhanh = "${sp.hinhAnh}";
														var ten_sanPham = "${sp.tenSanPham}";
														var id_user = Number(${taikhoan.id});
														$.ajax({
															url: '${pageContext.request.contextPath}/furniture/cartAjax',
															type : 'POST',
															cache : false,
															data : {
																
																id_sanpham : id_sanpham,
																ten_sanPham : ten_sanPham,
																soluong :soluong,
																hinhanh:hinhanh,
																id_user :id_user
															},
														success : function(response) {
															console.log(response);
															/* location.reload(false);  */
															
															 $('#cart-total').html(response);
															$('#cart-sidebar').load(" #cart-sidebar");
															 
														},
														error: function(response)
													    {
															alert("Có lỗi xảy ra!");
													    }
														

												});
										return false;
									});
				</script>
													<div class="clearfix"></div>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- End Item -->


							</div>
						</c:forEach>
					</c:if>
					<div class="owl-controls clickable">
						<div class="owl-buttons">
							<div class="owl-prev">
								<a class="flex-prev"></a>
							</div>
							<div class="owl-next">
								<a class="flex-next"></a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="new-pro-slider small-pr-slider" style="overflow: visible">
		<div class="slider-items-products">
			<div class="new_title center">
				<h2>SẢN PHẨM KHUYẾN MÃI</h2>
			</div>
			

			<div id="recommend-slider" class="product-flexslider hidden-buttons">
				<div class="slider-items slider-width-col3 owl-carousel owl-theme" style="opacity: 1; display: block;">
					<c:if test="${not empty listKhuyenMai }">
						<c:forEach items="${listKhuyenMai}" var="sp">
							<!-- Item -->
							<div class="owl-wrapper-outer">

								<div class="owl-wrapper" style="width: 2960px; left: 0px; display: block; transition: all 0ms ease 0s; transform: translate3d(0px, 0px, 0px);">
									<div class="owl-item" style="width: 185px;">
										<div class="item">

											<div class="col-item">
												<div class="new-label new-top-right">Sale</div>
												<div class="images-container">
													<a class="product-image" title="Sample Product" href="product_detail.html"> <img src="${pageContext.request.contextPath}/images/${sp.hinhAnh}" class="img-responsive" alt="a"
														style="width: 500px; height: 180px;">
													</a>
													<div class="actions">
														<div class="actions-inner">
															<ul class="add-to-links">
																<li><a href="wishlist.html" title="Add to Wishlist" class="link-wishlist"><span>Add to Wishlist</span></a></li>
																<li><a href="compare.html" title="Add to Compare" class="link-compare "><span>Add to Compare</span></a></li>
															</ul>
														</div>
													</div>
													<div class="qv-button-container">
														<a href="quick_view.html" class="qv-e-button btn-quickview-1"><span><span>Quick View</span></span></a>
													</div>
												</div>
												<div class="info">
													<div class="info-inner">
														<div class="item-title">
															<a  title=" Sample Product" href="product_detail.html"> ${sp.tenSanPham} </a>
														</div>
														<!--item-title-->
														<div class="item-content">
															<div class="ratings">
																<div class="rating-box">
																	<div style="width: ${sp.sao}%" class="rating"></div>
																</div>
															</div>
															<div class="price-box">
																<p class="special-price">
																	<span style="color: #777; text-decoration: line-through;" class="price"> <fmt:formatNumber type="number" groupingUsed="true" value="${sp.giaGoc} " />₫
																	</span>
																	<br>
																	<span class="price"> <fmt:formatNumber type="number" groupingUsed="true" value="${sp.giaGoc-sp.giaKhuyenMai} " />₫
																	
																</p>
															</div>
														</div>
														<!--item-content-->
													</div>
													<!--info-inner-->
														<%
														if(session.getAttribute("taikhoan")==null){
													%>
													<div class="actions">
														<button onclick="location.href = '${pageContext.request.contextPath }/furniture/login';"  type="button" title="Add to Cart" class="button btn-cart">
															<span>Add to Cart</span>
														</button>
													</div>
														<%
														} else {
														%>
														<div class="actions">
															<button id="news_addcart${sp.id }" type="button" title="Add to Cart" class="button btn-cart">
																<span>Add to Cart</span>
															</button>
														</div>
														<%
														}
														%>
														<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
												<script type="text/javascript">

				
													$('#news_addcart${sp.id}').click(function(){
														var soluong = 1;
														var id_sanpham = Number(${sp.id});
														var gia = Number(${sp.giaKhuyenMai});
														var hinhanh = "${sp.hinhAnh}";
														var ten_sanPham = "${sp.tenSanPham}";
														var id_user = Number(${taikhoan.id});
														$.ajax({
															url: '${pageContext.request.contextPath}/furniture/cartAjax',
															type : 'POST',
															cache : false,
															data : {
																
																id_sanpham : id_sanpham,
																ten_sanPham : ten_sanPham,
																soluong :soluong,
																hinhanh:hinhanh,
																id_user :id_user
															},
														success : function(response) {
															console.log(response);
															/* location.reload(false);  */
															
															 $('#cart-total').html(response);
															$('#cart-sidebar').load(" #cart-sidebar");
															 
														},
														error: function(response)
													    {
															alert("Có lỗi xảy ra!");
													    }
														

												});
										return false;
									});
				</script>
													<!--actions-->
													<div class="clearfix"></div>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- End Item -->


							</div>
						</c:forEach>
					</c:if>
					<div class="owl-controls clickable">
						<div class="owl-buttons">
							<div class="owl-prev">
								<a class="flex-prev"></a>
							</div>
							<div class="owl-next">
								<a class="flex-next"></a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>
<!-- End Recommend slider -->
<!-- banner section -->
<div class="top-offer-banner wow">
	<div class="container">
		<div class="row">
			<div class="offer-inner col-lg-12">
				<!--newsletter-wrap-->
				<div class="left">
					<div class="col-1">
						<div class="block-subscribe">
							<div class="newsletter">
								<form>
									<h4>
										<span>THEO DÕI BẢN TIN</span>
									</h4>
									<h5>Nhận tin tức và cập nhật mới nhất từ ​​nội thất HoangTu</h5>
									<input type="text" placeholder="Nhập địa chỉ email của bạn" class="input-text required-entry validate-email" title="Sign up for our newsletter" id="newsletter1" name="email">
									<button class="subscribe" title="Subscribe" type="submit">
										<span>Theo giỏi</span>
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="col mid">
						<div class="inner-text">
							<h3>Gối tựa</h3>
						</div>
						<a href="#"><img src="${pageContext.request.contextPath}/resources/furniture/images/offer-banner2.jpg" alt="offer banner2"></a>
					</div>
					<div class="col last">
						<div class="inner-text">
							<h3>Bàn mới</h3>
						</div>
						<a href="#"><img src="${pageContext.request.contextPath}/resources/furniture/images/offer-banner3.jpg" alt="offer banner2"></a>
					</div>
				</div>
				<div class="right">
					<div class="col">
						<div class="inner-text">
							<h4>Bộ SƯU TẬP HÀNG ĐẦU</h4>
							<h3>Ghế hiện đại</h3>
							<a href="#" class="shop-now1">Mua ngay</a>
						</div>
						<a href="#" title=""><img src="${pageContext.request.contextPath}/resources/furniture/images/offer-banner4.jpg" alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- End banner section -->




