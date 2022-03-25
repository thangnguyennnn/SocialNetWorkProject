<%-- 
    Document   : datingProfile
    Created on : Feb 17, 2022, 4:03:18 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>View Dating Profile</title>
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
        <div class="theme-layout  gray-bg">
            <jsp:include page="topbar.jsp"></jsp:include>

            <jsp:include page="userOnline.jsp"></jsp:include>

                <div class="fixed-sidebar left">
                    <div class="menu-left">
                        <ul class="left-menu">
                            <li>
                                <a class="menu-small" href="loadDatingPage" title="Quay lại">
                                    <i class="fa fa-reply"></i>
                                </a>
                            </li>
                            <li>
                                <a style="font-size: 24px;" href="loadDatingProfile" title="Thông tin cá nhân" data-ripple=""><i class="fa fa-user"></i></a>
                            </li>
                        </ul>
                    </div>
                </div><!-- left sidebar menu -->

                <section>
                    <div class="gap2 no-bottom">
                        <div class="container">
                            <div class="row">	
                                <div class="col-lg-12">
                                    <div class="prod-detail">
                                        <div class="central-meta">
                                            <span style="margin-bottom: -5px;" class="title2">Hồ sơ hẹn hò của bạn:</span>
                                            <div class="row remove-ext">
                                                <a class="send-mesg main-btn" style="margin-left: 85%; cursor: pointer;">Xóa hồ sơ hẹn hò</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="prod-avatar">
                                                <ul class="slider-for-gold">
                                                    <c:if test="${dD.image1 == '' && dD.image2 == '' && dD.image3 == '' && dD.image4 == '' && dD.image5 == ''}">
                                                        <li style="max-height: 500px;"><img src="images/anhDep10d.jpg" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image1 != '' && dD.image1 != null}">
                                                        <li style="max-height: 500px;"><img src="userPhoto/${dD.userID}/datingImage/${dD.image1}" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image2 != '' && dD.image2 != null}">
                                                        <li style="max-height: 500px;"><img src="userPhoto/${dD.userID}/datingImage/${dD.image2}" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image3 != '' && dD.image3 != null}">
                                                        <li style="max-height: 500px;"><img src="userPhoto/${dD.userID}/datingImage/${dD.image3}" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image4 != '' && dD.image4 != null}">
                                                        <li style="max-height: 500px;"><img src="userPhoto/${dD.userID}/datingImage/${dD.image4}" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image5 != '' && dD.image5 != null}">
                                                        <li style="max-height: 500px;"><img src="userPhoto/${dD.userID}/datingImage/${dD.image5}" alt=""></li>
                                                        </c:if>
                                                </ul>
                                                <ul class="slider-nav-gold">
                                                    <c:if test="${dD.image1 == '' && dD.image2 == '' && dD.image3 == '' && dD.image4 == '' && dD.image5 == ''}">
                                                        <li><img src="images/anhDep10d.jpg" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image1 != '' && dD.image1 != null}">
                                                        <li><img src="userPhoto/${dD.userID}/datingImage/${dD.image1}" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image2 != '' && dD.image2 != null}">
                                                        <li><img src="userPhoto/${dD.userID}/datingImage/${dD.image2}" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image3 != '' && dD.image3 != null}">
                                                        <li><img src="userPhoto/${dD.userID}/datingImage/${dD.image3}" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image4 != '' && dD.image4 != null}">
                                                        <li><img src="userPhoto/${dD.userID}/datingImage/${dD.image4}" alt=""></li>
                                                        </c:if>
                                                        <c:if test="${dD.image5 != '' && dD.image5 != null}">
                                                        <li><img src="userPhoto/${dD.userID}/datingImage/${dD.image5}" alt=""></li>
                                                        </c:if>
                                                </ul>
                                            </div>	
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="full-postmeta">
                                                <div class="left-detail-meta">
                                                    <c:if test="${dD.nickName != '' && dD.nickName != null}">
                                                        <h4><i class="fa fa-check-circle-o"></i> ${dD.nickName} <ins style="text-decoration: none; font-size: 20px;"> (${dD.name})</ins></h4>
                                                    </c:if>
                                                    <c:if test="${dD.nickName == '' || dD.nickName == null}">
                                                        <h4><i class="fa fa-check-circle-o"></i> ${dD.name}</h4>
                                                    </c:if>
                                                    <span><i class="fa fa-map-marker"></i> ${dD.location}</span>
                                                    <ins>Giới Tính: <ins style="text-decoration: none; font-weight: 550;">${dD.sex}</ins> - Đối tượng tìm kiếm: <ins style="text-decoration: none; font-weight: 550;">${dD.gender}</ins></ins>
                                                </div>
                                                <div class="right-detailmeta" style="padding-left: 13%;">
                                                    <span class="online"><i class="fa fa-circle"></i> Online</span>
                                                </div>
                                                <br><br>
                                                <div class="member-des">
                                                    <h5>Thông tin cá nhân</h5>
                                                    <c:if test="${dD.education != '' && dD.education != null}">
                                                        <h6> - Học Vấn:</h6>
                                                        <p>${dD.education}</p>
                                                    </c:if>
                                                    <c:if test="${dD.job != '' && dD.job != null}">
                                                        <h6> - Công Việc:</h6>
                                                        <p>${dD.job}</p>
                                                    </c:if>
                                                    <c:if test="${dD.hobbie != '' && dD.hobbie != null}">
                                                        <h6> - Sở Thích:</h6>
                                                        <p>${dD.hobbie}</p>
                                                    </c:if>
                                                    <c:if test="${dD.child != 'Chưa có'}">
                                                        <h6> - Con cái:</h6>
                                                        <p>${dD.child}</p>
                                                    </c:if>
                                                    <h6> - Giới thiệu:</h6>
                                                    <p>
                                                        ${dD.detail}
                                                    </p>
                                                    <a href="loadEditDatingProfilePage?userID=${dD.userID}" class="main-btn2" style="margin-left: 51%;">Thay đổi thông tin hồ sơ hẹn hò</a>
                                                </div>                                 	
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gap no-bottom">
                                    </div>
                                    <div class="central-meta">
                                        <span class="title2">Người định mệnh:</span>
                                        <div class="row remove-ext">
                                            <c:forEach items="${listA}" var="o">
                                                <c:if test="${o.userID != dD.userID}">
                                                    <div class="col-lg-3 col-md-3 col-sm-4 item">
                                                        <div class="pitdate-user">
                                                            <figure>
                                                                <style>
                                                                    .default_image
                                                                    {       
                                                                        display:block;
                                                                        background-image: url('images/anhDep10d.jpg');
                                                                        background-repeat: no-repeat;
                                                                        background-size: 100%;
                                                                    }
                                                                    .dating_image
                                                                    {       
                                                                        display:block;
                                                                        background-image: url('userPhoto/${o.userID}/datingImage/${o.image}');
                                                                        background-repeat: no-repeat;
                                                                        background-size: 100%;
                                                                    }
                                                                    .foo_fix
                                                                    {
                                                                        width: 100%;
                                                                        height: 200px;
                                                                    }
                                                                </style>
                                                                <c:if test="${o.image == 'images/anhDep10d.jpg'}">
                                                                    <span class="default_image foo_fix"></span>
                                                                </c:if>
                                                                <c:if test="${o.image != 'images/anhDep10d.jpg'}">
                                                                    <span class="dating_image foo_fix"></span>
                                                                </c:if>
                                                                <span class="status f-online"></span>
                                                            </figure>	
                                                            <c:if test="${o.nickName != '' && o.nickName != null}">
                                                                <h4><a href="loadDatingDetail?userID=${o.userID}" title="">${o.nickName} | Tuổi ${o.age}</a></h4>
                                                            </c:if>
                                                            <c:if test="${o.nickName == '' || o.nickName == null}">
                                                                <h4><a href="loadDatingDetail?userID=${o.userID}" title="">${o.name} | Tuổi ${o.age}</a></h4>
                                                            </c:if>
                                                            <span><i class="fa fa-map-marker"></i> ${o.location}</span>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>	
                        </div>
                    </div>
                </div>	
            </section><!-- picture area -->
        </div>

        <div class="popup-wraper1">
            <div class="popup">
                <span class="popup-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        Bạn có chắc là muốn xóa đi hồ sơ hẹn hò của mình?
                    </div>
                    <div class="Rpt-meta">
                        <span>Tất cả các thông tin về hồ sơ hẹn hò của bạn sẽ bị xóa đi hết</span>
                        <br><br>
                        <form action="deleteDatingProfile" method="post" class="c-form">
                            <div>
                                <button data-ripple="" type="submit" class="main-btn">Xóa</button>
                                <a href="#" data-ripple="" class="main-btn3 cancel">Đóng</a>
                            </div>
                        </form>	
                    </div>
                </div>	
            </div>
        </div><!-- send message popup -->

        <script src="js/main.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>
        <script src="js/locationpicker.jquery.js"></script>
        <script src="js/map-init.js"></script>
        <script src="js/script.js"></script>
        <script>
            jQuery(document).ready(function ($) {

                $('#us3').locationpicker({
                    location: {
                        latitude: -8.681013,
                        longitude: 115.23506410000005
                    },
                    radius: 0,
                    inputBinding: {
                        latitudeInput: $('#us3-lat'),
                        longitudeInput: $('#us3-lon'),
                        radiusInput: $('#us3-radius'),
                        locationNameInput: $('#us3-address')
                    },
                    enableAutocomplete: true,
                    onchanged: function (currentLocation, radius, isMarkerDropped) {
                        // Uncomment line below to show alert on each Location Changed event
                        //alert("Location changed. New location (" + currentLocation.latitude + ", " + currentLocation.longitude + ")");
                    }
                });

            });
        </script>


    </body>	

</html>
