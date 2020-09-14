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
            
              <input type="hidden" value="Vwww7itR3zQFe86m" name="form_key">
              <fieldset>
              <c:if test="${not empty msg}">
							<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
								<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
							</div>
			</c:if>
                <table class="data-table cart-table" id="shopping-cart-table-order">
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
                  
                  <thead>
                    <tr class="first last">
                      <th rowspan="1">&nbsp;</th>
                      
                      <th rowspan="2"><span class="nobr">Đơn hàng ${donhang.id }-<c:set var="trangthai" value="" />
									<c:choose>
										<c:when test="${donhang.trangThaiDonHang==1}">
											<c:set var="trangthai" value="Đang đợi shop xác nhận đơn" />
											<span class="label label-sm label-warning">${trangthai}</span>
										</c:when>
										<c:when test="${donhang.trangThaiDonHang==2}">
											<c:set var="trangthai" value="Đang giao hàng" />
											<span class="label label-sm label-info arrowed arrowed-righ">${trangthai}</span>
										</c:when>
										<c:when test="${donhang.trangThaiDonHang==3}">
											<c:set var="trangthai" value="Đơn đã giao" />
											<span class="label label-sm label-success">${trangthai}</span>
										</c:when>
										<c:when test="${donhang.trangThaiDonHang==0}">
											<c:set var="trangthai" value="Đã hủy" />
											<span class="label label-sm label-warning">${trangthai}</span>
										</c:when>
										
									</c:choose></span></th>
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
                  
                    <tr class="function_order first last" id="huy${donhang.id }">
                      <td colspan="50"><button style="display: none;" onclick="setLocation('#')" class="" title="Continue Shopping" type="button"></button>
                        <button id="danhdau_nhanhang${donhang.id }" class="button btn-update" title="Update Cart" value="" name="update_cart_action" ><span><span>Đánh dấu đã nhận hàng</span></span></button>
                        <button id="huydon${donhang.id }" class="button btn-empty" title="Clear Cart" value="empty_cart" name="update_cart_action" ><span><span>Hủy đơn hàng</span></span></button></td>
                    </tr>
                   
             
                    </tr>
                    
                  </tbody>
                  
                   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
                    <script type="text/javascript">

							                	window.document_clicked = false;
												$(document).on('click','#danhdau_nhanhang${donhang.id }',function(e){
													$('#huydon${donhang.id }').hide();
															var id = Number(${donhang.id });
														$.ajax({
															url: '${pageContext.request.contextPath}/furniture/purchase/confirm',
															type : 'POST',
															cache : false,
															data : {
																id_donhang:id
																
															},
															success : function(response) {
															console.log(response);
															/* location.reload(false);  */
															
															 $(this).closest('.function_order').hide(); 
															$('#shopping-cart-table-order').load(" #shopping-cart-table-order");
															
														},
														error: function(response)
													    {
															alert("Có lỗi xảy ra!");
													    }
														

												});
										return false;
									});
				</script>
                    <script type="text/javascript">

							                	window.document_clicked = false;
												$(document).on('click','#huydon${donhang.id}',function(e){
															var id = Number(${donhang.id });
														$.ajax({
															url: '${pageContext.request.contextPath}/furniture/purchase/cancel',
															type : 'POST',
															cache : false,
															data : {
																id_donhang:id
																
															},
															success : function(response) {
															console.log(response);
															/* location.reload(false);  */
															$('huy${donhang.id}').toggle();
															$('#shopping-cart-table-order').load(" #shopping-cart-table-order");
															
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
              
                </table>
              </fieldset>
            
          </div>
          <!-- BEGIN CART COLLATERALS -->
          <!--cart-collaterals--> 
          
        </div>
        </div>
        </div>
