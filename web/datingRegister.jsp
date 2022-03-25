<%-- 
    Document   : datingEdit
    Created on : Feb 19, 2022, 4:26:33 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>Edit Dating Information</title>
        <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 

        <link rel="stylesheet" href="css/main.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/color-pink.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>

    <body>
        <div class="wavy-wraper">
            <div class="wavy">
                <span style="--i:1;">p</span>
                <span style="--i:2;">i</span>
                <span style="--i:3;">t</span>
                <span style="--i:4;">n</span>
                <span style="--i:5;">i</span>
                <span style="--i:6;">k</span>
                <span style="--i:7;">.</span>
                <span style="--i:8;">.</span>
                <span style="--i:9;">.</span>
            </div>
        </div>
        <div class="theme-layout">

            <jsp:include page="topbar.jsp"></jsp:include>

                <section>
                    <div class="gap2">
                        <div class="container">
                            <div class="row">
                                <div class="offset-lg-1 col-lg-10">
                                    <div class="featured-baner mate-black ext-low-opacity">
                                        <img style="height: 300px;" src="images/yeye.jpg" alt="">
                                        <h2>Đi tìm <br><span>tình yêu</span></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>	
                </section><!-- top banner -->

                <section>
                    <div class="gap gray-bg">
                        <div class="container">
                            <div class="row" id="page-contents">
                                <div class="offset-lg-1 col-lg-10">
                                    <div class="typography">
                                        <form action="editDatingProfile" method="post" class="validate-form " enctype="multipart/form-data">
                                            <div class="c-form central-meta">	
                                                <h3 class="title2">Hồ sơ hẹn hò:</h3>
                                                <div class="row">
                                                    <div class=" col-lg-6">
                                                        <label>Tên hiển thị</label>
                                                        <input autocomplete="off" type="text" placeholder="Vd: Ngôi sao siêu ngố" name="nickName" value="${dP.nickName}">
                                                </div>
                                                <div class=" col-lg-6">
                                                    <label>Địa điểm hẹn hò</label>
                                                    <input autocomplete="off" type="text" placeholder="Vd: Đà Nẵng" class="validate" required="" name="location" value="${dP.location}">
                                                    <span class="message">Vui lòng nhập địa điểm hẹn hò</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class=" col-lg-6">
                                                    <label>Ngày sinh</label>
                                                    <input autocomplete="off" type="date" class="validate" name="birthDate" value="${dP.birthDate}" required="">
                                                    <span class="message">Nhập ngày sinh đi</span>
                                                </div>
                                            </div>
                                            <style>
                                                .radioStyle{
                                                    margin: 0;
                                                    display: inline-block;
                                                    width: 60%;
                                                    background-color: #edf2f6;
                                                    padding: 10px;
                                                    border-radius: 26px;
                                                    margin-left: 40px;
                                                    margin-right: 20px;
                                                }
                                            </style>
                                            <style>
                                                .sRadidoStyle{
                                                    margin-left: 45px;
                                                }
                                            </style>
                                            <div>
                                                <label>Giới tính</label>
                                                <div class="form-radio radioStyle">
                                                    <div class="radio sRadidoStyle">
                                                        <label>
                                                            <input type="radio" name="sex" checked="" ${dP.sex == "Nam" ? "checked":""} value="Nam"><i class="check-box"></i>Nam
                                                        </label>
                                                    </div>
                                                    <div class="radio sRadidoStyle">
                                                        <label>
                                                            <input type="radio" name="sex" ${dP.sex == "Nữ" ? "checked":""} value="Nữ"><i class="check-box"></i>Nữ
                                                        </label>
                                                    </div>
                                                    <div class="radio sRadidoStyle">
                                                        <label>
                                                            <input type="radio" name="sex" ${dP.sex == "Giới tính khác" ? "checked":""} value="Giới tính khác"><i class="check-box"></i>Giới tính khác
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <label>Con cái</label>
                                                <div class="form-radio radioStyle">
                                                    <div class="radio" style="margin-left: 45px;">
                                                        <label>
                                                            <input type="radio" name="child" checked="" ${dP.child == "Chưa có" ? "checked":""} value="Chưa có"><i class="check-box"></i>Chưa có
                                                        </label>
                                                    </div>
                                                    <div class="radio" style="margin-left: 21px;">
                                                        <label>
                                                            <input type="radio" name="child" ${dP.child == "Đã có" ? "checked":""} value="Đã có"><i class="check-box"></i>Đã có
                                                        </label>
                                                    </div>
                                                    <div class="radio" style="margin-left: 26px;">
                                                        <label>
                                                            <input type="radio" name="child" ${dP.child == "Không muốn tiết lộ" ? "checked":""} value="Không muốn tiết lộ"><i class="check-box"></i>Không muốn tiết lộ
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <label>Đối tường tìm kiếm:</label>
                                                <div class="form-radio radioStyle" style="width: 70%">
                                                    <div class="radio sRadidoStyle">
                                                        <label>
                                                            <input type="radio" name="gender" checked="" ${dP.gender == "Nam" ? "checked":""} value="Nam"><i class="check-box"></i>Nam
                                                        </label>
                                                    </div>
                                                    <div class="radio sRadidoStyle">
                                                        <label>
                                                            <input type="radio" name="gender" ${dP.gender == "Nữ" ? "checked":""} value="Nữ"><i class="check-box"></i>Nữ
                                                        </label>
                                                    </div>
                                                    <div class="radio sRadidoStyle">
                                                        <label>
                                                            <input type="radio" name="gender" ${dP.gender == "Giới tính khác" ? "checked":""} value="Giới tính khác"><i class="check-box"></i>Giới tính khác
                                                        </label>
                                                    </div>
                                                    <div class="radio sRadidoStyle">
                                                        <label>
                                                            <input type="radio" name="gender" ${dP.gender == "Tất cả" ? "checked":""} value="Tất cả"><i class="check-box"></i>Tất cả
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <label>Học vấn</label>
                                                <input autocomplete="off" type="text" placeholder="Vd: Đại học Harvard chùa láng" name="education" value="${dP.education}">
                                            </div>
                                            <div>
                                                <label>Công việc</label>
                                                <input autocomplete="off" type="text" placeholder="Vd: Mang tiếng cười cho mọi người" name="job" value="${dP.job}">
                                            </div>
                                            <div>
                                                <label>Sở thích</label>
                                                <input autocomplete="off" type="text" placeholder="Vd: Hashagi!!!" name="hobbie" value="${dP.hobbie}">
                                            </div>
                                            <div>
                                                <label>Giới thiệu về bản thân</label>
                                                <textarea name="detail" placeholder="Hãy viết một vài điều thú vị về bạn đi" rows="3" required="">${dP.detail}</textarea>
                                                <span class="message">Viết gì đó đi mà</span>
                                            </div>
                                        </div><!-- simple form -->
                                        <div class="central-meta">
                                            <style>
                                                .post{
                                                    display: none;
                                                }
                                                .fooImbaFixed {
                                                    display: inline-block;
                                                    position: relative;
                                                }
                                                .fooImbaFixed > img {
                                                    background-size: cover;
                                                    border: 4px solid #edf2f6;
                                                    max-width: 273px;
                                                    min-width: 273px;
                                                    max-height: 300px;
                                                    min-height: 300px;
                                                    display: inline-block;
                                                    margin-top: 10px;
                                                    margin-bottom: 10px;
                                                    padding: 5px;
                                                }
                                                .fooImbaFixed:hover .fooEdit-dp {
                                                    opacity: 0.8;
                                                    transform: scale(2);
                                                    visibility: visible;
                                                }
                                                .fooEdit-dp {
                                                    background: rgba(255, 255, 255, 0.7) none repeat scroll 0 0;
                                                    border: 1px solid #8d92a8;
                                                    border-radius: 100%;
                                                    bottom: 0;
                                                    height: 40px;
                                                    line-height: 40px;
                                                    position: absolute;
                                                    right: 130px;
                                                    top: 130px;
                                                    text-align: center;
                                                    transition: all 0.2s linear 0s;
                                                    visibility: hidden;
                                                    width: 40px;
                                                }
                                            </style>
                                            <h3 class="title2">Chọn ảnh hiển thị:</h3>
                                            <div class="row">
                                                <div class="fooImbaFixed col-lg-4">
                                                    <img id="hinh" alt="avatar" src="images/anhDep10d.jpg">
                                                    <div>
                                                        <label class="fileContainer" id="saveImg">
                                                            <input type="file" onchange="readURL(this, 'hinh')"/>
                                                        </label>               
                                                    </div>
                                                </div>
                                                <div class="fooImbaFixed col-lg-4">
                                                    <c:if test="${dP.image1 == '' || dP.image1 == null}">
                                                        <img id="hinh1" alt="avatar" src="images/anhNen.png">
                                                    </c:if>
                                                    <c:if test="${dP.image1 != '' && dP.image1 != null}">
                                                        <img id="hinh1" alt="avatar" src="userPhoto/${dP.userID}/datingImage/${dP.image1}">
                                                    </c:if>
                                                    <div class="fooEdit-dp">
                                                        <label class="fileContainer" id="saveImg">
                                                            <i class="fa fa-camera"></i>
                                                            <input type="file" name="image1" onchange="readURL(this, 'hinh1')"/>
                                                        </label>               
                                                    </div>
                                                </div>
                                                <div class="fooImbaFixed col-lg-4">
                                                    <c:if test="${dP.image2 == '' || dP.image2 == null}">
                                                        <img id="hinh2" alt="avatar" src="images/anhNen.png">
                                                    </c:if>
                                                    <c:if test="${dP.image2 != '' && dP.image2 != null}">
                                                        <img id="hinh2" alt="avatar" src="userPhoto/${dP.userID}/datingImage/${dP.image2}">
                                                    </c:if>
                                                    <div class="fooEdit-dp">
                                                        <label class="fileContainer" id="saveImg">
                                                            <i class="fa fa-camera"></i>
                                                            <input type="file" name="image2" onchange="readURL(this, 'hinh2')"/>
                                                        </label>               
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="fooImbaFixed col-lg-4">
                                                    <c:if test="${dP.image3 == '' || dP.image3 == null}">
                                                        <img id="hinh3" alt="avatar" src="images/anhNen.png">
                                                    </c:if>
                                                    <c:if test="${dP.image3 != '' && dP.image3 != null}">
                                                        <img id="hinh3" alt="avatar" src="userPhoto/${dP.userID}/datingImage/${dP.image3}">
                                                    </c:if>
                                                    <div class="fooEdit-dp">
                                                        <label class="fileContainer" id="saveImg">
                                                            <i class="fa fa-camera"></i>
                                                            <input type="file" name="image3" onchange="readURL(this, 'hinh3')"/>
                                                        </label>               
                                                    </div>
                                                </div>
                                                <div class="fooImbaFixed col-lg-4">
                                                    <c:if test="${dP.image4 == '' || dP.image4 == null}">
                                                        <img id="hinh4" alt="avatar" src="images/anhNen.png">
                                                    </c:if>
                                                    <c:if test="${dP.image4 != '' && dP.image4 != null}">
                                                        <img id="hinh4" alt="avatar" src="userPhoto/${dP.userID}/datingImage/${dP.image4}">
                                                    </c:if>
                                                    <div class="fooEdit-dp">
                                                        <label class="fileContainer" id="saveImg">
                                                            <i class="fa fa-camera"></i>
                                                            <input type="file" name="image4" onchange="readURL(this, 'hinh4')"/>
                                                        </label>               
                                                    </div>
                                                </div>
                                                <div class="fooImbaFixed col-lg-4">
                                                    <c:if test="${dP.image5 == '' || dP.image5 == null}">
                                                        <img id="hinh5" alt="avatar" src="images/anhNen.png">
                                                    </c:if>
                                                    <c:if test="${dP.image5 != '' && dP.image5 != null}">
                                                        <img id="hinh5" alt="avatar" src="userPhoto/${dP.userID}/datingImage/${dP.image5}">
                                                    </c:if>
                                                    <div class="fooEdit-dp">
                                                        <label class="fileContainer" id="saveImg">
                                                            <i class="fa fa-camera"></i>
                                                            <input type="file" name="image5" onchange="readURL(this, 'hinh5')"/>
                                                        </label>               
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div id="acceptChange">

                                            </div>
                                            <div>
                                                <a class="main-btn accept-change" type="submit" data-ripple="">Xác nhận thay đổi</a>                                         
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <div class="popup-wraper9">
            <div class="popup">
                <span class="acceptChange-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        <h5>Xác nhận thay đổi</h5>
                    </div>
                    <div class="Rpt-meta">
                        <span>Thông tin của bạn sẽ được cập sau khi hoàn thành việc xác thực mật khẩu</span>
                        <form method="post" class="c-form" onsubmit="return false">
                            <div>
                                <label>Nhập mật khẩu của bạn</label>
                                <input id="password" value="" name="password" type="password" placeholder="Mật khẩu">
                            </div>
                            <br>
                            <div>
                                <button onclick="validateUser()" data-ripple="" type="submit" class="main-btn2 acceptChange-closed">Xác nhận thay đổi</button>
                            </div>
                        </form>	
                    </div>
                </div>	
            </div>
        </div>

        <script src="js/main.min.js"></script>
        <script src="js/form-validation.js"></script>
        <script src="js/script.js"></script>
        <script src="js/jquery.cookieBar.min.js"></script><!-- cookies bar -->

        <script>
                                    // Cookie Bar initialization
                                    $(function () {
                                        $.cookieBar({
                                            privacy: 'bs_modal',
                                            privacyContent: '#privacyModal'
                                        });
                                    });

                                    // Just example purpose
                                    var style = 1;
                                    var styles = [
                                        'top',
                                        'bottom',
                                        'bottom-left',
                                        'bottom-right'
                                    ];

                                    $(function () {
                                        $('#reload-cookies').on('click', function () {
                                            if ($.cookieBar('getCookie', 'cookies-state') === 'accepted') {
                                                $.cookieBar('setCookie', 'cookies-state', '', 0);
                                                $.cookieBar('displayBar');
                                            }
                                        });

                                        $('#toggle-style').on('click', function () {
                                            $('#cookie-bar').remove();

                                            $.cookieBar({
                                                style: styles[style],
                                                privacy: 'bs_modal',
                                                privacyContent: '#privacyModal'
                                            });

                                            style++;

                                            if (style >= styles.length) {
                                                style = 0;
                                            }
                                        });
                                    });// Cookie Bar initialization End

                                    function readURL(input, param) {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                //$('#avt').attr('src', e.target.result).width(155).height(155);
                                                $('#' + param).attr('src', e.target.result).width(200).height(250);
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
        </script>
        <script>
            function validateUser() {
                var password = document.getElementById("password").value;
                $.ajax({
                    url: "acceptChangeInfo",
                    type: "post",
                    data: {
                        password: password
                    },
                    success: function (data) {
                        var liStatus = document.getElementById("acceptChange");
                        liStatus.innerHTML = data;
                    },
                    error: function (xhr) {

                    }
                });
            }
        </script>

    </body>	

</html>