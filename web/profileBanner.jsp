<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="user-profile">
    <figure>
        <c:if test="${myInfor == null}">
            <c:if test="${GInfor.userId == AccLogin.userId}">
                <div class="edit-pp">
                    <label class="fileContainer" id="upBGR">
                        <i class="fa fa-camera"></i>
                        <a></a>
                    </label>
                </div>
            </c:if>
        </c:if>
        <c:if test="${myInfor != null}">
            <c:if test="${myInfor.userId == AccLogin.userId}">
                <div class="edit-pp">
                    <label class="fileContainer" id="upBGR">
                        <i class="fa fa-camera"></i>
                        <a></a>
                    </label>
                </div>
            </c:if>
        </c:if>

        <style>
            #bgr{
                max-height: 370px;
            }
        </style>
        <c:if test="${myInfor == null}">
            <c:if test="${GInfor.background != 'Null' && GInfor.background != '' }">
                <img id="bgr" alt="author" src="userPhoto/${GInfor.userId}/background/${GInfor.background}">
            </c:if>
            <c:if test="${GInfor.background == 'Null' || GInfor.background == ''}">
                <img id="bgr" src="images/resources/profile-image.jpg" alt="">
            </c:if>
        </c:if>
        <c:if test="${myInfor != null}">
            <c:if test="${myInfor.background != 'Null' && myInfor.background != ''}">
                <img id="bgr" alt="author" src="userPhoto/${myInfor.userId}/background/${myInfor.background}">
            </c:if>
            <c:if test="${myInfor.background == 'Null'|| myInfor.background == ''}">
                <img id="bgr" src="images/resources/profile-image.jpg" alt="">
            </c:if>
        </c:if>

        <c:if test="${AccLogin.userId != GInfor.userId && myInfor.userId != AccLogin.userId}">
            <ul class="profile-controls">
                <c:if test="${status == null}">
                    <li id="statusUser" onclick="addFriend(${GInfor.userId})"><a title="Thêm bạn bè" data-toggle="tooltip"><i class="fa fa-user-plus"></i></a></li>
                        </c:if>
                        <c:if test="${status == '5'}">
                    <li id="statusUser" onclick="addFriend(${GInfor.userId})"><a title="Thêm bạn bè" data-toggle="tooltip"><i class="fa fa-user-plus"></i></a></li>
                        </c:if>
                        <c:if test="${status == '1'}">
                    <li id="statusUser" class="delete-friend"><a title="Hủy bạn bè" data-toggle="tooltip"><i class="fa fa-user-times"></i></a></li>
                        </c:if>
                        <c:if test="${status == '2'}">
                    <li id="statusUser" onclick="acceptFriend(${GInfor.userId})"><a title="Xác nhận bạn bè" data-toggle="tooltip"><i class="fa fa-user-plus"></i></a></li>
                        </c:if>
                        <c:if test="${status == '3'}">
                    <li id="statusUser" class="delete-friend"><a title="Hủy lời mời kết bạn" data-toggle="tooltip"><i class="fa fa-user-times"></i></a></li>
                        </c:if>

                <li><a href="#" title="Theo dõi" data-toggle="tooltip"><i class="fa fa-star"></i></a></li>
                <li><a class="send-mesg" href="#" title="Gửi tin nhắm" data-toggle="tooltip"><i class="fa fa-comment"></i></a></li>
                <li>
                    <div class="edit-seting" title="Edit Profile image"><i class="fa fa-sliders"></i>
                        <ul class="more-dropdown">
                            <li><a class="bad-report" href="#" title="">Báo cào tài khoản</a></li>
                            <li><a href="#" title="">Chặn tài khoản này</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </c:if>
    </figure>								
    <div class="profile-section">
        <div class="row">
            <div class="col-lg-2 col-md-3">
                <div class="profile-author">
                    <div class="profile-author-thumb">
                        <c:if test="${myInfor == null}">
                            <c:if test="${GInfor.avatar != 'Null'}">
                                <img id="avt" alt="author" src="userPhoto/${GInfor.userId}/avatar/${GInfor.avatar}">
                            </c:if>
                            <c:if test="${GInfor.avatar == 'Null'}">
                                <img id="avt" alt="author" src="images/avatardefault.png">
                            </c:if> 
                            <c:if test="${GInfor.userId == AccLogin.userId}">
                                <div class="edit-dp">
                                    <label class="fileContainer" id="saveImg">
                                        <i class="fa fa-camera"></i>
                                        <a id="avttt" name="avatar"></a>
                                    </label>               
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${myInfor != null}">
                            <c:if test="${myInfor.avatar != 'Null'}">
                                <img id="avt" alt="author" src="userPhoto/${myInfor.userId}/avatar/${myInfor.avatar}">
                            </c:if>
                            <c:if test="${myInfor.avatar == 'Null'}">
                                <img id="avt" alt="author" src="images/avatardefault.png">
                            </c:if>  
                            <c:if test="${myInfor.userId == AccLogin.userId}">
                                <div class="edit-dp">
                                    <label class="fileContainer" id="saveImg">
                                        <i class="fa fa-camera"></i>
                                        <a id="avttt" name="avatar"></a>
                                    </label>               
                                </div>
                            </c:if>
                        </c:if>



                    </div>
                    <div class="author-content">
                        <c:if test="${myInfor == null}">
                            <a class="h4 author-name" href="getUserInfor?userID=${GInfor.userId}">${GInfor.lastName} ${GInfor.middleName} ${GInfor.firstName}</a>
                        </c:if>
                        <c:if test="${myInfor != null}">
                            <a class="h4 author-name" href="getUserInfor?userID=${myInfor.userId}">${myInfor.lastName} ${myInfor.middleName} ${myInfor.firstName}</a> 
                        </c:if>

                    </div>
                </div>
            </div>
            <div class="col-lg-10 col-md-10">
                <c:if test="${myInfor == null}">
                    <ul style="width: 100%;" class="profile-menu">
                        <li>
                            <a class="${idPage == 1 ? "active":""}" href="getUserInfor?userID=${GInfor.userId}">Dòng thời gian</a>
                        </li>
                        <li>
                            <a class="${idPage == 2 ? "active":""}" href="loadUserAbout?userID=${GInfor.userId}">Thông tin</a>
                        </li>
                        <li>
                            <a class="${idPage == 3 ? "active":""}" href="loadFriendPage?userID=${GInfor.userId}">Bạn bè</a>
                        </li>
                        <li>
                            <a class="${idPage == 4 ? "active":""}" href="loadPhotoPage?userID=${GInfor.userId}">Hình ảnh</a>
                        </li>
                        <li>
                            <a class="${idPage == 5 ? "active":""}" href="#">Videos</a>
                        </li>
                        <c:if test="${GInfor.userId == AccLogin.userId}">
                            <li>
                                <a class="${idPage == 6 ? "active":""}" href="loadNotificationPage">Thông báo</a>
                            </li>
                        </c:if>
                        <c:if test="${AccLogin.role == '1' && AccLogin.userId == GInfor.userId}">
                            <li>
                                <a class="${idPage == 7 ? "active":""}" href="loadReportPage">Báo cáo</a>
                            </li>
                        </c:if>
                    </ul>
                </c:if>
                <c:if test="${myInfor != null}">
                    <ul style="width: 100%;" class="profile-menu">
                        <li>
                            <a class="${idPage == 1 ? "active":""}" href="getUserInfor?userID=${myInfor.userId}">Dòng thời gian</a>
                        </li>
                        <li>
                            <a class="${idPage == 2 ? "active":""}" href="loadUserAbout?userID=${myInfor.userId}">Thông tin</a>
                        </li>
                        <li>
                            <a class="${idPage == 3 ? "active":""}" href="loadFriendPage?userID=${myInfor.userId}">Bạn bè</a>
                        </li>
                        <li>
                            <a class="${idPage == 4 ? "active":""}" href="loadPhotoPage?userID=${myInfor.userId}">Hình ảnh</a>
                        </li>
                        <li>
                            <a class="${idPage == 5 ? "active":""}" href="#">Videos</a>
                        </li>
                        <c:if test="${myInfor.userId == AccLogin.userId}">
                            <li>
                                <a class="${idPage == 6 ? "active":""}" href="loadNotificationPage">Thông báo</a>
                            </li>
                        </c:if>
                        <c:if test="${AccLogin.role == '1'}">
                            <li>
                                <a class="${idPage == 7 ? "active":""}" href="loadReportPage">Báo cáo</a>
                            </li>
                        </c:if>
                    </ul>
                </c:if>

            </div>
        </div>
    </div>	
