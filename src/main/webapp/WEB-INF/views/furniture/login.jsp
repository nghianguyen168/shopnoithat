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
                <button  onclick="window.location.href='${pageContext.request.contextPath}/furniture/signup';" class="button create-account" type="button"><span>TẠO TÀI KHOẢN</span></button>
              </div>
            </div>
          </div>
          <div class="col-2 registered-users"><strong>KHÁCH HÀNG ĐÃ ĐĂNG KÝ</strong>
            <div class="content">
              <p>Nếu bạn có tài khoản với chúng tôi, vui lòng đăng nhập.</p>
             <c:if test="${not empty param['msg']}">
             	<div class="alert alert-danger" role="alert">
					 	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> Sai tên đăng nhập hoặc mật khẩu!
					</div>
             </c:if>
          
              <form  method="post">
              
              <ul class="form-list">
                <li>
                  <label for="email">Địa chỉ email  <span class="required">*</span></label>
                  <br>
                  <input type="text" title="Email Address" class="input-text required-entry" id="email" value="" name="username">
                </li>
                <li>
                  <label for="pass">Mật khẩu <span class="required">*</span></label>
                  <br>
                  <input type="password" title="Password" id="pass" class="input-text required-entry validate-password" name="password"></li>
              </ul>
              <p class="required">* Phần bắt buộc</p>
              <div class="buttons-set">
                <input id="send2" name="send" type="submit" class="button login" value="Đăng nhập" />
                <a class="forgot-word" href="http://demo.magentomagik.com/computerstore/customer/account/forgotpassword/">Quên mật khẩu?</a> </div>
            </div>
            </form>
          </div>
        </fieldset>
      </div>
      <br>
      <br>
      <br>
      <br>
      <br>
    </div>