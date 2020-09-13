<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
 <div class="main container">
       <div class="account-login">
        <div class="page-title">
          <h2>ĐĂNG NHẬP HOẶC TẠO MỘT TÀI KHOẢN</h2>
        </div>
        <fieldset class="col2-set">
          <legend>ĐĂNG NHẬP HOẶC TẠO MỘT TÀI KHOẢN</legend>
          <div class="col-1 new-users"><strong>NHỮNG KHÁCH HÀNG MỚI</strong>
            <div class="content">
              <p>Bằng cách tạo tài khoản với cửa hàng của chúng tôi, bạn sẽ có thể chuyển qua quy trình thanh toán nhanh hơn, lưu trữ nhiều địa chỉ giao hàng, xem và theo dõi đơn hàng của bạn trong tài khoản của bạn và hơn thế nữa.</p>
              <div class="buttons-set">
              </div>
            </div>
          </div>
          <div class="col-2 registered-users"><strong>ĐĂNG KÝ TÀI KHOẢN</strong>
          <c:if test="${not empty msg}">
  				<div class="alert alert-success" role="alert">
					 	Trùng tên đăng nhập
					</div>
  			</c:if>
            <div class="content">
              <form  method="post" action="${pageContext.request.contextPath }/furniture/signup">
              
              <ul class="form-list">
                <li>
                  <label for="email">Tên đăng nhập:  <span class="required">*</span></label>
                  <br>
                  <input pattern=".{6,}"  type="text" title="Tên đăng nhập phải lớn hơn hoặc bằng 6 ký tự" class="input-text required-entry" id="email" value="" name="username" required="">
                </li>
                <li>
                  <label for="email">Họ tên đầy đủ:  <span class="required">*</span></label>
                  <br>
                  <input pattern=".{6,}"  type="text" title="Họ tên phải lớn hơn hoặc bằng 6 ký tự" type="text"  class="input-text required-entry" id="fullname" value="" name="hoten" required="required">
                </li>
                <li>
                  <label for="pass">Mật khẩu <span class="required">*</span></label>
                  
                  <br>
                   <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Phải chứa ít nhất một số và một chữ cái viết hoa và viết thường và ít nhất 8 ký tự trở lên" type="password" title="Password" id="pass" class="input-text required-entry validate-password" name="matkhau" required="required"></li>
                  <!--
                   <li>
                  <label for="pass">Nhập lại mật khẩu <span class="required">*</span></label>
                  <br>
                  <input type="password" title="Re-Password" id="pass" class="input-text required-entry validate-password" name="re-password" required="required"></li> -->
              	<li>
                  <label for="email">Email:  <span class="required">*</span></label>
                  <br>
                  <input  type="email"  class="input-text required-entry" id="fullname" value="" name="email" required="required">
                </li>
                <li>
                  <label for="email">Số điện thoại:  <span class="required">*</span></label>
                  <br>
                  <input pattern=".{10,}"  type="text" title="Số điện thoại phải lớn hơn hoặc bằng 6 ký tự" type="text"  class="input-text required-entry" id="fullname" value="" name="phone" required="required">
                </li>
              </ul>
              <p class="required">* Phần bắt buộc</p>
              <div class="buttons-set">
                <input id="send2" name="send" type="submit" class="button login" value="Đăng nhập" />
                <a class="forgot-word" href="http://demo.magentomagik.com/computerstore/customer/account/forgotpassword/">Quên mật khẩu?</a> </div>
            
            </form>
            </div>
          </div>
        </fieldset>
      </div>
      <br>
      <br>
      <br>
      <br>
      <br>
    </div>