<%-- 
    Document   : chat
    Created on : Feb 17, 2022, 3:57:49 PM
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
        <title>Nhắn tin</title>
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
                <section>
                    <div class="gap2 no-gap gray-bg">
                        <div class="container-fluid no-padding">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="message-users" style="height: 100%">
                                        <div class="message-head">
                                            <h4>Nhắn tin</h4>
                                            <div class="more">
                                                <div class="more-post-optns"><i class="ti-settings"></i>
                                                    <ul>
                                                        <li><i class="fa fa-wrench"></i>Cài đặt</li>
                                                        <li><i class="fa fa-envelope-open"></i>Active Contacts</li>
                                                        <li><i class="fa fa-folder-open"></i>Archives Chats</li>
                                                        <li><i class="fa fa-eye-slash"></i>Unread Chats</li>
                                                        <li><i class="fa fa-flag"></i>Report a problem</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="message-people-srch">
                                            <form method="post">
                                                <input oninput="validate1(this)" type="text" placeholder="Tìm bạn bè...">
                                                <button type="submit"><i class="fa fa-search"></i></button>
                                            </form>
                                            <div class="btn-group add-group" role="group">
                                                <button id="btnGroupDrop2" type="button" class="btn group dropdown-toggle user-filter" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Tất cả
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop2">
                                                    <a class="dropdown-item" href="#">Online</a>
                                                    <a class="dropdown-item" href="#">Away</a>
                                                    <a class="dropdown-item" href="#">unread</a>
                                                    <a class="dropdown-item" href="#">archive</a>
                                                </div>
                                            </div>
                                            <div class="btn-group add-group align-right" role="group">
                                                <button id="btnGroupDrop1" type="button" class="btn group dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Gửi tin nhắn mới
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                    <a class="dropdown-item" href="#">Đến người dùng</a>
                                                    <a class="dropdown-item" href="#">Đến nhóm</a>

                                                </div>
                                            </div>
                                        </div>
                                        <style>
                                            .editp {
                                                overflow: hidden;
                                                white-space: nowrap; 
                                                text-overflow: ellipsis;
                                            }
                                        </style>
                                        <div class="mesg-peple">
                                            <ul class="nav nav-tabs nav-tabs--vertical msg-pepl-list" id="listMess10">
                                            <c:forEach items="${listConer}" var="cb">
                                                <c:if test="${cb.c.senderID == AccLogin.userId}">
                                                    <li class="nav-item">
                                                        <a class="" href="#u${cb.u.userId}" onclick="showMessage('${cb.c.converID}', '${cb.u.userId}');" data-toggle="tab">
                                                            <figure><img src="userPhoto/${cb.u.userId}/avatar/${cb.u.avatar}" alt="">
                                                                <span class="status ${cb.c.isActive == '1' ? "f-online":""}"></span>
                                                            </figure>
                                                            <div class="user-name">
                                                                <h6 class="">${cb.u.lastName} ${cb.u.middleName} ${cb.u.firstName}</h6>
                                                                <span class="editp">${cb.c.senderName}: ${cb.c.newMessage}</span>
                                                                <span> ${cb.c.countTime.countTime} ${cb.c.countTime.unit} trước</span>
                                                            </div>
                                                            <div class="more">
                                                                <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                    <ul>
                                                                        <li><i class="fa fa-bell-slash-o"></i>Mute</li>
                                                                        <li><i class="ti-trash"></i>Delete</li>
                                                                        <li><i class="fa fa-folder-open-o"></i>Archive</li>
                                                                        <li><i class="fa fa-ban"></i>Block</li>
                                                                        <li><i class="fa fa-eye-slash"></i>Ignore Message</li>
                                                                        <li><i class="fa fa-envelope"></i>Mark Unread</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${cb.c.senderID != AccLogin.userId}">
                                                    <li class="nav-item ${cb.c.readed == '2' ? "unread":""}">
                                                        <a class="" href="#u${cb.u.userId}" onclick="showMessage('${cb.c.converID}', '${cb.u.userId}');readMessage('${cb.c.converID}');" data-toggle="tab">
                                                            <figure><img src="userPhoto/${cb.u.userId}/avatar/${cb.u.avatar}" alt="">
                                                                <span class="status ${cb.c.isActive == '1' ? "f-online":""}"></span>
                                                            </figure>
                                                            <div class="user-name">
                                                                <h6 class="">${cb.u.lastName} ${cb.u.middleName} ${cb.u.firstName}</h6>
                                                                <span>${cb.c.senderName}: ${cb.c.newMessage}   -  ${cb.c.countTime.countTime} ${cb.c.countTime.unit} trước</span>
                                                            </div>
                                                            <div class="more">
                                                                <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                    <ul>
                                                                        <li><i class="fa fa-bell-slash-o"></i>Mute</li>
                                                                        <li><i class="ti-trash"></i>Delete</li>
                                                                        <li><i class="fa fa-folder-open-o"></i>Archive</li>
                                                                        <li><i class="fa fa-ban"></i>Block</li>
                                                                        <li><i class="fa fa-eye-slash"></i>Ignore Message</li>
                                                                        <li><i class="fa fa-envelope"></i>Mark Unread</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${listFr}" var="f">
                                                <li class="nav-item">
                                                    <a class="" onclick="" href="#u${f.friendId}" data-toggle="tab">
                                                        <figure><img src="userPhoto/${f.friendId}/avatar/${f.avatar}" alt="">
                                                            <span class="status ${f.active == '1' ? "f-online":""}"></span>
                                                        </figure>
                                                        <div class="user-name">
                                                            <h6 class="unread">${f.fullname}</h6>
                                                            <span>Hãy bắt đầu nhắn tin với ${f.fullname}</span>
                                                        </div>
                                                        <div class="more">
                                                            <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                <ul>
                                                                    <li><i class="fa fa-bell-slash-o"></i>Mute</li>
                                                                    <li><i class="ti-trash"></i>Delete</li>
                                                                    <li><i class="fa fa-folder-open-o"></i>Archive</li>
                                                                    <li><i class="fa fa-ban"></i>Block</li>
                                                                    <li><i class="fa fa-eye-slash"></i>Ignore Message</li>
                                                                    <li><i class="fa fa-envelope"></i>Mark Unread</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </c:forEach>      
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-content messenger">
                                    <div class="tab-pane fade active show" id="link1" >
                                        <div class="row merged">
                                            <div class="col-lg-12">
                                                <div class="mesg-area-head">
                                                    <div class="active-user">
                                                        <figure><img src="images/anhDep10d.jpg" alt="">
                                                            <span class="status f-online"></span>
                                                        </figure>
                                                        <div>
                                                            <h6 class="unread">Messenger</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-8">
                                                <div class="mesge-area conversations">
                                                    <div class="empty-chat">
                                                        <div class="no-messages">
                                                            <i class="ti-comments"></i>
                                                            <p>Hãy bắt đầu nhắn tin với mọi người.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4">
                                                <div class="chater-info">
                                                    <figure><img src="images/anhDep10d.jpg" alt=""></figure>
                                                    <h6>Messenger</h6>
                                                    <span>From TT Team</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach items="${listConer}" var="cb">
                                        <div class="tab-pane fade" id="u${cb.u.userId}" >
                                            <div class="row merged">
                                                <div class="col-lg-12">
                                                    <div class="mesg-area-head">
                                                        <div class="active-user">
                                                            <figure><img src="userPhoto/${cb.u.userId}/avatar/${cb.u.avatar}" alt="">
                                                                <span class="status ${cb.c.isActive == '1' ? "f-online":"f-off"}"></span>
                                                            </figure>
                                                            <div>
                                                                <h6 class="unread">${cb.u.lastName} ${cb.u.middleName} ${cb.u.firstName}</h6>
                                                                <span>${cb.c.isActive == '1' ? "online":"offline"}</span>
                                                            </div>
                                                        </div>
                                                        <ul class="live-calls">
                                                            <li class="audio-call"><span class="fa fa-phone"></span></li>
                                                            <li class="video-call"><span class="fa fa-video"></span></li>
                                                            <li class="uzr-info"><span class="fa fa-info-circle"></span></li>
                                                            <li>
                                                                <div class="dropdown">
                                                                    <button class="btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="ti-view-grid"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item audio-call" href="#" ><i class="ti-headphone-alt"></i>Gọi điện</a>
                                                                        <a href="#" class="dropdown-item video-call"><i class="ti-video-camera"></i>Gọi video</a>
                                                                        <hr>
                                                                        <a href="#" class="dropdown-item"><i class="ti-server"></i>Xóa lịch sử</a>
                                                                        <a href="#" class="dropdown-item"><i class="ti-hand-stop"></i>Chặn người dùng</a>
                                                                        <a href="#" class="dropdown-item"><i class="ti-trash"></i>Xóa</a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8">
                                                    <div class="message-writing-box" style="margin-top: 0px">
                                                        <form method="post" onsubmit="return false;">
                                                            <div class="attach-file">
                                                                <label class="fileContainer">
                                                                    <i class="ti-clip"></i>
                                                                    <input type="file">
                                                                </label>
                                                            </div>
                                                            <div class="text-area" style="width: 93%">
                                                                <input oninput="validate1(this)" autocomplete="off" id="message${cb.u.userId}" type="text" placeholder="viết tin nhắn ..." value="">
                                                                <button onclick="sendMessage('${cb.u.userId}');" type="submit"><i class="fa fa-paper-plane-o"></i></button>
                                                            </div>

                                                        </form>
                                                    </div>
                                                    <div class="mesge-area">
                                                        <ul class="conversations" id="Mess${cb.u.userId}">

                                                        </ul>
                                                    </div>
                                                    <script>
                                                        setInterval(
                                                                function () {
                                                                    $.ajax({
                                                                        url: "loadMessRealtime",
                                                                        type: "post",
                                                                        data: {
                                                                            converID: '${cb.c.converID}'
                                                                        },
                                                                        success: function (data) {
                                                                            var listSearch = document.getElementById('Mess${cb.u.userId}');
                                                                            listSearch.innerHTML = data;
                                                                        }
                                                                    });

                                                                }, 1000);
                                                    </script>
                                                </div>
                                                <div class="col-lg-4 col-md-4">
                                                    <div class="chater-info">
                                                        <figure><img src="userPhoto/${cb.u.userId}/avatar/${cb.u.avatar}" alt=""></figure>
                                                        <h6>${cb.u.lastName} ${cb.u.middleName} ${cb.u.firstName}</h6>
                                                        <span>${cb.c.isActive == '1' ? "online":"offline"}</span>
                                                        <div class="userabout">
                                                            <span>About</span>
                                                            <p>${cb.u.orther}.</p>
                                                            <ul>
                                                                <li><span>Điện thoại:</span> ${cb.u.phone}</li>
                                                                <li><span>Website:</span> <a href="#" title="">www.abc.com</a></li>
                                                                <li><span>Email:</span> <a class="__cf_email__" data-cfemail="a0d3c1cdd0ccc5e0c7cdc1c9cc8ec3cfcd">[${cb.u.email}]</a></li>
                                                                <li><span>Địa chỉ:</span> ${cb.u.address}</li>
                                                            </ul>
                                                            <div class="media">
                                                                <span>Media</span>
                                                                <ul>
                                                                    <li><img src="images/resources/audio-user1.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user2.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user3.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user4.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user5.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user6.jpg" alt=""></li>
                                                                    <li><img src="images/resources/admin2.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user1.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user4.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user3.jpg" alt=""></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <c:forEach items="${listFr}" var="f">
                                        <div class="tab-pane fade" id="u${f.friendId}" >
                                            <div class="row merged">
                                                <div class="col-lg-12">
                                                    <div class="mesg-area-head">
                                                        <div class="active-user">
                                                            <figure><img src="images/resources/admin.jpg" alt="">
                                                                <span class="status f-away"></span>
                                                            </figure>
                                                            <div>
                                                                <h6 class="unread">${f.fullname}</h6>
                                                                <span>Online</span>
                                                            </div>
                                                        </div>
                                                        <ul class="live-calls">
                                                            <li><span class="fa fa-phone"></span></li>
                                                            <li><span class="fa fa-video"></span></li>
                                                            <li><span class="fa fa-info-circle"></span></li>
                                                            <li>
                                                                <div class="dropdown">
                                                                    <button class="btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="ti-view-grid"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">

                                                                        <a href="#" class="dropdown-item"><i class="ti-server"></i>Xóa lịch sử</a>
                                                                        <a href="#" class="dropdown-item"><i class="ti-hand-stop"></i>Chặn người dùng</a>
                                                                        <a href="#" class="dropdown-item"><i class="ti-trash"></i>Xóa liên hệ</a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="message-writing-box">
                                                    <form method="post" onsubmit="return false;">
                                                        <div class="attach-file">
                                                            <label class="fileContainer">
                                                                <i class="ti-clip"></i>
                                                                <input type="file">
                                                            </label>
                                                        </div>
                                                        <div class="text-area">
                                                            <input oninput="validate1(this)" autocomplete="off" id="message${f.friendId}" name="message" type="text" placeholder="Viết tin nhắn..." value="">
                                                            <button onclick="sendNewMessage('${f.friendId}')" type="submit"><i class="fa fa-paper-plane-o"></i></button>
                                                        </div>

                                                    </form>
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="mesge-area conversations" id="newContent${f.friendId}">
                                                        <div class="empty-chat">
                                                            <div class="no-messages">
                                                                <i class="ti-comments"></i>
                                                                <p>Hãy gửi lời chào đến ${f.fullname}.</p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="chater-info">
                                                        <figure><img src="images/resources/author.jpg" alt=""></figure>
                                                        <h6>${f.fullname}</h6>
                                                        <span>Active a days ago</span>
                                                        <div class="userabout">
                                                            <span>About</span>
                                                            <p>I love reading, traveling and discovering new things. You need to be happy in life.</p>
                                                            <ul>
                                                                <li><span>Phone:</span> +123976980</li>
                                                                <li><span>Website:</span> <a href="#" title="">www.abc.com</a></li>
                                                                <li><span>Email:</span> <a href="http://wpkixx.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="ee9d8f839e828bae89838f8782c08d8183">[email&#160;protected]</a></li>
                                                                <li><span>Phone:</span> Ontario, Canada</li>
                                                            </ul>
                                                            <div class="media">
                                                                <span>Media</span>
                                                                <ul>
                                                                    <li><img src="images/resources/audio-user1.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user2.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user3.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user4.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user5.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user6.jpg" alt=""></li>
                                                                    <li><img src="images/resources/admin2.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user1.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user4.jpg" alt=""></li>
                                                                    <li><img src="images/resources/audio-user3.jpg" alt=""></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>	
            </section><!-- content --> 

        </div>
        <style>
            .post{
                display: none;
            }
        </style>
        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/main.min.js"></script>
        <script src="js/script.js"></script>
        <script>
                                                                function sendMessage(id) {
                                                                    var message = document.getElementById("message" + id).value;
                                                                    $.ajax({
                                                                        url: 'sendMessage',
                                                                        type: 'post',
                                                                        data: {
                                                                            reciveID: id,
                                                                            message: message
                                                                        },
                                                                        success: function (data) {
                                                                            document.getElementById("message" + id).value = '';
                                                                            var mess = document.getElementById("Mess" + id);
                                                                            mess.innerHTML = data;
                                                                        }
                                                                    });
                                                                }

                                                                function sendNewMessage(id) {
                                                                    var message = document.getElementById("message" + id).value;
                                                                    document.getElementById("newContent" + id).innerHTML = '<ul class="conversations" id="Mess' + id + '"></ul>';
                                                                    document.getElementById("newContent" + id).classList.remove('conversations');
                                                                    $.ajax({
                                                                        url: 'sendNewMessage',
                                                                        type: 'post',
                                                                        data: {
                                                                            reciveID: id,
                                                                            message: message
                                                                        },
                                                                        success: function (data) {
                                                                            document.getElementById("message" + id).value = '';
                                                                            var mess = document.getElementById("Mess" + id);
                                                                            mess.innerHTML = data;
                                                                        }
                                                                    });
                                                                }

                                                                function readMessage(converID) {
                                                                    $.ajax({
                                                                        url: 'readMess',
                                                                        type: 'post',
                                                                        data: {
                                                                            converID: converID,
                                                                        },
                                                                    });
                                                                }
        </script>
        <script>
            function showMessage(param, idd) {

                $.ajax({
                    url: 'loadMessage',
                    type: 'post',
                    data: {
                        converID: param
                    },
                    success: function (data) {
                        var mess = document.getElementById("Mess" + idd);
                        mess.innerHTML = data;
                    }
                });
            }

            setInterval(
                    function () {
                        $.ajax({
                            url: "loadListMess",
                            type: "post",
                            data: {

                            },
                            success: function (data) {
                                var listSearch = document.getElementById('listMess10');
                                listSearch.innerHTML = data;
                            }
                        });

                    }, 2000);
        </script>
    </body>	
</html>