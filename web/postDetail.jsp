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
        <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 
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
        </style>
    </head>
    <body>
        <div class="postoverlay"></div>
        <jsp:include page="topbar.jsp"></jsp:include>	
        <jsp:include page="userOnline.jsp"></jsp:include>
            <div class="" id="img-comt" style="display: block">
                <div class="modal-dialog" style="margin-top: 20px">
                    <div class="modal-content">

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="row" >
                                <div class="col-lg-8">
                                    <div class="row h100pt">
                                        <div class="col-lg-12 h100pt">                                                   
                                            <div class="prod-avatar h100pt">
                                            <c:if test="${post.sizeAlbum() > 1}">
                                                <ul class="slider-for-gold customerText">

                                                    <c:forEach items="${post.getAllImageAttachment()}" var="a">  
                                                        <li><img style="padding-left: 15px;" src="userPhoto/${post.userID}/photo/${a.attachmentURL}" alt=""></li>
                                                        </c:forEach>

                                                </ul>
                                                <ul class="slider-nav-gold customerText">

                                                    <c:forEach items="${post.getAllImageAttachment()}" var="a">  
                                                        <li><img src="userPhoto/${post.userID}/photo/${a.attachmentURL}" alt=""></li>
                                                        </c:forEach>

                                                </ul>
                                            </c:if>
                                            <c:if test="${post.sizeAlbum() == 1}">
                                                <c:if test="${post.postType == 'avatar'}">
                                                    <ul class="customerText" style="padding-right: 40px;">                   
                                                        <li><img src="${post.getUserAvatar()}" alt=""></li>
                                                    </ul>
                                                </c:if>
                                                <c:if test="${post.postType == 'background'}">
                                                    <ul class="customerText" style="padding-right: 40px;">                   
                                                        <li><img src="${post.getUserBackground()}" alt=""></li>
                                                    </ul>
                                                </c:if>
                                                <c:if test="${post.postType != 'avatar' && post.postType != 'background'}">
                                                    <ul class="customerText" style="padding-right: 40px;">
                                                        <c:forEach items="${post.getAllImageAttachment()}" var="a">  
                                                            <li><img src="userPhoto/${post.userID}/photo/${a.attachmentURL}" alt=""></li>
                                                            </c:forEach>
                                                    </ul>
                                                </c:if>


                                            </c:if>
                                            <c:if test="${post.sizeAlbum() == 0}">
                                                <ul class="slider-for-gold customerText">
                                                    <li><p class="postText">${post.detail}</p></li>
                                                </ul>
                                            </c:if>
                                        </div>	                                                                                                
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-4" style="background-color: #fafafd">
                                <div class="user" id="hostInfo">
                                    <figure><img style="max-height: 49px; max-width: 49px;" src="${post.getUserAvatar()}" alt=""></figure>
                                    <div class="user-information">
                                        <h4><a id="nameHost" href="getUserInfor?userID=${post.userID}" title="">${post.getFullName()}</a></h4>
                                        <span>${post.getUnitTime().countTime} ${post.getUnitTime().unit} trước</span>
                                    </div>
                                        <c:if test="${AccLogin.role == '1'}">
                                            <a href="deletePost?postID=${post.postID}" title="Follow" data-ripple="">Xóa</a>
                                        </c:if>
                                    
                                </div>
                                <p>${post.detail}</p>
                                <div class="we-video-info" id="postInfo">
                                    <ul>
                                        <li>
                                            <c:if test="${post.isLike(AccLogin.userId) == true}">
                                                <div id="${p.postID}" onclick="likePost('${post.postID}')" class="likes heart happy" title="Like/Dislike">❤ <span id="t${post.postID}">${post.getLikeTotal()}</span></div>
                                                </c:if>
                                                <c:if test="${post.isLike(AccLogin.userId) == false}">
                                                <div id="${post.postID}" onclick="likePost('${post.postID}')" class="likes heart broken" title="Like/Dislike">❤ <span id="t${post.postID}">${post.getLikeTotal()}</span></div>
                                                </c:if>
                                        </li>
                                        <li>
                                            <span title="Comments" class="comment">
                                                <i class="fa fa-commenting"></i>
                                                <ins>${post.getCommentTotal()}</ins>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <div style="display: block;" class="coment-area">
                                    <ul class="we-comet" style="max-height: 300px" id="postComment">
                                        <c:forEach items="${post.getAllCommentInpost()}" var="c">
                                            <li>
                                                <div class="comet-avatar">
                                                    <img alt="" src="${c.getUserAvatar()}">
                                                </div>
                                                <div class="we-comment">
                                                    <h5><a title="" href="getUserInfor?userID=${c.userID}">${c.getFullName()}</a></h5>
                                                    <p>${c.detail}</p>
                                                    <div class="inline-itms">
                                                        <span>${c.getUnitTime().countTime} ${c.getUnitTime().unit} trước</span>
                                                        <a title="Reply" href="#" class="we-reply"><i class="fa fa-reply"></i></a>
                                                        <a title="" href="#"><i class="fa fa-heart"></i><span></span></a>
                                                    </div>
                                                </div>

                                            </li>
                                        </c:forEach>

                                    </ul>

                                </div>
                                <div class="post-comment" style="min-height: 450px;">
                                    <div class="comet-avatar">
                                        <img src="userPhoto/${AccLogin.userId}/avatar/${userInfor.avatar}" alt="">
                                    </div>
                                    <div class="post-comt-box" style="width: 80%;">
                                        <form method="post" action="addComment">
                                            <input type="hidden" name="postID" id="postID" value="${post.postID}" />
                                            <input type="hidden" name="userID" value="${AccLogin.userId}" />
                                            <textarea oninput="validate1(this)" name="detail" placeholder="Viết bình luận..."></textarea>
                                            <div class="add-smiles">
                                                <div class="uploadimage">
                                                    <i class="fa fa-image"></i>
                                                    <label class="fileContainer">
                                                        <input type="file">
                                                    </label>
                                                </div>
                                                <span class="em em-expressionless" title="add icon"></span>
                                                <div class="smiles-bunch">
                                                    <i class="em em---1"></i>
                                                    <i class="em em-smiley"></i>
                                                    <i class="em em-anguished"></i>
                                                    <i class="em em-laughing"></i>
                                                    <i class="em em-angry"></i>
                                                    <i class="em em-astonished"></i>
                                                    <i class="em em-blush"></i>
                                                    <i class="em em-disappointed"></i>
                                                    <i class="em em-worried"></i>
                                                    <i class="em em-kissing_heart"></i>
                                                    <i class="em em-rage"></i>
                                                    <i class="em em-stuck_out_tongue"></i>
                                                </div>
                                            </div>
                                        </form>	
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                                                    function likePost(postID) {

                                                        $.ajax({
                                                            url: 'likePost',
                                                            type: 'post',
                                                            data: {
                                                                postID: postID
                                                            },
                                                            success: function (data) {
                                                                var animated = data;
                                                                var numLike = document.getElementById('t' + postID).innerHTML;
                                                                var newNum = Number(numLike);

                                                                //document.getElementById('totalLike').innerHTML = animated;
                                                                if (animated === 'false') {
                                                                    document.getElementById(postID).classList.add('happy');
                                                                    document.getElementById(postID).classList.remove('broken');
                                                                    newNum++;
                                                                    document.getElementById('t' + postID).innerHTML = newNum;
                                                                } else {
                                                                    document.getElementById(postID).classList.remove('happy');
                                                                    document.getElementById(postID).classList.add('broken');
                                                                    newNum--;
                                                                    document.getElementById('t' + postID).innerHTML = newNum;
                                                                }
                                                            }
                                                        }
                                                        );
                                                    }
    </script>
</html>
