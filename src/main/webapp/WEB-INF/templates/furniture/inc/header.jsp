<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<header class="header-container">
    <div class="header-top">
      <div class="container">
        <div class="row"> 
          <!-- Header Language -->
          <div class="col-xs-12"> 
            <!-- Header Top Links -->
            <div class="toplinks">
              <div class="links">
                <div class="myaccount"><a title="My Account" href="login.html"><span class="hidden-xs">Tài khoản của tôi </span></a></div>
                <div class="wishlist"><a title="My Wishlist" href="wishlist.html"><span class="hidden-xs">Danh sách yêu thích</span></a></div>
                <div class="check"><a title="Checkout" href=""><span class="hidden-xs">Thủ tục thanh toán</span></a></div>
                <div class="phone hidden-xs">HOTLINE :0857 88 62 64</div>
              </div>
            </div>
            <!-- End Header Top Links --> 
          </div>
        </div>
      </div>
    </div>
    <div class="header container">
      <div class="row">
        <div class="col-lg-2 col-sm-3 col-md-2 col-xs-12"> 
          <!-- Header Logo --> 
          <a class="logo" title="Magento Commerce" href="index.html"><img alt="Magento Commerce" src="${pageContext.request.contextPath}/resources/furniture/images/logo.png"></a> 
          <!-- End Header Logo --> 
        </div>
        <div class="col-lg-4 col-sm-4 col-md-6 col-xs-12"> 
          <!-- Search-col -->
          <div class="search-box">
            <form action="http://htmldemo.magikcommerce.com/ecommerce/inspire-html-template/furniture/cat" method="POST" id="search_mini_form" name="Categories">
             
              <input type="text" placeholder="Search here..." value="" maxlength="70" class="" name="search" id="search">
              <button style="margin-left: 30px;" id="submit-button" class="search-btn-bg"><span>Tìm kiếm</span></button>
            </form>
          </div>
          <!-- End Search-col --> 
        </div>
        <!-- Top Cart -->
        <div class="col-lg-3 col-sm-5 col-md-4 col-xs-12">
          <div class="top-cart-contain">
            <div class="mini-cart">
              <div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle"> <a href="${pageContext.request.contextPath }/furniture/cart"> <i class="icon-cart"></i>
                <div class="cart-box"><span class="title">Giỏ hàng</span><span id="cart-total"> ${sizeCart } </span></div>
                </a></div>
                
               
              <div>
                <div id="top-cart-content" class="top-cart-content arrow_box">
                  <div  class="block-subtitle">Recently added item(s)</div>
                  <ul id="cart-sidebar" class="mini-products-list">
                    <c:forEach var="cart" items="${cartList }">
                   
                    <li class="item even"> <a class="product-image" href="#" title="Downloadable Product "><img alt="Downloadable Product " src="${pageContext.request.contextPath }/images/${cart.sanPham.hinhAnh}" width="80"></a>
                      <div class="detail-item">
                        <div class="product-details"> <a href="#" title="Remove This Item" onclick="" class="glyphicon glyphicon-remove">&nbsp;</a> <a class="glyphicon glyphicon-pencil" title="Edit item" href="#">&nbsp;</a>
                          <p class="product-name"> <a href="#" title="Downloadable Product">${cart.sanPham.tenSanPham } </a> </p>
                        </div>
                          <fmt:formatNumber currencySymbol="VNĐ" type="number" var="gia"  value="${cart.sanPham.giaGoc-cart.sanPham.giaKhuyenMai}" />
                        <div class="product-details-bottom"> <span class="price">${gia } VNĐ</span> <span class="title-desc">Qty:</span> <strong>${cart.soluong}</strong> </div>
                      </div>
                    </li>
                    <c:set var="sum" value="${sum+(cart.sanPham.giaGoc-cart.sanPham.giaKhuyenMai) }"></c:set>
                     <fmt:formatNumber currencySymbol="VNĐ" type="number" var="giatong"  value="${sum}" />
                     </c:forEach>
                   
                  </ul>
                  <div class="top-subtotal">Subtotal: <span class="price">${giatong } VNĐ</span></div>
                  <div class="actions">
                    <a class="btn-checkout" type="button" href="${pageContext.request.contextPath }/furniture/cart"><span>Checkout</span></a>
                    <a class="view-cart" type="button" href="${pageContext.request.contextPath }/furniture/cart"><span>View Cart</span></a>
                  </div>
                </div>
              </div>
              
             	
            </div>
            <div id="ajaxconfig_info" style="display:none"> <a href="#/"></a>
              <input value="" type="hidden">
              <input id="enable_module" value="1" type="hidden">
              <input class="effect_to_cart" value="1" type="hidden">
              <input class="title_shopping_cart" value="Go to shopping cart" type="hidden">
            </div>
          </div>
         
           <div >
			<c:choose>
				<c:when test="${taikhoan ne null }">
				 <div class="top-cart-contain">
            <div class="mini-cart">
              <div style="" data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle"> <a href="shopping_cart.html"> <i class=""></i>
                <div class="cart-box"><span style="color: #7bbd42; font-weight: bold;  class="title">${taikhoan.hoTen} </span></div>
                </a></div>
              <div>
                <div class="top-cart-content arrow_box" style="display: none;">
                  <ul id="cart-sidebar" class="mini-products-list">
                    <li class="item even"> 
                       <a class="product-image" href="${pageContext.request.contextPath }/furniture/purchase" title="  Sample Product ">Đơn mua</a>
                    </li>
                    <li class="item last odd"> 
                    <a class="product-image" href="${pageContext.request.contextPath }/furniture/login" title="  Sample Product "><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
                     
                    </li>
                  </ul>
                 
                </div>
              </div>
            </div>
            <div id="ajaxconfig_info" style="display:none"> <a href="#/"></a>
              <input value="" type="hidden">
              <input id="enable_module" value="1" type="hidden">
              <input class="effect_to_cart" value="1" type="hidden">
              <input class="title_shopping_cart" value="Go to shopping cart" type="hidden">
            </div>
          </div>
					
				</c:when>
				<c:otherwise>
       				   <div class="login"><a title="Login" href="${pageContext.request.contextPath }/furniture/login"><span>Đăng nhập</span></a></div>
				</c:otherwise>
			</c:choose>
			
        </div>
        </div>
        <!-- End Top Cart --> 
      </div>
    </div>
  </header>