</div><!-- user profile banner  -->
<script>
    function acceptFriend(param) {
        var userID = param;
        $.ajax({
            url: "acceptFriend",
            type: "post",
            data: {
                userid: userID,
                id: "1"
            },
            success: function (data) {
                var liStatus = document.getElementById("statusUser");
                liStatus.innerHTML = data;
            },
            error: function (xhr) {

            }
        });

        $.ajax({
            url: "acceptFriend",
            type: "post",
            data: {id: "2"},
            success: function (data) {
                var numrq = document.getElementById("numRequest");
                numrq.innerHTML = data;
            }
        });

        $.ajax({
            url: "acceptFriend",
            type: "post",
            data: {id: "3"},
            success: function (data) {
                var listrq = document.getElementById("listRequest");
                listrq.innerHTML = data;
            }
        });

        $.ajax({
            url: "acceptFriend",
            type: "post",
            data: {id: "4"},
            success: function (data) {
                var numRQ = document.getElementById("numRQ");
                numRQ.innerHTML = data;
            }
        });
    }

    function addFriend(param) {
        var userID = param;
        $.ajax({
            url: "addFriend",
            type: "post",
            data: {
                userid: userID,
            },
            success: function (data) {
                var liStatus = document.getElementById("statusUser");
                liStatus.innerHTML = data;
            },
            error: function (xhr) {

            }
        });
    }
