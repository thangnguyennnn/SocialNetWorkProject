<%-- 
    Document   : dating
    Created on : Feb 17, 2022, 4:02:44 PM
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
        <title>Dating</title>
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

                <section>
                    <div class="gap2 no-bottom">
                        <div class="container-fluid ext-right">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="featured-baner mate-black ext-low-opacity">
                                        <img style="height: 600px;" src="images/yeye.jpg" alt="">
                                        <h2>Đi tìm 1 <span>tình yêu</span><br></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>	
                </section><!-- top banner -->

                <section>
                    <div class="gap2 no-gap overlap">
                        <div class="container-fluid ext-right">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div style="padding-left: 14%;" class="search-match">
                                        <h5>Tìm kiếm <span>Người thích hợp</span></h5>
                                        <form action="searchDatingAccount" method="post">
                                            <ul class="select-gender">
                                                <li value="Nam">
                                                    <img src="images/male.png" alt="" title="Nam">
                                                </li>
                                                <li value="Nữ">
                                                    <img src="images/female.png" alt="" title="Nữ">
                                                </li>
                                            </ul>

                                            <div class="chkFoo">
                                            </div>
                                            <div class="age-opt">
                                                <label>Độ tuổi:</label>
                                                <select name="begin">
                                                <c:forEach begin="18" end="35" step="1" var="i">
                                                    <option value="${i}" ${begin == i ? "selected":""}>${i}</option>
                                                </c:forEach>
                                            </select>
                                            <p>-</p>
                                            <select name="end">
                                                <c:forEach begin="18" end="35" step="1" var="i">
                                                    <option value="${i}" ${end == i ? "selected":""}>${i}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="oth-opt">
                                            <div class="loc">
                                                <label>Vị trí:</label>
                                                <input id="local" oninput="validate1(this)" autocomplete="off" type="text" placeholder="Vd: Đà Nẵng" name="location" value="${txtSearch}">
                                            </div>
                                        </div>	
                                        <button type="submit"><i class="fa fa-search"></i> Tìm</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>	
            </section><!-- Gender search -->		
            <a href="dating.jsp"></a>

            <section>
                <div class="gap gray-bg">
                    <div class="container-fluid ext-right">
                        <div class="row" id="page-contents">
                            <div class="col-lg-3">
                                <aside class="sidebar static left">
                                    <div class="widget stick-widget">
                                        <div style="padding-top: 60px;" class="frnd-meta">
                                            <style>
                                                .fixAnhhihi{
                                                    background-size: cover;
                                                    max-height: 90px;
                                                    max-width: 90px;
                                                    min-height: 90px;
                                                    min-width: 90px;
                                                }
                                            </style>
                                            <c:if test="${dD.avatar != '' && dD.avatar != null}">
                                                <img class="fixAnhhihi" id="avt" alt="author" src="userPhoto/${dD.userID}/avatar/${dD.avatar}">
                                            </c:if>
                                            <c:if test="${dD.avatar == '' || dD.avatar == null}">
                                                <img class="fixAnhhihi" id="avt" alt="author" src="images/avatardefault.png">
                                            </c:if>
                                            <div style="padding-top: 40px; margin-left: 2%;" class="frnd-name">
                                                <c:if test="${dD.nickName != '' && dD.nickName != null}">
                                                    <a style="font-size: 20px; margin-left: 2%;" title="Biệt danh" href="loadDatingProfile">${dD.nickName}</a>
                                                    <a title="Tên thật">${dD.name}</a>
                                                </c:if>
                                                <c:if test="${dD.nickName == '' || dD.nickName == null}">
                                                    <a style="font-size: 20px; margin-left: 2%;" title="Tên thật" href="loadDatingProfile">${dD.name}</a>
                                                </c:if>
                                            </div>
                                        </div>
                                        <ul class="menu-list">
                                            <li><a><h6>Ngày sinh: </h6>${dD.birthDate}</a></li>
                                            <li><a style="text-transform: none;"><h6>Địa điểm hẹn hò: </h6>${dD.location}</a></li>
                                                <c:if test="${dD.education != '' && dD.education != null}">
                                                <li><a style="text-transform: none;"><h6>Học vấn: </h6>${dD.education}</a></li>
                                                </c:if>
                                                <c:if test="${dD.job != '' && dD.job != null}">
                                                <li><a style="text-transform: none;"><h6>Công việc: </h6>${dD.job}</a></li>
                                                </c:if>
                                                <c:if test="${dD.hobbie != '' && dD.hobbie != null}">
                                                <li><a style="text-transform: none;"><h6>Sở thích: </h6>${dD.hobbie}</a></li>
                                                </c:if>
                                                <c:if test="${dD.child != 'Chưa có'}">
                                                <li><a style="text-transform: none;"><h6>Con cái: </h6>${dD.child}</a></li>
                                                </c:if>
                                            <li><a style="text-transform: none;"><h6>Giới thiệu: </h6>${dD.detail}</a></li>
                                        </ul>
                                    </div>
                                </aside>	
                            </div>
                            <div class="col-lg-9">
                                <div class="load-more">
                                    <div class="central-meta">
                                        <div class="row merged20 remove-ext">
                                            <c:forEach items="${listA}" var="o">
                                                <c:if test="${o.userID != AccLogin.userId}">
                                                    <div class="col-lg-3 col-md-4 col-sm-4 item">
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
                                                                        height: 240px;
                                                                    }
                                                                </style>
                                                                <c:if test="${o.image != 'images/anhDep10d.jpg'}">
                                                                    <span class="dating_image foo_fix"></span>
                                                                </c:if>
                                                                <c:if test="${o.image == 'images/anhDep10d.jpg'}">
                                                                    <span class="default_image foo_fix"></span>
                                                                </c:if>
                                                                <div class="more">
                                                                    <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                        <ul>
                                                                            <li class="bad-report"><i class="fa fa-flag"></i>Báo cáo</li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
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
            </section><!-- content -->
        </div>

        <div class="popup-wraper3">
            <div class="popup">
                <span class="popup-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        <h5>Report Post</h5>
                    </div>
                    <div class="Rpt-meta">
                        <span>We're sorry something's wrong. How can we help?</span>
                        <form method="post" class="c-form">
                            <div class="form-radio">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="radio" checked="checked"><i class="check-box"></i>It's spam or abuse
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="radio"><i class="check-box"></i>It breaks r/technology's rules
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="radio"><i class="check-box"></i>Not Related
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="radio"><i class="check-box"></i>Other issues
                                    </label>
                                </div>
                            </div>
                            <div>
                                <label>Write about Report</label>
                                <textarea placeholder="write someting about Post" rows="2"></textarea>
                            </div>
                            <div>
                                <button data-ripple="" type="submit" class="main-btn">Submit</button>
                                <a href="#" data-ripple="" class="main-btn3 cancel">Close</a>
                            </div>
                        </form>	
                    </div>
                </div>	
            </div>
        </div><!-- report popup -->

        <script src="js/main.min.js"></script>
        <script src="js/script.js"></script>

    </body>	

</html>