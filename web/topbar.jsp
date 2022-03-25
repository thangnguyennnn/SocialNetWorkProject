<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="responsive-header">
    <div class="mh-head first Sticky">
        <span class="mh-text">
            <a href="loadHomePage" title=""><img src="images/logo2.png" alt=""></a>
        </span>
    </div>
    <div class="mh-head second">
        <form class="mh-form">
            <input autocomplete="off" placeholder="search" />
            <a href="#/" class="fa fa-search"></a>
        </form>
    </div>
</div><!-- responsive header -->
<div class="topbar stick" style="padding-right: 50px">
    <div class="logo">
        <a title="" href="loadHomePage"><img src="images/logo.png" alt=""></a>
    </div>
    <div class="top-area">
        <style>
            .m20Left{
                padding-left: 50px !important;
            }
            .fixImg2{
                min-height: 30px;
                max-height: 30px;
                min-width: 30px;
                max-width: 30px;
            }

            #boxSearch{
                width: 300px;
                border-radius: 10px;
            }
        </style>
        <div class="top-search">
            <form method="post" class="">
                <script>
                    function showBoxSearch(param) {
                        let el = document.getElementById('boxSearch');
                        var txtSearch = param.value;
                        if (txtSearch === '')
                            el.classList.remove('active');
                        else
                            el.classList.add('active');
                    }

                    function searchUser(param) {
                        var txtSearch = param.value;
                        $.ajax({
                            url: "searchUser",
                            type: "post",
                            data: {
                                txtSearch: txtSearch
                            },
                            success: function (data) {
                                var listSearch = document.getElementById("listSearch");
                                listSearch.innerHTML = data;
                            }
                        });
                    }
                </script>
                <input autocomplete="off" oninput="validate1(this,'txtSearch');showBoxSearch(this);searchUser(this);" id="txtSearch" type="text" placeholder="Tìm kiếm ..." >
                <button data-ripple><i class="ti-search"></i></button>
                <div id="boxSearch" class="dropdowns">
                    <ul id="listSearch" class="drops-menu">

                    </ul>
                    <a href="notifications.html" title="" class="more-mesg">Xem tất cả</a>
                </div>
            </form>
        </div>
        <ul class="setting-area">
            <a style="font-size: 35px;" href="loadHomePage" title="Home" data-ripple=""><i class="fa fa-home"></i></a>
            <a class="m20Left" style="margin-left: 0px; margin-right: 30px" href="loadDatingPage?userID=${AccLogin.userId}" title="Dating" data-ripple=""><i class="fa fa-heart"></i></a>
            <li class="m20Left">
                <a href="#" title="Yêu cầu kết bạn" data-ripple="">
                    <i class="fa fa-user"></i>
                    <em id="numRequest" class="bg-red">${sessionScope.numOfRequest}</em>
                </a>
                <div class="dropdowns">
                    <span id="numRQ">${sessionScope.numOfRequest} yêu cầu mới</span>
                    <ul id="listRequest" class="drops-menu">
                        <c:forEach items="${sessionScope.listRequest}" var="f">
                            <li>
                                <div>
                                    <figure>
                                        <img style="height: 40px" src="userPhoto/${f.friendId}/avatar/${f.avatar}" alt="">
                                    </figure>
                                    <div class="mesg-meta">
                                        <h6><a href="getUserInfor?userID=${f.friendId}" title="">${f.fullname}</a></h6>
                                        <span id="spanNo${f.friendId}"><b>0</b> bạn chung</span>

                                    </div>
                                    <div class="add-del-friends">
                                        <a style="cursor: pointer" onclick="acceptF('${f.friendId}')" title="Xác nhận"><i class="fa fa-user-plus"></i></a>
                                        <a style="cursor: pointer" onclick="deleteF('${f.friendId}')" title="Xóa"><i class="fa fa-trash"></i></a>
                                    </div>
                                </div>	
                            </li>
                        </c:forEach>
                        <script>
                            function acceptF(id) {
                                $.ajax({
                                    url: 'acceptF',
                                    type: 'post',
                                    data: {
                                        id: id
                                    },
                                    success: function (data) {
                                        document.getElementById('spanNo' + id).innerHTML = data;
                                    }
                                });
                            }
                            function deleteF(id) {
                                $.ajax({
                                    url: 'deleteF',
                                    type: 'post',
                                    data: {
                                        id: id
                                    },
                                    success: function (data) {
                                        document.getElementById('spanNo' + id).innerHTML = data;
                                    }
                                });
                            }

                        </script>
                    </ul>
                    <a href="friend-requests.html" title="" class="more-mesg">Xem tất cả</a>
                </div>
            </li>
            <li class="m20Left">
                <a href="#" title="Tin nhắn" data-ripple=""><i class="fa fa-commenting"></i><em id="numMess" class="bg-blue">${sizeMess}</em></a>
                <div class="dropdowns">
                    <span>${sizeMess} Tin nhắn chưa đọc</span>
                    <style>
                        .imgst{
                            min-height: 40px;
                            min-width: 40px;
                            max-height: 40px;
                            max-width: 40px;
                        }
                    </style>
                    <ul class="drops-menu" id="listMess">
                        <c:forEach items="${listConer}" var="cb">
                            <c:if test="${cb.c.senderID == AccLogin.userId}">
                                <li>
                                    <a class="show-mesg" href="#" title="" onclick="showBox2('${cb.u.lastName} ${cb.u.middleName} ${cb.u.firstName}');
                                            loadMessage2('${cb.u.userId}')">
                                        <figure>
                                            <img class="imgst" src="userPhoto/${cb.u.userId}/avatar/${cb.u.avatar}" alt="">
                                            <span class="status ${cb.c.isActive == '1' ? "f-online":""}"></span>
                                        </figure>
                                        <div class="mesg-meta">
                                            <h6>${cb.u.lastName} ${cb.u.middleName} ${cb.u.firstName}</h6>
                                            <span><i></i>${cb.c.senderName}: ${cb.c.newMessage}</span>
                                            <i>${cb.c.countTime.countTime} ${cb.c.countTime.unit} trước</i>
                                        </div>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${cb.c.senderID != AccLogin.userId}">
                                <li>
                                    <a class="show-mesg" href="#" title="" onclick="showBox2('${cb.u.lastName} ${cb.u.middleName} ${cb.u.firstName}');loadMessage2('${cb.u.userId}')">
                                        <figure>
                                            <img class="imgst" src="userPhoto/${cb.u.userId}/avatar/${cb.u.avatar}" alt="">
                                            <span class="status ${cb.c.isActive == '1' ? "f-online":""}"></span>
                                        </figure>
                                        <div class="mesg-meta">
                                            <h6>${cb.u.lastName} ${cb.u.middleName} ${cb.u.firstName}</h6>
                                            <span style="color: ${cb.c.readed == '2' ? "red":""}"><i class="${cb.c.readed == '2' ? "":"ti-check"}"></i>${cb.c.senderName}: ${cb.c.newMessage}</span>
                                            <i>2 min ago</i>
                                        </div>
                                    </a>
                                </li>
                            </c:if>

                        </c:forEach>

                    </ul>
                    <a href="loadChatPage?idU=${AccLogin.userId}" title="" class="more-mesg">Xem tất cả</a>
                </div>
            </li>
            <li class="m20Left">
                <a href="#" title="Thông báo" data-ripple="">
                    <i class="fa fa-bell"></i>
                    <em id="numNoti" class="bg-purple">${sessionScope.notiNum}</em>
                </a>
                <div class="dropdowns">
                    <span>${sessionScope.notiNum} Thông báo mới</span>
                    <ul id="notiDating" class="drops-menu">
                        <c:forEach items="${sessionScope.noti}" var="o">
                            <li onclick="readNoti(${o.notiID})">
                                <a href="${o.link}" title="">
                                    <figure>
                                        <c:if test="${o.avatar != '' && o.avatar != null}">
                                            <img class="fiximg" src="userPhoto/${o.delivererID}/avatar/${o.avatar}" alt="">
                                        </c:if>
                                        <c:if test="${o.avatar == '' || o.avatar == null}">
                                            <img class="fiximg" src="images/avatardefault.png">
                                        </c:if>
                                        <span class="status f-online"></span>
                                    </figure>
                                    <div class="mesg-meta">
                                        <h6>${o.name}</h6>
                                        <c:if test="${o.status == '1'}">
                                            <span style="max-width: 100%; color: #fa6342;">${o.message}</span>
                                            <span><i style="color: #fa6342; font-size: 13px;" class="${o.icon}"></i> </span>
                                        </c:if>
                                        <c:if test="${o.status == '0'}">
                                            <span style="max-width: 100%;">${o.message}</span>
                                            <span><i style="color: #7580a2; font-size: 13px;" class="${o.icon}"></i> </span>
                                        </c:if>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                    <a href="loadNotificationPage" title="" class="more-mesg">Xem tất cả</a>
                </div>
            </li>
            <c:if test="${AccLogin.role == '1'}">
                <script>
                    setInterval(
                            function () {
                                $.ajax({
                                    url: "loadRealRPNoti",
                                    type: "post",
                                    data: {

                                    },
                                    success: function (data) {
                                        var listSearch = document.getElementById('notiRP');
                                        listSearch.innerHTML = data;
                                    }
                                });

                            }, 3000);
                    setInterval(
                            function () {
                                $.ajax({
                                    url: "loadRealtimeNumRPNoti",
                                    type: "post",
                                    data: {

                                    },
                                    success: function (data) {
                                        var listSearch = document.getElementById('numRPNoti');
                                        listSearch.innerHTML = data;
                                    }
                                });

                            }, 3000);
                </script>
                <li class="m20Left">
                    <a href="#" title="Báo cáo" data-ripple="">
                        <i class="fa fa-flag"></i>
                        <em id="numRPNoti" style="background-color: #34ce57;">${sessionScope.reportNum}</em>
                    </a>
                    <div class="dropdowns">
                        <span>${sessionScope.reportNum} báo cáo mới</span>
                        <ul id="notiRP" class="drops-menu">
                            <c:forEach items="${sessionScope.report}" var="o">
                                <li>
                                    <a onclick="readReport('${o.reportID}')" href="${o.link}" title="">
                                        <figure>
                                            <c:if test="${o.avatar != '' && o.avatar != null}">
                                                <img class="fiximg" src="userPhoto/${o.accuser}/avatar/${o.avatar}" alt="">
                                            </c:if>
                                            <c:if test="${o.avatar == '' || o.avatar == null}">
                                                <img class="fiximg" src="images/avatardefault.png">
                                            </c:if>
                                            <span class="status f-online"></span>
                                        </figure>
                                        <div class="mesg-meta">
                                            <h6>${o.accuserName}</h6>
                                            <c:if test="${o.status == '1'}">
                                                <span style="max-width: 100%; color: #fa6342;">${o.message}</span><br>
                                                <span><i style="color: #fa6342; font-size: 13px;" class="fa fa-flag"></i> ${o.date}</span>
                                            </c:if>
                                            <c:if test="${o.status == '0'}">
                                                <span style="max-width: 100%;">${o.message}</span><br>
                                                <span><i style="color: #7580a2; font-size: 13px;" class="fa fa-flag"></i> ${o.date}</span>
                                            </c:if>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <a href="loadReportPage" title="" class="more-mesg">Xem tất cả</a>
                    </div>
                </li>
            </c:if>
        </ul>
        <script>
            function readNoti(id) {
                $.ajax({
                    url: 'readNoti',
                    type: 'post',
                    data: {id: id}
                });
            }
            function readReport(id) {
                $.ajax({
                    url: 'readReport',
                    type: 'post',
                    data: {id: id}
                });
            }
        </script>
        <div class="user-img">
            <h5>${sessionScope.userInfor.lastName} ${sessionScope.userInfor.middleName} ${sessionScope.userInfor.firstName}</h5>
            <style>
                .fiximg{
                    min-width: 40px;
                    min-height: 40px;
                    max-width: 40px;
                    max-height: 40px;
                    padding: 2px 2px;
                }
            </style>
            <c:if test="${avt != 'Null'}">
                <img class="fiximg" src="userPhoto/${sessionScope.AccLogin.userId}/avatar/${avt}" alt="Ảnh đại diện">
            </c:if>
            <c:if test="${avt == 'Null'}">
                <img class="fiximg" src="images/avatardefault.png" alt="">
            </c:if>  
            <span class="status f-online"></span>
            <div class="user-setting">

                <ul class="chat-setting">
                    <li><a href="#" title=""><span class="status f-online"></span>online</a></li>
                    <li><a href="#" title=""><span class="status f-away"></span>away</a></li>
                    <li><a href="#" title=""><span class="status f-off"></span>offline</a></li>
                </ul>

                <ul class="log-out">
                    <li><a href="getUserInfor?userID=${AccLogin.userId}" title=""><i class="ti-user"></i> Xem trang cá nhân</a></li>
                    <li><a href="loadUserAbout?userID=${AccLogin.userId}" title=""><i class="ti-user"></i> Xem thông tin</a></li>
                    <li><a href="loadManagerUserInforPage" title=""><i class="ti-pencil-alt"></i> Sửa thông tin</a></li>
                    <li><a href="setting.html" title=""><i class="ti-settings"></i> Cài đặt TK</a></li>
                    <li><a href="logoutController" title=""><i class="ti-power-off"></i> Đăng xuất</a></li>
                </ul>
            </div>
        </div>

    </div>
