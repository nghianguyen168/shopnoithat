<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
 <!DOCTYPE html>
<%-- <c:set var="contextPath" value="${pageContext.request.contextPath}/admin/kho" /> --%>
 <div class="main container">
      <div class="row">
        <section class="col-main col-sm-9 col-sm-push-3 wow">
          <div class="category-title">
            <h1>Tops &amp; Tees</h1>
          </div>
          <!-- category banner -->
       
          <!-- category banner -->
          <div class="category-products">
            <div class="toolbar">
             
              <div id="sort-by">
                <label class="left">Hiển thị theo: </label>
                <ul>
                  <li><a href="#"><span class="right-arrow"></span></a>
                    <ul>
                      <li><a href="#">Tên</a></li>
                      <li><a href="#">Giá</a></li>
                    </ul>
                  </li>
                </ul>
                <a class="button-asc left" href="#" title="Set Descending Direction"><span style="color:#999;font-size:11px;" class="glyphicon glyphicon-arrow-up"></span></a> </div>
              <div class="pager">
              
                <div class="pages">
                  <label>Page:</label>
                  <ul class="pagination">
                  <c:if test="${page>1 }">
                    <li><a href="${pageContext.request.contextPath }/furniture/cat/${cid}/${page-1}">«</a></li>
                  </c:if>
                  	<c:forEach begin="1" end="${totalPage }" var="i">
                  		<c:choose>
                  			<c:when test="${page==i }">
                  				<li class="active"><a href="${pageContext.request.contextPath }/furniture/cat/${cid}/${i}">${i }</a></li>
                  			</c:when>
                  			<c:otherwise>
                  				<li class=""><a href="${pageContext.request.contextPath }/furniture/cat/${cid}/${i}">${i }</a></li>
                  			</c:otherwise>
                  		</c:choose>
                  	</c:forEach>
                  
                  </ul>
                </div>
              </div>
            </div>
            <ul class="products-grid">
            <c:if test="${sanphamList ne null }">
            	<c:forEach items="${sanphamList }" var="product">
            		<li class="item col-lg-4 col-md-4 col-sm-6 col-xs-6">
                <div class="col-item">
                <c:if test="${product.giaKhuyenMai > 0 }">
                  <div class="sale-label sale-top-right">Sale</div>
                  </c:if>
                  <input style="display: none;" id="pID" value="${product.id }" />
                  <div class="images-container"> <a class="product-image" title="Sample Product" href="product_detail.html"> 
                  <img src="${pageContext.request.contextPath}/images/${product.hinhAnh}" class="img-responsive" alt="a"> </a>
                    <div class="actions">
                      <div class="actions-inner">
                        <a  title="Add to Cart" href="javascript:void(0)" onclick="addToCart(${product.id})" class="button btn-cart"><span>Add to Cart</span></a>
                        <ul class="add-to-links">
                          <li><a href="wishlist.html" title="Add to Wishlist" class="link-wishlist"><span>Add to Wishlist</span></a></li>
                          
                        </ul>
                      </div>
                    </div>
                    <div class="qv-button-container"> <a class="qv-e-button btn-quickview-1" href="${pageContext.request.contextPath }/furniture/detail/${product.id}"><span><span>Quick View</span></span></a> </div>
                  </div>
                  <div class="info">
                    <div class="info-inner">
                      <div class="item-title"> <a title=" Sample Product" href="product_detail.html"> ${product.tenSanPham } </a> </div>
                      <!--item-title-->
                      <div class="item-content">
                        <div class="ratings">
                          <div class="rating-box">
                            <div style="width:${product.sao}%" class="rating"></div>
                          </div>
                        </div>
                        <div class="price-box">
                        <fmt:formatNumber currencySymbol="VNĐ" type="number" var="giagoc"  value="${product.giaGoc}" />
                        <fmt:formatNumber currencySymbol="VNĐ" type="number" var="giakm"  value="${product.giaGoc - product.giaKhuyenMai}" />
                          <p class="special-price"> <span class="price"> ${giakm	 } </span> </p>
                          <p class="old-price"> <span class="price-sep">-</span> <span class="price"> ${giagoc } </span> </p>
                        </div>
                      </div>
                      <!--item-content--> 
                    </div>
                    <!--info-inner--> 
                    
                    <!--actions-->
                    <h3 id="hihi"></h3>
                    
                    <div class="clearfix"> </div>
                  </div>
                </div>
              </li>
                 <script type="text/javascript">
                 	
					function addToCart(id) {
			
						var productID =id;
						var total = parseInt($("#cart-total").text());
						
			
						$.ajax({
							type : "POST",
							
							url :"${pageContext.request.contextPath}/furniture/addCart",
							
							data : {
								pID : productID,
								
							},
						
							success : function(data) {
								console.log("SUCCESS: ", data);
								
								$("#cart-total").html(total+1);
								
							},
							error : function(e) {
								alert('dhfd');
								console.log("ERROR: ", e);
							}
						});
					}
					
					</script>        
            	</c:forEach>
            </c:if>
       
   
              
        </section>
        <aside class="col-left sidebar col-sm-3 col-xs-12 col-sm-pull-9 wow">
          <div class="side-nav-categories">
            <div class="block-title"> Categories </div>
            <!--block-title--> 
            <!-- BEGIN BOX-CATEGORY -->
            <div class="box-content box-category">
              <ul>
                <li> <a class="active" href="#/women.html">Women</a> <span class="subDropdown minus"></span>
                  <ul class="level0_415" style="display:block">
                    <li> <a href="#/women/tops.html"> Tops </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/women/tops/evening-tops.html"> Evening Tops </a> </li>
                        <li> <a href="#/women/tops/shirts-blouses.html"> Shirts &amp; Blouses </a> </li>
                        <li> <a href="#/women/tops/tunics.html"> Tunics </a> </li>
                        <li> <a href="#/women/tops/vests.html"> Vests </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/women/bags.html"> Bags </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/women/bags/bags.html"> Bags </a> </li>
                        <li> <a href="#/women/bags/designer-handbags.html"> Designer Handbags </a> </li>
                        <li> <a href="#/women/bags/purses.html"> Purses </a> </li>
                        <li> <a href="#/women/bags/shoulder-bags.html"> Shoulder Bags </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/women/shoes.html"> Shoes </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/women/shoes/flat-shoes.html"> Flat Shoes </a> </li>
                        <li> <a href="#/women/shoes/flat-sandals.html"> Flat Sandals </a> </li>
                        <li> <a href="#/women/shoes/boots.html"> Boots </a> </li>
                        <li> <a href="#/women/shoes/heels.html"> Heels </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/women/Jewellery.html"> Jewellery </a>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/women/Jewellery/bracelets.html"> Bracelets </a> </li>
                        <li> <a href="#/women/Jewellery/necklaces-pendants.html"> Necklaces &amp; Pendants </a> </li>
                        <li> <a href="#/women/Jewellery/pins-brooches.html"> Pins &amp; Brooches </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/women/dresses.html"> Dresses </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/women/dresses/casual-dresses.html"> Casual Dresses </a> </li>
                        <li> <a href="#/women/dresses/evening.html"> Evening </a> </li>
                        <li> <a href="#/women/dresses/designer.html"> Designer </a> </li>
                        <li> <a href="#/women/dresses/party.html"> Party </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/women/lingerie.html"> Lingerie </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/women/lingerie/bras.html"> Bras </a> </li>
                        <li> <a href="#/women/lingerie/bodies.html"> Bodies </a> </li>
                        <li> <a href="#/women/lingerie/necklaces-pendants.html"> Lingerie Sets </a> </li>
                        <li> <a href="#/women/lingerie/shapewear.html"> Shapewear </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/women/jackets.html"> Jackets </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/women/jackets/coats.html"> Coats </a> </li>
                        <li> <a href="#/women/jackets/jackets.html"> Jackets </a> </li>
                        <li> <a href="#/women/jackets/leather-jackets.html"> Leather Jackets </a> </li>
                        <li> <a href="#/women/jackets/blazers.html"> Blazers </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/women/swimwear.html"> Swimwear </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/women/swimwear/swimsuits.html"> Swimsuits </a> </li>
                        <li> <a href="#/women/swimwear/beach-clothing.html"> Beach Clothing </a> </li>
                        <li> <a href="#/women/swimwear/bikinis.html"> Bikinis </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                  </ul>
                  <!--level0--> 
                </li>
                <!--level 0-->
                <li> <a href="#/men.html">Men</a> <span class="subDropdown plus"></span>
                  <ul class="level0_455" style="display:none">
                    <li> <a href="#/men/shoes.html"> Shoes </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/men/shoes/flat-shoes.html"> Flat Shoes </a> </li>
                        <li> <a href="#/men/shoes/boots.html"> Boots </a> </li>
                        <li> <a href="#/men/shoes/heels.html"> Heels </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/men/Jewellery.html"> Jewellery </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/men/Jewellery/bracelets.html"> Bracelets </a> </li>
                        <li> <a href="#/men/Jewellery/necklaces-pendants.html"> Necklaces &amp; Pendants </a> </li>
                        <li> <a href="#/men/Jewellery/pins-brooches.html"> Pins &amp; Brooches </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/men/dresses.html"> Dresses </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/men/dresses/casual-dresses.html"> Casual Dresses </a> </li>
                        <li> <a href="#/men/dresses/evening.html"> Evening </a> </li>
                        <li> <a href="#/men/dresses/designer.html"> Designer </a> </li>
                        <li> <a href="#/men/dresses/party.html"> Party </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/men/jackets.html"> Jackets </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/men/jackets/coats.html"> Coats </a> </li>
                        <li> <a href="#/men/jackets/jackets.html"> Jackets </a> </li>
                        <li> <a href="#/men/jackets/leather-jackets.html"> Leather Jackets </a> </li>
                        <li> <a href="#/men/jackets/blazers.html"> Blazers </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/men/swimwear.html"> Swimwear </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/men/swimwear/swimsuits.html"> Swimsuits </a> </li>
                        <li> <a href="#/men/swimwear/beach-clothing.html"> Beach Clothing </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                  </ul>
                  <!--level0--> 
                </li>
                <!--level 0-->
                <li> <a href="#.html">Electronics</a> <span class="subDropdown plus"></span>
                  <ul class="level0_482" style="display:none">
                    <li> <a href="#/smartphones.html"> Smartphones </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/smartphones/samsung.html"> Samsung </a> </li>
                        <li> <a href="#/smartphones/apple.html"> Apple </a> </li>
                        <li> <a href="#/smartphones/blackberry.html"> Blackberry </a> </li>
                        <li> <a href="#/smartphones/nokia.html"> Nokia </a> </li>
                        <li> <a href="#/smartphones/htc.html"> HTC </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/cameras.html"> Cameras </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/cameras/digital-cameras.html"> Digital Cameras </a> </li>
                        <li> <a href="#/cameras/camcorders.html"> Camcorders </a> </li>
                        <li> <a href="#/cameras/lenses.html"> Lenses </a> </li>
                        <li> <a href="#/cameras/filters.html"> Filters </a> </li>
                        <li> <a href="#/cameras/tripod.html"> Tripod </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                    <li> <a href="#/accesories.html"> Accesories </a> <span class="subDropdown plus"></span>
                      <ul class="level1" style="display:none">
                        <li> <a href="#/accesories/headsets.html"> HeadSets </a> </li>
                        <li> <a href="#/accesories/batteries.html"> Batteries </a> </li>
                        <li> <a href="#/accesories/screen-protectors.html"> Screen Protectors </a> </li>
                        <li> <a href="#/accesories/memory-cards.html"> Memory Cards </a> </li>
                        <li> <a href="#/accesories/cases.html"> Cases </a> </li>
                        <!--end for-each -->
                      </ul>
                      <!--level1--> 
                    </li>
                    <!--level1-->
                  </ul>
                  <!--level0--> 
                </li>
                <!--level 0-->
                <li> <a href="#/digital.html">Digital</a> </li>
                <!--level 0-->
                <li class="last"> <a href="#/fashion.html">Fashion</a> </li>
                <!--level 0-->
              </ul>
            </div>
            <!--box-content box-category--> 
          </div>
          <div class="block block-layered-nav">
            <div class="block-title"><span>Shop By</span></div>
            <div class="block-content">
              <p class="block-subtitle">Shopping Options</p>
              <dl id="narrow-by-list">
                <dt class="odd">Price</dt>
                <dd class="odd">
                  <ol>
                    <li> <a href="#"><span class="price">$0.00</span> - <span class="price">$99.99</span></a> (6) </li>
                    <li> <a href="#"><span class="price">$100.00</span> and above</a> (6) </li>
                  </ol>
                </dd>
                <dt class="even">Manufacturer</dt>
                <dd class="even">
                  <ol>
                    <li> <a href="#">TheBrand</a> (9) </li>
                    <li> <a href="#">Company</a> (4) </li>
                    <li> <a href="#">LogoFashion</a> (1) </li>
                  </ol>
                </dd>
                <dt class="odd">Color</dt>
                <dd class="odd">
                  <ol>
                    <li> <a href="#">Green</a> (1) </li>
                    <li> <a href="#">White</a> (5) </li>
                    <li> <a href="#">Black</a> (5) </li>
                    <li> <a href="#">Gray</a> (4) </li>
                    <li> <a href="#">Dark Gray</a> (3) </li>
                    <li> <a href="#">Blue</a> (1) </li>
                  </ol>
                </dd>
                <dt class="last even">Size</dt>
                <dd class="last even">
                  <ol>
                    <li> <a href="#">S</a> (6) </li>
                    <li> <a href="#">M</a> (6) </li>
                    <li> <a href="#">L</a> (4) </li>
                    <li> <a href="#">XL</a> (4) </li>
                  </ol>
                </dd>
              </dl>
            </div>
          </div>
          <div class="block block-cart">
            <div class="block-title"><span>My Cart</span></div>
            <div class="block-content">
              <div class="summary">
                <p class="amount">There are <a href="#">2 items</a> in your cart.</p>
                <p class="subtotal"> <span class="label">Cart Subtotal:</span> <span class="price">$27.99</span> </p>
              </div>
              <div class="ajax-checkout">
                <button type="submit" title="Submit" class="button button-checkout"><span>Checkout</span></button>
              </div>
              <p class="block-subtitle">Recently added item(s) </p>
              <ul>
                <li class="item"> <a class="product-image" title="Fisher-Price Bubble Mower" href="#"><img width="80" alt="Fisher-Price Bubble Mower" src="${pageContext.request.contextPath}/resources/furniture/products-images/product1.jpg"></a>
                  <div class="product-details">
                    <div class="access"> <a class="btn-remove1" title="Remove This Item" href="#"> <span class="icon"></span> Remove </a> </div>
                    <p class="product-name"> <a href="#">Skater Dress In Leaf Print Grouped Product</a> </p>
                    <strong>1</strong> x <span class="price">$19.99</span> </div>
                </li>
                <li class="item last"> <a class="product-image" title="Prince Lionheart Jumbo Toy Hammock" href="#"><img width="80" alt="Prince Lionheart Jumbo Toy Hammock" src="${pageContext.request.contextPath}/resources/furniture/products-images/product8.jpg"></a>
                  <div class="product-details">
                    <div class="access"> <a class="btn-remove1" title="Remove This Item" href="#"> <span class="icon"></span> Remove </a> </div>
                    <p class="product-name"> <a href="#"> Sample Fashion Product Prince Lionheart </a> </p>
                    <strong>1</strong> x <span class="price">$8.00</span> 
                    <!--access clearfix--> 
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div class="block block-subscribe">
            <div class="block-title"><span>Newsletter</span></div>
            <form action="#" method="post" id="newsletter-validate-detail">
              <div class="block-content">
                <div class="form-subscribe-header"> Sign up for our newsletter:</div>
                <input type="text" name="email" id="newsletter" title="" class="input-text required-entry validate-email" placeholder="Enter your email address">
                <div class="actions">
                  <button type="submit" title="Submit" class="subscribe"><span>Subscribe</span></button>
                </div>
              </div>
            </form>
          </div>
         
          <div class="block block-tags">
            <div class="block-title"><span>Popular Tags</span></div>
            <div class="block-content">
              <ul class="tags-list">
                <li><a style="font-size:98.3333333333%;" href="#tagId/23/">Camera</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/109/">Hohoho</a></li>
                <li><a style="font-size:145%;" href="#tagId/27/">SEXY</a></li>
                <li><a style="font-size:75%;" href="#tagId/61/">Tag</a></li>
                <li><a style="font-size:110%;" href="#tagId/29/">Test</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/17/">bones</a></li>
                <li><a style="font-size:110%;" href="#tagId/12/">cool</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/184/">cool t-shirt</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/173/">crap</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/41/">good</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/16/">green</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/5/">hip</a></li>
                <li><a style="font-size:75%;" href="#tagId/51/">laptop</a></li>
                <li><a style="font-size:75%;" href="#tagId/20/">mobile</a></li>
                <li><a style="font-size:75%;" href="#tagId/70/">nice</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/42/">phone</a></li>
                <li><a style="font-size:98.3333333333%;" href="#tagId/30/">red</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/28/">tight</a></li>
                <li><a style="font-size:75%;" href="#tagId/2/">trendy</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/4/">young</a></li>
              </ul>
              <div class="actions"> <a class="view-all" href="#">View All Tags</a> </div>
            </div>
          </div>
          <div class="block block-banner"><a href="#"><img src="images/block-banner.png" alt="block-banner"></a></div>
        </aside>
      </div>
    </div>