</script>
<script>
    function showFileName() {
        var fil = document.getElementById("avttt");
        $.ajax({
            url: "putToSession",
            type: "post",
            data: {
                src: fil.value
            },
            success: function (data) {
                var liStatus = document.getElementById("tesst");
                liStatus.innerHTML = data;
            },
            error: function (xhr) {

            }
        });

    }
</script>
<div class="popup-wraper8">
    <div class="popup">
        <span class="deleteFriend-closed"><i class="ti-close"></i></span>
        <div class="popup-meta">
            <div class="popup-head">
                <h5>Xóa ${GInfor.lastName} khỏi danh sách bạn bè</h5>
            </div>
            <div class="Rpt-meta">
                <span>Chúng tôi rất tiếc về điều này, bạn và ${GInfor.lastName} vẫn sẽ có thể gặp lại trên Tóp Tóp</span>
                <form action="deleteFriend?partID=${GInfor.userId}" method="post" class="c-form">
                    <div>
                        <button data-ripple="" type="submit" class="main-btn">Hủy Bạn bè</button>
                        <a href="#" data-ripple="" class="main-btn3 cancel">Đóng</a>
                    </div>
                </form>	
            </div>
        </div>	
    </div>
</div><!-- report popup -->

<div class="popup-wraper10">
    <div class="popup">
        <span class="upAvt-closed"><i class="ti-close"></i></span>
        <div class="popup-meta">
            <div class="popup-head">
                <h5>Cập nhật ảnh đại diện</h5>
            </div>
            <div class="Rpt-meta">
                <form action="addAvatar" method="post" class="c-form" enctype="multipart/form-data">
                    <div class="profile-author-thumb">
                        <c:if test="${myInfor != null}">
                            <c:if test="${myInfor.avatar != 'Null'}">
                                <img id="avtdemo" alt="avatar" src="userPhoto/${myInfor.userId}/avatar/${myInfor.avatar}">
                            </c:if>
                            <c:if test="${myInfor.avatar == 'Null'}">
                                <img id="avtdemo" alt="avatar" src="images/avatardefault.png">
                            </c:if> 
                        </c:if>
                        <c:if test="${myInfor == null}">
                            <c:if test="${GInfor.avatar != 'Null'}">
                                <img id="avtdemo" alt="avatar" src="userPhoto/${GInfor.userId}/avatar/${GInfor.avatar}">
                            </c:if>
                            <c:if test="${Ginfor.avatar == 'Null'}">
                                <img id="avtdemo" alt="avatar" src="images/avatardefault.png">
                            </c:if> 
                        </c:if>

                        <style>
                            #avt{
                                min-width: 155px;
                                min-height: 155px;
                                max-width: 155px;
                                max-height: 155px;
                                padding: 5px 5px;

                            }
                            #avtdemo{
                                min-width: 200px;
                                min-height: 200px;
                                margin-left: 180px;
                                margin-top: 15px;
                                padding: 5px 5px;
                                border: solid 4px whitesmoke;
                            }
                        </style>
                        <div class="edit-dp">
                            <label class="fileContainer" id="saveImg">
                                <i class="fa fa-camera"></i>
                                <input id="avttt" type="file" name="avatar" onchange="readURL(this)"/>
                            </label>               
                        </div>
                    </div>
                    <div>                          
                        <button name="changeAvt" style="margin-top: 10px;" data-ripple="" class="main-btn3">Thay đổi ảnh đại diện</button>
                        <button name="cacel" style="margin-top: 10px;" data-ripple="" type="submit" class="main-btn3 upAvt-closed">Hủy</button>
                    </div>
                </form>	
            </div>
        </div>	
    </div>
