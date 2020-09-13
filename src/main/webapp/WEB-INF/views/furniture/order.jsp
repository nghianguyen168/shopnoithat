<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="main container">
	<div class="col-main">
<div class="cart wow">
          <div class="page-title">
          <br>
          <br>
            <h2>ĐƠN HÀNG ĐÃ ĐẶT</h2>
          </div>
          <div class="table-responsive">
            <form method="post" action="#updatePost/">
              <input type="hidden" value="Vwww7itR3zQFe86m" name="form_key">
              <fieldset>
              <c:if test="${not empty msg}">
							<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
								<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
							</div>
			</c:if>
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
                  <c:forEach var="donhang" items="${donHangUser }">
                  <tfoot>
                    <tr class="first last">
                      <td colspan="50"><button style="display: none;" onclick="setLocation('#')" class="" title="Continue Shopping" type="button"></button>
                        <button class="button btn-update" title="Update Cart" value="update_qty" name="update_cart_action" type="submit"><span><span>Đánh dấu đã nhận hàng</span></span></button>
                        <button id="empty_cart_button" class="button btn-empty" title="Clear Cart" value="empty_cart" name="update_cart_action" type="submit"><span><span>Hủy đơn hàng</span></span></button></td>
                    </tr>
                  </tfoot>
                  <thead>
                    <tr class="first last">
                      <th rowspan="1">&nbsp;</th>
                      <th rowspan="1"><span class="nobr">Đơn hàng ${donhang.id }-Đang giao hàng</span></th>
                      <th rowspan="1"></th>
                      <th colspan="1" class="a-center"><span class="nobr">${donhang.diaChiNguoiMua }</span></th>
                      <th class="a-center" rowspan="1"></th>
                      
                      <th class="a-center" rowspan="1">&nbsp;</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  <c:forEach var="ct" items="${ctList }">
                  <c:if test="${ct.id_DonHang == donhang.id }">
                    <tr class="first odd">
                      <td class="image"><a class="product-image" title="Sample Product" href="${pageContext.request.contextPath }/images/${ct.sanPham.hinhAnh}"><img width="75" alt="Sample Product" src="${pageContext.request.contextPath }/images/${ct.sanPham.hinhAnh}"></a></td>
                      <td><h2 class="product-name"> <a href="#/women-s-crepe-printed-black/">${ct.sanPham.tenSanPham} (x${ct.soluong })</a> </h2></td>
                      <td class="a-center"><a title="Edit item parameters" class="edit-bnt" href="#configure/id/15945/"></a></td>
                     <fmt:formatNumber currencySymbol="VNĐ" type="number" var="giatien"
											value="${ct.gia*ct.soluong}" />
                      <td class="a-right movewishlist"><span class="cart-price"> <span class="price">${giatien}</span> </span></td>
                      
                   <c:set var="sumall"
										value="${sumall+ct.gia*ct.soluong}" />
									<fmt:formatNumber currencySymbol="VNĐ" type="number"
										var="tongtien" value="${sumall}" />
                    </tr>
                    </c:if>
                  </c:forEach>
                     <tr class="last even">
                      <td class="image"></td>
                      <td><h2 class="product-name"> </h2></td>
                      <td class="a-center"><strong>Tổng:</strong></td>
                     <fmt:formatNumber currencySymbol="VNĐ" type="number" var="tongtien"
											value="${donhang.tong}" />
                      <td class="a-right movewishlist"><span class="cart-price"> <span class="price">${tongtien }</span> </span></td>
                    </tr>
                  </tbody>
                  </c:forEach>
              
                </table>
              </fieldset>
            </form>
          </div>
          <!-- BEGIN CART COLLATERALS -->
          <!--cart-collaterals--> 
          
        </div>
        </div>
        </div>
