<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>Đăng Nhập</title>
    <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 
    
    <link rel="stylesheet" href="css/main.min.css">
    <link rel="stylesheet" href="css/weather-icon.css">
    <link rel="stylesheet" href="css/weather-icons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/color.css">
    <link rel="stylesheet" href="css/responsive.css">

</head>
<body>
	<div class="www-layout">
        <section>
        	<div class="gap no-gap signin whitish medium-opacity">
                <div class="bg-image" style="background-image:url(images/resources/theme-bg.jpg)"></div>
                <div class="container">
                	<div class="row">
                        <div class="col-lg-8">
                            <div class="big-ad">
                                <figure><img src="images/logo2.png" alt=""></figure>
                                <h1>Chào Mừng Bạn đến với Tóp Tóp</h1>
                                <p>
                                     Tóp Tóp nơi quy tụ anh hùng tứ phương, nơi chúng ta giao lưu kết bạn, tìm anh em chiến hữu trò chuyện, ngoài ra, nếu bạn là một người vẫn chưa tìm được một nửa của mình có thể đến với Tóp Tóp - Nơi chúng tôi tạo ra một nơi giúp bạn tìm gấu dễ dàng hơn !!!                             
                                </p>
                                
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="we-login-register">
                                <div class="form-title">
                                    <i class="fa fa-key"></i>Đăng Nhập
                                    <span>đăng nhập để kết nối với bạn bè trên khắp thế giới.</span>
                                    
                                    
                                </div>
                                <form action="login_controller" class="we-form" method="post">
                                    <input autocomplete="off" type="text" placeholder="Email" name="email">
                                    <input  autocomplete="off" type="password" placeholder="Password" name="password">
                                    <input type="checkbox"><label>nhớ tài khoản</label>
                                    <button type="submit" data-ripple="">Đăng nhập</button>
                                    <a class="forgot underline" href="forgetPassword.jsp" title="">quên mật khẩu?</a>
                                </form>
                                <c:if test="${sessionScope.loginFail == false}">
                                    <span>Tài khoản hoặc mật khẩu không chính xác.</span>
                                </c:if>
                                <span>Bạn chưa có tài khoản? <a class="we-account underline" href="register.jsp" title="">đăng ký ngay</a></span>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>
         
    </div>
    <script>
        
    </script>
    	<script src="js/main.min.js"></script>
        <script src="js/script.js"></script>
</body>	

</html>
