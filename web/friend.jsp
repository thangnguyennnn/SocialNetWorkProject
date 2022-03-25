<%-- 
    Document   : friend
    Created on : Feb 17, 2022, 4:19:31 PM
    Author     : PC
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>Bạn bè</title>
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
                                                                <h5>Bạn bè <span>${sizeListF}</span></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="row merged20">
                                                            <div class="col-lg-7 col-lg-7 col-sm-7">
                                                                <form method="post">
                                                                    <input type="text" placeholder="Tìm bạn bè">
                                                                    <button type="submit"><i class="fa fa-search"></i></button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- title block -->
                                        <div class="central-meta padding30">
                                            <div class="row">
                                                <c:forEach items="${ListFriend}" var="f">
                                                    <div class="col-lg-3 col-md-6 col-sm-6">
                                                        <div class="friend-box">
                                                            <figure>
                                                                <img style="width: 237.5px; height: 118.75px" src="userPhoto/${f.u.userId}/background/${f.u.background}" alt="">
                                                            </figure>
                                                            <div class="frnd-meta">
                                                                <img style="width: 88px; height: 88px" src="userPhoto/${f.u.userId}/avatar/${f.u.avatar}" alt="">
                                                                <div class="frnd-name">
                                                                    <a href="getUserInfor?userID=${f.u.userId}" title="">${f.u.lastName} ${f.u.middleName} ${f.u.firstName}</a>
                                                                    <span>${f.u.address}</span>
                                                                </div>
                                                                <ul class="frnd-info">


                                                                </ul>
                                                                <c:if test="${f.isFriend == '1'}">
                                                                    <a style="cursor: pointer" class="send-mesg" onclick="areaSend('${f.u.userId}', '${f.u.firstName}')" title="">Nhắn tin</a>
                                                                </c:if>
                                                                <c:if test="${f.isFriend == '2'}">
                                                                    <a href="#" title="">Xác nhận</a>
                                                                </c:if>
                                                                <c:if test="${f.isFriend == '3'}">
                                                                    <a href="#" title="">Hủy lời mời</a>
                                                                </c:if>

                                                                <c:if test="${(f.isFriend == '5' || f.isFriend == '') && f.u.userId != AccLogin.userId}">
                                                                    <a href="addFriend2?userid=${f.u.userId}&GID=${GInfor.userId}" title="">Kết bạn</a>
                                                                </c:if>


                                                                <div class="more-opotnz">
                                                                    <i class="fa fa-ellipsis-h"></i>
                                                                    <ul>
                                                                        <li><a href="#" title="">Block</a></li>
                                                                        <li><a href="#" title="">UnBlock</a></li>
                                                                        <li><a href="#" title="">Mute Notifications</a></li>
                                                                        <li><a href="#" title="">hide from friend list</a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </c:forEach>
                                            </div>
                                            <c:if test="${sizeListF > 8}">
                                                <div class="lodmore">
                                                    <span>Viewing 1-8 of 44 friends</span>
                                                    <button class="btn-view btn-load-more"></button>
                                                </div>
                                            </c:if>

                                        </div>
                                    </div>	
                                </div>	
                            </div>
                        </div>
                    </div>
                </div>	
            </section><!-- content -->




        </div>
        <script>
            function areaSend(id, name){
                document.getElementById('nameRe').innerHTML = 'Gửi tin nhắn cho ' +name;
                document.getElementById('idRe').value = id;
            }
        </script>
        <div class="popup-wraper1">
            <div class="popup direct-mesg">
                <span class="popup-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        <h5 id="nameRe">Gửi tin nhắn cho </h5>
                    </div>
                    <div class="send-message">
                        <form method="post" class="c-form">
                            <input name="idRe" id="idRe" type="hidden" value="">
                            <textarea placeholder="Viết tin nhắn ..."></textarea>
                            <button type="submit" class="main-btn">gửi</button>
                        </form>

                    </div>
                </div>
            </div>
        </div><!-- send message popup -->	

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
