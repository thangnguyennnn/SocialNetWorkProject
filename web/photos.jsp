<%-- 
    Document   : photos
    Created on : Feb 17, 2022, 4:22:08 PM
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
        <title>Hình ảnh</title>
        <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 

        <link rel="stylesheet" href="css/main.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/color.css">
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
            <jsp:include page="userOnline.jsp"></jsp:include>

                <section>
                    <div class="gap2 gray-bg">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="row merged20" id="page-contents">
                                    <jsp:include page="profileBanner.jsp"></jsp:include>
                                        <div class="col-lg-12">
                                            <div class="central-meta">
                                                <div class="title-block">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="align-left">
                                                                <h5>Photos <span>${sizePhoto}</span></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- title block -->
                                        <div class="central-meta">
                                            <div class="row merged5">
                                                <c:forEach items="${photos}" var="p">
                                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                                        <div class="item-box">
                                                            <a class="strip" href="userPhoto/${GInfor.userId}/photo/${p.attachmentURL}" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
                                                                <img style="min-height: 160px; max-height: 160px" src="userPhoto/${GInfor.userId}/photo/${p.attachmentURL}" alt=""></a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <c:if test="${sizePhoto > 15}">
                                                <div class="lodmore">
                                                    <span>Hiển thị 1-15 của ${sizePhoto} hình ảnh</span>
                                                    <button class="btn-view btn-load-more"></button>
                                                </div>
                                            </c:if>

                                        </div><!-- photos -->
                                    </div><!-- centerl meta -->
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