</div>
<div class="popup-wraper11">
    <div class="popup">
        <span class="upBgr-closed"><i class="ti-close"></i></span>
        <div class="popup-meta">
            <div class="popup-head">
                <h5>Cập nhật ảnh nền</h5>
            </div>
            <div class="Rpt-meta">
                <form action="addBackground" method="post" class="c-form" enctype="multipart/form-data">
                    <div class="user-profile">
                        <figure>
                            <div class="edit-pp">
                                <style>
                                    #upBGRR{
                                        margin-top: 0px;
                                        color: white;
                                    }
                                </style>
                                <label class="fileContainer" id="upBGRR">
                                    <i class="fa fa-camera"></i>
                                    <input type="file" name="background" onchange="readURLBGR(this)"/>
                                </label>
                            </div>
                            <c:if test="${myInfor != null}">
                                <c:if test="${myInfor.background != 'Null'}">
                                    <img id="bgrDemo" alt="author" src="userPhoto/${myInfor.userId}/background/${myInfor.background}">
                                </c:if>
                                <c:if test="${myInfor.background == 'Null'}">
                                    <img id="bgrDemo" src="images/resources/profile-image.jpg" alt="">
                                </c:if> 
                            </c:if>
                            <c:if test="${myInfor == null}">
                                <c:if test="${GInfor.background != 'Null'}">
                                    <img id="bgrDemo" alt="author" src="userPhoto/${GInfor.userId}/background/${GInfor.background}">
                                </c:if>
                                <c:if test="${GInfor.background == 'Null'}">
                                    <img id="bgrDemo" src="images/resources/profile-image.jpg" alt="">
                                </c:if> 
                            </c:if>
                        </figure>
                    </div>
                    <div>                          
                        <button name="changeAvt" style="margin-top: 10px;" data-ripple="" class="main-btn3">Thay đổi ảnh đại diện</button>
                        <button name="cacel" style="margin-top: 10px;" data-ripple="" type="submit" class="main-btn3 upBgr-closed">Hủy</button>
                    </div>
                </form>	
            </div>
        </div>	
    </div>
</div>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                //$('#avt').attr('src', e.target.result).width(155).height(155);
                $('#avtdemo').attr('src', e.target.result).width(155).height(155);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    function readURLBGR(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                //$('#avt').attr('src', e.target.result).width(155).height(155);
                $('#bgrDemo').attr('src', e.target.result).width(600).height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>