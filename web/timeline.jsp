<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>${sessionScope.GInfor.lastName} ${sessionScope.GInfor.middleName} ${sessionScope.GInfor.firstName}</title>
        <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 

        <link rel="stylesheet" href="css/main.min.css">
        <link rel="stylesheet" href="css/nprogress.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .fiximgg{
                min-width: 60px;
                min-height: 60px;
                max-width: 60px;
                max-height: 60px;
                padding: 2px 2px;
            }

            .showSize{
                min-width: 100%;
                min-height: 200px;
                max-width: 100%;
                max-height: 200px;
            }
        </style>
        <style>
            .fooImbaFixed {
                display: inline-block;
                position: relative;
            }
            .fooImbaFixed > img {
                background-size: cover;
                border: 4px solid #edf2f6;
                max-width: 120px;
                min-width: 120px;
                max-height: 140px;
                min-height: 140px;
                display: inline-block;
                margin-top: 10px;
                margin-bottom: 10px;
                padding: 5px;
            }
            .fooImbaFixed:hover .fooEdit-dp {
                opacity: 0.8;
                transform: scale(1);
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
            .anPost{
                display: none;
            }
        </style>
        <script>
            function readURLPostImg(input, param, n, next) {
                if (input.files && input.files[0]) {
                    document.getElementById('containerImg' + n).classList.remove('anPost');

                    document.getElementById('containerImg' + next).classList.remove('anPost');
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        //$('#avt').attr('src', e.target.result).width(155).height(155);
                        $('#' + param).attr('src', e.target.result).width(200).height(250);
                    };
                    reader.readAsDataURL(input.files[0]);

                    document.getElementById('stt').value = n;

                }
            }

            function showPost(postID, src) {
                $.ajax({
                    url: 'loadDetailPost',
                    type: 'post',
                    data: {
                        index: '1',
                        postID: postID
                    },
                    success: function (data) {
                        document.getElementById('currentIMG').src = src;
                        document.getElementById('postID').value = postID;
                        document.getElementById('hostInfo').innerHTML = data;
                    }

                });
            }

            function showPostInfo(postID) {
                $.ajax({
                    url: 'loadDetailPost',
                    type: 'post',
                    data: {
                        index: '2',
                        postID: postID
                    },
                    success: function (data) {
                        document.getElementById('postInfo').innerHTML = data;
                    }

                });
            }

            function postComment(postID) {
                $.ajax({
                    url: 'loadDetailPost',
                    type: 'post',
                    data: {
                        index: '3',
                        postID: postID
                    },
                    success: function (data) {
                        document.getElementById('postComment').innerHTML = data;
                    }

                });
            }
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
                });


            }
        </script>
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

            <div class="postoverlay"></div>
            <jsp:include page="topbar.jsp"></jsp:include>	
            <jsp:include page="userOnline.jsp"></jsp:include>

                <section>
                    <div class="gap2 gray-bg">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="row merged20" id="page-contents">
                                    <jsp:include page="profileBanner.jsp"></jsp:include>
                                        <div class="col-lg-3">
                                            <aside class="sidebar static left">
                                                <div class="widget">
                                                    <h4 class="widget-title">Th??ng tin c?? b???n</h4>	
                                                    <div class="your-page">
                                                        <figure>
                                                        <c:if test="${GInfor.avatar != 'Null'}">
                                                            <a href="#" title=""><img class="fiximgg" src="userPhoto/${GInfor.userId}/avatar/${GInfor.avatar}" alt=""></a>
                                                            </c:if>
                                                            <c:if test="${GInfor.avatar == 'Null'}">
                                                            <a href="#" title=""><img class="fiximgg" src="images/avatardefault.png" alt=""></a>
                                                            </c:if>
                                                    </figure>
                                                    <div class="page-meta">
                                                        <a href="#" title="" class="underline">${GInfor.lastName} ${GInfor.middleName} ${GInfor.firstName}</a>
                                                        <span><i class="ti-comment"></i><a href="insight.html" title="">Messages <em>9</em></a></span>
                                                        <span><i class="ti-bell"></i><a href="insight.html" title="">Notifications <em>2</em></a></span>
                                                    </div>

                                                    <div class="page-likes">
                                                        <ul class="nav nav-tabs likes-btn">
                                                            <li class="nav-item"><a class="active" href="#link1" data-toggle="tab" data-ripple="">Ng?????i theo d??i</a></li>
                                                            <li class="nav-item"><a class="" href="#link2" data-toggle="tab" data-ripple="">??ang theo d??i</a></li>
                                                        </ul>
                                                        <!-- Tab panes -->
                                                        <div class="tab-content">
                                                            <div class="tab-pane active fade show " id="link1" >
                                                                <span><i class="ti-heart"></i>884</span>
                                                                <a href="#" title="weekly-likes">35 new likes this week</a>
                                                                <div class="users-thumb-list">
                                                                    <a href="#" title="Anderw" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-1.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="frank" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-2.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Sara" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-3.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Amy" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-4.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Ema" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-5.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Sophie" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-6.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Maria" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-7.jpg" alt="">  
                                                                    </a>  
                                                                </div>
                                                            </div>
                                                            <div class="tab-pane fade" id="link2" >
                                                                <span><i class="fa fa-eye"></i>440</span>
                                                                <a href="#" title="weekly-likes">440 new views this week</a>
                                                                <div class="users-thumb-list">
                                                                    <a href="#" title="Anderw" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-1.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="frank" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-2.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Sara" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-3.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Amy" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-4.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Ema" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-5.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Sophie" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-6.jpg" alt="">  
                                                                    </a>
                                                                    <a href="#" title="Maria" data-toggle="tooltip">
                                                                        <img src="images/resources/userlist-7.jpg" alt="">  
                                                                    </a>  
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- page like widget -->
                                            <div class="advertisment-box">
                                                <h4 class="">Qu???ng c??o</h4>
                                                <figure>
                                                    <a href="#" title="Advertisment"><img src="images/resources/ad-widget.gif" alt=""></a>
                                                </figure>
                                            </div>
                                            <div class="widget stick-widget">
                                                <h4 class="widget-title">????? xu???t</h4>
                                                <ul class="followers">
                                                    <li>
                                                        <figure><img src="images/resources/friend-avatar2.jpg" alt=""></figure>
                                                        <div class="friend-meta">
                                                            <h4><a href="time-line.html" title="">Kelly Bill</a></h4>
                                                            <a href="#" title="" class="underline">Add Friend</a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <figure><img src="images/resources/friend-avatar4.jpg" alt=""></figure>
                                                        <div class="friend-meta">
                                                            <h4><a href="time-line.html" title="">Issabel</a></h4>
                                                            <a href="#" title="" class="underline">Add Friend</a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <figure><img src="images/resources/friend-avatar6.jpg" alt=""></figure>
                                                        <div class="friend-meta">
                                                            <h4><a href="time-line.html" title="">Andrew</a></h4>
                                                            <a href="#" title="" class="underline">Add Friend</a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <figure><img src="images/resources/friend-avatar8.jpg" alt=""></figure>
                                                        <div class="friend-meta">
                                                            <h4><a href="time-line.html" title="">Sophia</a></h4>
                                                            <a href="#" title="" class="underline">Add Friend</a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <figure><img src="images/resources/friend-avatar3.jpg" alt=""></figure>
                                                        <div class="friend-meta">
                                                            <h4><a href="time-line.html" title="">Allen</a></h4>
                                                            <a href="#" title="" class="underline">Add Friend</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div><!-- who's following -->
                                        </aside>
                                    </div><!-- sidebar -->
                                    <div class="col-lg-6">
                                        <div class="central-meta postbox">
                                            <span class="create-post">Vi???t l??n d??ng th???i gian c???a ${GInfor.lastName} ${GInfor.middleName} ${GInfor.firstName}</span>
                                            <div class="new-postbox">
                                                <figure>
                                                    <c:if test="${avt != 'Null'}">
                                                        <img class="fiximg" src="userPhoto/${sessionScope.AccLogin.userId}/avatar/${avt}" alt="">
                                                    </c:if>
                                                    <c:if test="${avt == 'Null'}">
                                                        <img class="fiximg" src="images/avatardefault.png" alt="">
                                                    </c:if> 
                                                </figure>
                                                <div class="newpst-input">
                                                    <div class="newpst-input">
                                                        <form action="addPost" method="post" enctype="multipart/form-data">
                                                            <textarea oninput="validate2(this)" name="contentPost" rows="2" placeholder="Chia s??? nh???ng suy ngh?? c???a b???n?"></textarea>
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
                                                            <button style="width: 100%" class="post-btn" type="submit" data-ripple="">????ng</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>

                                        </div><!-- add post new box -->
                                        <div class="loadMore">
                                            <c:forEach items="${PostsByUser}" var="p">
                                                <c:if test="${p.postType == 'image'}">
                                                    <div class="central-meta item">
                                                        <div class="user-post">
                                                            <div class="friend-info">
                                                                <figure>
                                                                    <img src="${p.getUserAvatar()}" alt="">
                                                                </figure>
                                                                <div class="friend-name">
                                                                    <div class="more">
                                                                        <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                            <ul>
                                                                                <c:if test="${p.userID == AccLogin.userId}">
                                                                                    <li class="edit-post" ><i class="fa fa-pencil-square-o"></i>S???a b??i vi???t</li>
                                                                                    <li><i class="fa fa-trash-o"></i><a href="deletePost?postID=${p.postID}">X??a b??i vi???t</a></li>
                                                                                        </c:if>
                                                                                        <c:if test="${p.userID != AccLogin.userId}">
                                                                                    <li onclick="getReportInfo('${p.postID}', '${p.userID}')" class="bad-report"><i class="fa fa-flag"></i>B??o c??o</li>
                                                                                    </c:if>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <ins><a href="getUserInfor?userID=${p.userID}" title="">${p.getFullName()}</a> ???? th??m album m???i</ins>
                                                                    <span><i class="fa fa-globe"></i> C??ng khai: ${p.getUnitTime().countTime} ${p.getUnitTime().unit} tr?????c</span>
                                                                </div>
                                                                <div class="post-meta">
                                                                    <p>
                                                                        ${p.detail}
                                                                    </p>
                                                                    <figure>
                                                                        <div class="img-bunch">
                                                                            <div class="row">
                                                                                <c:if test="${p.sizeAlbum() == 1}">
                                                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');showPostInfo('${p.postID}');
                                                                                                        postComment('${p.postID}');
                                                                                                        getListIMG('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>

                                                                                    </div>
                                                                                </c:if>
                                                                                <c:if test="${p.sizeAlbum() == 2}">
                                                                                    <c:forEach items="${p.getAllImageAttachment()}" var="a">
                                                                                        <div class="col-lg-6 col-md-6 col-sm-6">

                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');
                                                                                                        showPostInfo('${p.postID}');
                                                                                                        postComment('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                            </figure>


                                                                                        </div>
                                                                                    </c:forEach>
                                                                                </c:if>
                                                                                <c:if test="${p.sizeAlbum() == 3}">
                                                                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" begin="0" end="0" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');
                                                                                                        showPostInfo('${p.postID}');
                                                                                                        postComment('${p.postID}');" style="cursor: pointer" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>
                                                                                    </div>
                                                                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" begin="1" end="2" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');showPostInfo('${p.postID}');postComment('${p.postID}');" style="cursor: pointer" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>
                                                                                    </div>
                                                                                </c:if>
                                                                                <c:if test="${p.sizeAlbum() == 4}">
                                                                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" begin="0" end="1" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');showPostInfo('${p.postID}');
                                                                                                        postComment('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img class="showSize" src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>
                                                                                    </div>
                                                                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" begin="2" end="3" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');
                                                                                                        showPostInfo('${p.postID}');
                                                                                                        postComment('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img class="showSize" src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>
                                                                                    </div>
                                                                                </c:if>
                                                                                <c:if test="${p.sizeAlbum() > 4}">
                                                                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" begin="0" end="1" var="a">
                                                                                            <figure>
                                                                                                <a  onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');showPostInfo('${p.postID}');postComment('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img class="showSize" src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>
                                                                                    </div>
                                                                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" begin="2" end="2" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');
                                                                                                        showPostInfo('${p.postID}');postComment('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img class="showSize" src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" begin="3" end="3" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', 'userPhoto/${p.userID}/photo/${a.attachmentURL}');
                                                                                                        showPostInfo('${p.postID}');
                                                                                                        postComment('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img class="showSize" src="userPhoto/${p.userID}/photo/${a.attachmentURL}" alt="">
                                                                                                </a>
                                                                                                <a class="more-photos" href="loadPostDetailPage?postID=${p.postID}">
                                                                                                    <span style="color: white">+${p.sizeAlbum() - 4}</span>
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>
                                                                                    </div>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>	
                                                                    </figure>	
                                                                    <div class="we-video-info">
                                                                        <ul>
                                                                            <li>
                                                                                <c:if test="${p.isLike(AccLogin.userId) == true}">
                                                                                    <div id="${p.postID}" onclick="likePost('${p.postID}')" class="likes heart happy" title="Like/Dislike">??? <span id="t${p.postID}">${p.getLikeTotal()}</span></div>
                                                                                    </c:if>
                                                                                    <c:if test="${p.isLike(AccLogin.userId) == false}">
                                                                                    <div id="${p.postID}" onclick="likePost('${p.postID}')" class="likes heart broken" title="Like/Dislike">??? <span id="t${p.postID}">${p.getLikeTotal()}</span></div>
                                                                                    </c:if>
                                                                            </li>
                                                                            <li>
                                                                                <span class="comment" title="Comments">
                                                                                    <i class="fa fa-commenting"></i>
                                                                                    <ins>${p.getCommentTotal()}</ins>
                                                                                </span>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="coment-area" style="">
                                                                    <ul class="we-comet">
                                                                        <c:forEach items="${p.getAllCommentInpost()}" var="com">
                                                                            <li>
                                                                                <div class="comet-avatar">
                                                                                    <img src="${com.getUserAvatar()}" alt="">
                                                                                </div>
                                                                                <div class="we-comment">
                                                                                    <h5><a href="getUserInfor?userID=${com.userID}" title="">${com.getFullName()}</a></h5>
                                                                                    <p>${com.detail}</p>
                                                                                    <div class="inline-itms">
                                                                                        <span>${com.getUnitTime().countTime} ${com.getUnitTime().unit} tr?????c</span>
                                                                                        <a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
                                                                                        <a href="#" title=""><i class="fa fa-heart"></i><span></span></a>
                                                                                    </div>
                                                                                </div>

                                                                            </li>
                                                                        </c:forEach>
                                                                        <li>
                                                                            <a href="#" title="" class="showmore underline">xem th??m+</a>
                                                                        </li>
                                                                        <li class="post-comment">
                                                                            <div class="comet-avatar">
                                                                                <img src="userPhoto/${AccLogin.userId}/avatar/${userInfor.avatar}" alt="">
                                                                            </div>
                                                                            <div class="post-comt-box">
                                                                                <form method="post" action="addComment">
                                                                                    <input type="hidden" name="postID" value="${p.postID}" />
                                                                                    <input type="hidden" name="userID" value="${AccLogin.userId}" />
                                                                                    <textarea oninput="validate2(this)" name="detail" placeholder="Vi???t b??nh lu???n..."></textarea>
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

                                                                                    <button type="submit"></button>
                                                                                </form>	
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${p.postType == 'text'}">
                                                    <div class="central-meta item">
                                                        <div class="user-post">
                                                            <div class="friend-info">
                                                                <figure>
                                                                    <img src="${p.getUserAvatar()}" alt="">
                                                                </figure>
                                                                <div class="friend-name">
                                                                    <div class="more">
                                                                        <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                            <ul>
                                                                                <c:if test="${p.userID == AccLogin.userId}">
                                                                                    <li><i class="fa fa-pencil-square-o"></i>S???a b??i vi???t</li>
                                                                                    <li><i class="fa fa-trash-o"></i><a href="deletePost?postID=${p.postID}">X??a b??i vi???t</a></li>
                                                                                        </c:if>
                                                                                        <c:if test="${p.userID != AccLogin.userId}">
                                                                                    <li onclick="getReportInfo('${p.postID}', '${p.userID}')" class="bad-report"><i class="fa fa-flag"></i>B??o c??o</li>
                                                                                    </c:if>

                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <ins><a href="getUserInfor?userID=${p.userID}" title="">${p.getFullName()}</a> ???? c???p nh???t tr???ng th??i m???i</ins>
                                                                    <span><i class="fa fa-globe"></i> C??ng khai: ${p.getUnitTime().countTime} ${p.getUnitTime().unit} tr?????c </span>
                                                                </div>
                                                                <div class="post-meta">
                                                                    <p>
                                                                        ${p.detail}
                                                                    </p>	
                                                                    <div class="we-video-info">
                                                                        <ul>
                                                                            <li>
                                                                                <c:if test="${p.isLike(AccLogin.userId) == true}">
                                                                                    <div id="${p.postID}" onclick="likePost('${p.postID}')" class="likes heart happy" title="Like/Dislike">??? <span id="t${p.postID}">${p.getLikeTotal()}</span></div>
                                                                                    </c:if>
                                                                                    <c:if test="${p.isLike(AccLogin.userId) == false}">
                                                                                    <div id="${p.postID}" onclick="likePost('${p.postID}')" class="likes heart broken" title="Like/Dislike">??? <span id="t${p.postID}">${p.getLikeTotal()}</span></div>
                                                                                    </c:if>
                                                                            </li>
                                                                            <li>
                                                                                <span class="comment" title="Comments">
                                                                                    <i class="fa fa-commenting"></i>
                                                                                    <ins>${p.getCommentTotal()}</ins>
                                                                                </span>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="coment-area" style="">
                                                                    <ul class="we-comet">
                                                                        <c:forEach items="${p.getAllCommentInpost()}" var="com">
                                                                            <li>
                                                                                <div class="comet-avatar">
                                                                                    <img src="${com.getUserAvatar()}" alt="">
                                                                                </div>
                                                                                <div class="we-comment">
                                                                                    <h5><a href="getUserInfor?userID=${com.userID}" title="">${com.getFullName()}</a></h5>
                                                                                    <p>${com.detail}</p>
                                                                                    <div class="inline-itms">
                                                                                        <span>${com.getUnitTime().countTime} ${com.getUnitTime().unit} tr?????c</span>
                                                                                        <a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
                                                                                        <a href="#" title=""><i class="fa fa-heart"></i><span></span></a>
                                                                                    </div>
                                                                                </div>

                                                                            </li>
                                                                        </c:forEach>
                                                                        <li>
                                                                            <a href="#" title="" class="showmore underline">xem th??m+</a>
                                                                        </li>
                                                                        <li class="post-comment">
                                                                            <div class="comet-avatar">
                                                                                <img src="userPhoto/${AccLogin.userId}/avatar/${userInfor.avatar}" alt="">
                                                                            </div>
                                                                            <div class="post-comt-box">
                                                                                <form method="post" action="addComment">
                                                                                    <input type="hidden" name="postID" value="${p.postID}" />
                                                                                    <input type="hidden" name="userID" value="${AccLogin.userId}" />
                                                                                    <textarea oninput="validate2(this)" name="detail" placeholder="Vi???t b??nh lu???n..."></textarea>
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

                                                                                    <button type="submit"></button>
                                                                                </form>	
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${p.postType == 'avatar'}">
                                                    <div class="central-meta item">
                                                        <div class="user-post">
                                                            <div class="friend-info">
                                                                <figure>
                                                                    <img src="${p.getUserAvatar()}" alt="">
                                                                </figure>
                                                                <div class="friend-name">
                                                                    <div class="more">
                                                                        <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                            <ul>
                                                                                <c:if test="${p.userID == AccLogin.userId}">
                                                                                    <li><i class="fa fa-pencil-square-o"></i>S???a b??i vi???t</li>
                                                                                    <li><i class="fa fa-trash-o"></i><a href="deletePost?postID=${p.postID}">X??a b??i vi???t</a></li>
                                                                                        </c:if>
                                                                                        <c:if test="${p.userID != AccLogin.userId}">
                                                                                    <li onclick="getReportInfo('${p.postID}', '${p.userID}')" class="bad-report"><i class="fa fa-flag"></i>B??o c??o</li>
                                                                                    </c:if>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <ins><a href="getUserInfor?userID=${p.userID}" title="">${p.getFullName()}</a> ???? c???p nh???t ???nh ?????i di???n m???i</ins>
                                                                    <span><i class="fa fa-globe"></i> C??ng khai: ${p.getUnitTime().countTime} ${p.getUnitTime().unit} tr?????c </span>
                                                                </div>
                                                                <div class="post-meta">
                                                                    <p>
                                                                        ${p.detail}
                                                                    </p>
                                                                    <figure>
                                                                        <div class="img-bunch">
                                                                            <div class="row">
                                                                                <c:if test="${p.sizeAlbum() == 1}">
                                                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', '${p.getUserAvatar()}');
                                                                                                        showPostInfo('${p.postID}');
                                                                                                        postComment('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img src="${p.getUserAvatar()}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>

                                                                                    </div>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>	
                                                                    </figure>	
                                                                    <div class="we-video-info">
                                                                        <ul>
                                                                            <li>
                                                                                <c:if test="${p.isLike(AccLogin.userId) == true}">
                                                                                    <div id="${p.postID}" onclick="likePost('${p.postID}')" class="likes heart happy" title="Like/Dislike">??? <span id="t${p.postID}">${p.getLikeTotal()}</span></div>
                                                                                    </c:if>
                                                                                    <c:if test="${p.isLike(AccLogin.userId) == false}">
                                                                                    <div id="${p.postID}" onclick="likePost('${p.postID}')" class="likes heart broken" title="Like/Dislike">??? <span id="t${p.postID}">${p.getLikeTotal()}</span></div>
                                                                                    </c:if>
                                                                            </li>
                                                                            <li>
                                                                                <span class="comment" title="Comments">
                                                                                    <i class="fa fa-commenting"></i>
                                                                                    <ins>${p.getCommentTotal()}</ins>
                                                                                </span>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="coment-area" style="">
                                                                    <ul class="we-comet">
                                                                        <c:forEach items="${p.getAllCommentInpost()}" var="com">
                                                                            <li>
                                                                                <div class="comet-avatar">
                                                                                    <img src="${com.getUserAvatar()}" alt="">
                                                                                </div>
                                                                                <div class="we-comment">
                                                                                    <h5><a href="getUserInfor?userID=${com.userID}" title="">${com.getFullName()}</a></h5>
                                                                                    <p>${com.detail}</p>
                                                                                    <div class="inline-itms">
                                                                                        <span>${com.getUnitTime().countTime} ${com.getUnitTime().unit} tr?????c</span>
                                                                                        <a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
                                                                                        <a href="#" title=""><i class="fa fa-heart"></i><span></span></a>
                                                                                    </div>
                                                                                </div>

                                                                            </li>
                                                                        </c:forEach>
                                                                        <li>
                                                                            <a href="#" title="" class="showmore underline">xem th??m+</a>
                                                                        </li>
                                                                        <li class="post-comment">
                                                                            <div class="comet-avatar">
                                                                                <img src="userPhoto/${AccLogin.userId}/avatar/${userInfor.avatar}" alt="">
                                                                            </div>
                                                                            <div class="post-comt-box">
                                                                                <form method="post" action="addComment">
                                                                                    <input type="hidden" name="postID" value="${p.postID}" />
                                                                                    <input type="hidden" name="userID" value="${AccLogin.userId}" />
                                                                                    <textarea oninput="validate2(this)" name="detail" placeholder="Vi???t b??nh lu???n..."></textarea>
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

                                                                                    <button type="submit"></button>
                                                                                </form>	
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${p.postType == 'background'}">
                                                    <div class="central-meta item">
                                                        <div class="user-post">
                                                            <div class="friend-info">
                                                                <figure>
                                                                    <img src="${p.getUserAvatar()}" alt="">
                                                                </figure>
                                                                <div class="friend-name">
                                                                    <div class="more">
                                                                        <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                            <ul>
                                                                                <c:if test="${p.userID == AccLogin.userId}">
                                                                                    <li><i class="fa fa-pencil-square-o"></i>S???a b??i vi???t</li>
                                                                                    <li><i class="fa fa-trash-o"></i><a href="deletePost?postID=${p.postID}">X??a b??i vi???t</a></li>
                                                                                        </c:if>
                                                                                        <c:if test="${p.userID != AccLogin.userId}">
                                                                                    <li onclick="getReportInfo('${p.postID}', '${p.userID}')" class="bad-report"><i class="fa fa-flag"></i>B??o c??o</li>
                                                                                    </c:if>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <ins><a href="getUserInfor?userID=${p.userID}" title="">${p.getFullName()}</a> ???? c???p nh???t ???nh b??a m???i</ins>
                                                                    <span><i class="fa fa-globe"></i> C??ng khai: ${p.getUnitTime().countTime} ${p.getUnitTime().unit} tr?????c </span>
                                                                </div>
                                                                <div class="post-meta">
                                                                    <p>
                                                                        ${p.detail}
                                                                    </p>
                                                                    <figure>
                                                                        <div class="img-bunch">
                                                                            <div class="row">
                                                                                <c:if test="${p.sizeAlbum() == 1}">
                                                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                                                        <c:forEach items="${p.getAllImageAttachment()}" var="a">
                                                                                            <figure>
                                                                                                <a onclick="showPost('${p.postID}', '${p.getUserBackground()}');
                                                                                                        showPostInfo('${p.postID}');
                                                                                                        postComment('${p.postID}');" style="cursor: pointer" title="" data-toggle="modal" data-target="#img-comt">
                                                                                                    <img src="${p.getUserBackground()}" alt="">
                                                                                                </a>
                                                                                            </figure>
                                                                                        </c:forEach>

                                                                                    </div>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>	
                                                                    </figure>	
                                                                    <div class="we-video-info">
                                                                        <ul>
                                                                            <li>
                                                                                <c:if test="${p.isLike(AccLogin.userId) == true}">
                                                                                    <div id="${p.postID}" onclick="likePost('${p.postID}')" class="likes heart happy" title="Like/Dislike">??? <span id="t${p.postID}">${p.getLikeTotal()}</span></div>
                                                                                    </c:if>
                                                                                    <c:if test="${p.isLike(AccLogin.userId) == false}">
                                                                                    <div id="${p.postID}" onclick="likePost('${p.postID}')" class="likes heart broken" title="Like/Dislike">??? <span id="t${p.postID}">${p.getLikeTotal()}</span></div>
                                                                                    </c:if>
                                                                            </li>
                                                                            <li>
                                                                                <span class="comment" title="Comments">
                                                                                    <i class="fa fa-commenting"></i>
                                                                                    <ins>${p.getCommentTotal()}</ins>
                                                                                </span>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="coment-area" style="">
                                                                    <ul class="we-comet">
                                                                        <c:forEach items="${p.getAllCommentInpost()}" var="com">
                                                                            <li>
                                                                                <div class="comet-avatar">
                                                                                    <img src="${com.getUserAvatar()}" alt="">
                                                                                </div>
                                                                                <div class="we-comment">
                                                                                    <h5><a href="getUserInfor?userID=${com.userID}" title="">${com.getFullName()}</a></h5>
                                                                                    <p>${com.detail}</p>
                                                                                    <div class="inline-itms">
                                                                                        <span>${com.getUnitTime().countTime} ${com.getUnitTime().unit} tr?????c</span>
                                                                                        <a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
                                                                                        <a href="#" title=""><i class="fa fa-heart"></i><span></span></a>
                                                                                    </div>
                                                                                </div>

                                                                            </li>
                                                                        </c:forEach>
                                                                        <li>
                                                                            <a href="#" title="" class="showmore underline">xem th??m+</a>
                                                                        </li>
                                                                        <li class="post-comment">
                                                                            <div class="comet-avatar">
                                                                                <img src="userPhoto/${AccLogin.userId}/avatar/${userInfor.avatar}" alt="">
                                                                            </div>
                                                                            <div class="post-comt-box">
                                                                                <form method="post" action="addComment">
                                                                                    <input type="hidden" name="postID" value="${p.postID}" />
                                                                                    <input type="hidden" name="userID" value="${AccLogin.userId}" />
                                                                                    <textarea oninput="validate2(this)" name="detail" placeholder="Vi???t b??nh lu???n..."></textarea>
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

                                                                                    <button type="submit"></button>
                                                                                </form>	
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div><!-- centerl meta -->
                                    <div class="col-lg-3">
                                        <aside class="sidebar static right">
                                            <div class="widget">
                                                <h4 class="widget-title">Th??ng tin</h4>
                                                <ul class="short-profile">
                                                    <li>
                                                        <span>Th??ng tin</span>

                                                        <p>${GInfor.lastName} ${GInfor.middleName} ${GInfor.firstName}</p>



                                                    </li>
                                                    <li>
                                                        <span>Gi??o d???c</span>
                                                        <p>${GInfor.education} </p>
                                                    </li>
                                                    <li>
                                                        <span>S??? th??ch</span>
                                                        <p><p>${GInfor.hobbie}</p>
                                                    </li>
                                                </ul>
                                            </div><!-- profile intro widget -->
                                        </aside>
                                    </div><!-- sidebar -->
                                </div>	
                            </div>
                        </div>
                    </div>
                </div>	
            </section><!-- content -->
        </div>	
        <div class="popup-wraper1">
            <div class="popup direct-mesg">
                <span class="popup-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        <h5>Send Message</h5>
                    </div>
                    <div class="send-message">
                        <form method="post" class="c-form">
                            <input type="text" placeholder="Sophia">
                            <textarea oninput="validate2(this)" placeholder="Write Message"></textarea>
                            <button type="submit" class="main-btn">Send</button>
                        </form>
                        <div class="add-smiles">
                            <div class="uploadimage">
                                <i class="fa fa-image"></i>
                                <label class="fileContainer">
                                    <input type="file">
                                </label>
                            </div>
                            <span title="add icon" class="em em-expressionless"></span>
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

                    </div>
                </div>
            </div>
        </div><!-- send message popup -->	
        <div class="modal fade" id="img-comt">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">??</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row" >
                            <div class="col-lg-8">
                                <div class="pop-image">
                                    <div class="pop-item">
                                        <figure>
                                            <figure>
                                                <img id="currentIMG" src="">
                                            </figure>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="user" id="hostInfo">
                                    <figure><img style="max-height: 49px; max-width: 49px;" src="userPhoto/1132200004/avatar/01 (50).png" alt=""></figure>
                                    <div class="user-information">
                                        <h4><a id="nameHost" href="#" title=""></a></h4>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="we-video-info" id="postInfo">
                                    <ul>

                                    </ul>
                                </div>
                                <div style="display: block;" class="coment-area">
                                    <ul class="we-comet" id="postComment">
                                    </ul>

                                </div>
                                <div class="post-comment">
                                    <div class="comet-avatar">
                                        <img src="userPhoto/${AccLogin.userId}/avatar/${userInfor.avatar}" alt="">
                                    </div>
                                    <div class="post-comt-box" style="width: 80%;">
                                        <form method="post" action="addComment">
                                            <input type="hidden" name="postID" id="postID" value="" />
                                            <input type="hidden" name="userID" value="${AccLogin.userId}" />
                                            <textarea oninput="validate2(this)" name="detail" placeholder="Vi???t b??nh lu???n..."></textarea>
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
        <div class="popup-wraper3">
            <div class="popup">
                <span class="popup-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        <h5>B??o c??o</h5>
                    </div>
                    <div class="Rpt-meta">
                        <span>B???n mu???n b??o c??o v??? v???n ????? g???</span>
                        <form action="sendReport" method="post" class="c-form">
                            <input hidden="" name="postId" id="postId" value="">
                            <input hidden="" name="accused" id="accused" value="">
                            <div class="form-radio">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="H??nh ???nh nh???y c???m" checked="checked"><i class="check-box"></i>H??nh ???nh nh???y c???m
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="B???o l???c"><i class="check-box"></i>B???o l???c
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="Qu???y r???i"><i class="check-box"></i>Qu???y r???i
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="Th??ng tin sai s??? th???t"><i class="check-box"></i>Th??ng tin sai s??? th???t
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="Spam"><i class="check-box"></i>Spam
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="B??n h??ng tr??i ph??p"><i class="check-box"></i>B??n h??ng tr??i ph??p
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="Ng??n t??? g??y th?? gh??t"><i class="check-box"></i>Ng??n t??? g??y th?? gh??t
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="Kh???ng b???"><i class="check-box"></i>Kh???ng b???
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="reason" value="N???i dung g???m ghi???c"><i class="check-box"></i>N???i dung g???m ghi???c
                                    </label>
                                </div>
                            </div>
                            <div>
                                <button data-ripple="" type="submit" class="main-btn">G???i ??i</button>
                                <a href="#" data-ripple="" class="main-btn3 cancel">H???y</a>
                            </div>
                        </form>	
                    </div>
                </div>	
            </div>
        </div><!-- report popup -->
        <div class="editPost">
            <div class="popup">
                <span class="edit-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        <h5>Ch???nh s???a b??i vi???t</h5>
                    </div>
                    <figure>
                        <c:if test="${avt != 'Null'}">
                            <img class="fiximg" src="userPhoto/${sessionScope.AccLogin.userId}/avatar/${avt}" alt="">
                        </c:if>
                        <c:if test="${avt == 'Null'}">
                            <img class="fiximg" src="images/avatardefault.png" alt="">
                        </c:if>    
                    </figure>
                    <div class="newpst-input">
                        <form action="addPost" method="post" enctype="multipart/form-data">
                            <textarea oninput="validate2(this)" name="contentPost" rows="2" placeholder="Chia s??? nh???ng suy ngh?? c???a b???n?"></textarea>
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
                            <button style="width: 100%" class="post-btn" type="submit" data-ripple="">S???a</button>
                        </form>
                    </div>
                </div>	
            </div>
        </div>

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

                                                function getReportInfo(param1, param2) {
                                                    document.getElementById('postId').value = param1;
                                                    document.getElementById('accused').value = param2;
                                                }
        </script>

    </body>	

</html>
