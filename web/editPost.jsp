<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bài viết</title>
        <link rel="stylesheet" href="css/main.min.css">
        <link rel="stylesheet" href="css/nprogress.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .postText{
                text-align: center;
                color: black;
                font-family: sans-serif;
                font-size: 30px;
                height: 100%;   

            }

            .customerText{
                background-image: url(images/anhNen.png);
                height: 100%;
                justify-content: center;
                display: flex;
                flex-direction: column;
                background-image: url(images/bgrText.jpg);
                height: 100%;
            }

            .h100pt{height: 100%}
            .anPost{
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="postoverlay"></div>
        <jsp:include page="topbar.jsp"></jsp:include>	
        <jsp:include page="userOnline.jsp"></jsp:include>
            <section>
                <div class="gap2 gray-bg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row merged20" id="page-contents">
                                    <div class="newpst-input">
                                        <form action="addPost" method="post" enctype="multipart/form-data">
                                            <textarea name="contentPost" rows="2" placeholder="Chia sẻ những suy nghĩ của bạn?"></textarea>
                                            <input type="hidden" value="0" name="stt" id="stt">
                                            <div class="row" id="containerInputImg">
                                                <div id="containerImg1" class="fooImbaFixed col-lg-4 anPost">
                                                    <img id="hinh1" alt="avatar" src="images/anhNen.png">
                                                </div> 
                                            <c:forEach begin="2" end="30" var="i">
                                                <div id="containerImg${i}" class="fooImbaFixed col-lg-4 anPost">
                                                    <img id="hinh${i}" alt="avatar" src="images/anhNen.png">
                                                    <div class="fooEdit-dp">
                                                        <label class="fileContainer" id="saveImg${i}">
                                                            <i class="fa fa-camera"></i>
                                                            <input type="file" name="image${i}" onchange="readURLPostImg(this, 'hinh${i}', '${i}', '${i+1}')"/>
                                                        </label>               
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                        <div class="attachments">
                                            <ul>
                                                <li>
                                                    <i class="fa fa-image"></i>
                                                    <label class="fileContainer">
                                                        <input name="image1" type="file" onchange="readURLPostImg(this, 'hinh1', '1', '2')">
                                                    </label>
                                                </li>
                                                <li>
                                                    <i class="fa fa-camera"></i>
                                                    <label class="fileContainer">
                                                        <input type="file">
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                        <button style="width: 100%" class="post-btn" type="submit" data-ripple="">Đăng</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </body>
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
</html>