</div><!-- topbar -->
<script>
    setInterval(
            function () {
                $.ajax({
                    url: "loadNumMess",
                    type: "post",
                    data: {

                    },
                    success: function (data) {
                        var listSearch = document.getElementById('numMess');
                        listSearch.innerHTML = data;
                    }
                });

            }, 3000);
    setInterval(
            function () {
                $.ajax({
                    url: "loadMess",
                    type: "post",
                    data: {

                    },
                    success: function (data) {
                        var listSearch = document.getElementById('listMess');
                        listSearch.innerHTML = data;
                    }
                });

            }, 3000);
    setInterval(
            function () {
                $.ajax({
                    url: "loadNumRequest",
                    type: "post",
                    data: {

                    },
                    success: function (data) {
                        var listSearch = document.getElementById('numRequest');
                        document.getElementById('numRQ').innerHTML = data + ' yêu cầu mới';
                        listSearch.innerHTML = data;
                    }
                });

            }, 3000);
    setInterval(
            function () {
                $.ajax({
                    url: "loadRequest",
                    type: "post",
                    data: {

                    },
                    success: function (data) {
                        var listSearch = document.getElementById('listRequest');
                        listSearch.innerHTML = data;
                    }
                });

            }, 3000);
    setInterval(
            function () {
                $.ajax({
                    url: "loadRealtimeNoti",
                    type: "post",
                    data: {

                    },
                    success: function (data) {
                        var listSearch = document.getElementById('notiDating');
                        listSearch.innerHTML = data;
                    }
                });

            }, 3000);
    setInterval(
            function () {
                $.ajax({
                    url: "loadRealtimeNumNoti",
                    type: "post",
                    data: {

                    },
                    success: function (data) {
                        var listSearch = document.getElementById('numNoti');
                        listSearch.innerHTML = data;
                    }
                });

            }, 3000);

</script>
