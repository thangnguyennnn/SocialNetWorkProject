<%-- 
    Document   : confirm
    Created on : Feb 17, 2022, 5:06:34 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>Confirm</title>
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
            <div class="gap no-gap signin whitish medium-opacity register">
                <div class="bg-image" style="background-image:url(images/resources/theme-bg.jpg)"></div>
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12">
                            <div class="we-login-register">
                                <div class="form-title">
                                    <i class="fa fa-check"></i>Mã Xác Nhận
                                    <span>Nhận mã xác nhận để hoàn tất thủ tục đăng ký</span>
                                </div>
                                <form class="we-form" method="post">
                                    <input  autocomplete="off" type="text" placeholder="Nhập Mã Xác Nhận Tài Khoản">

                                    <button type="submit" data-ripple="">Xác Nhận </button>

                                </form>

                                <!-- <span>already have an account? <a class="we-account underline" href="#" title="">Sign in</a></span> -->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

    </div>

    <script src="js/main.min.js"></script>
    <script src="js/script.js"></script>
</body>

</html>
