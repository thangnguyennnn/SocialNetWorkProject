<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="fixed-sidebar right">
    <div class="chat-friendz">
        <ul class="chat-users">
            <c:forEach items="${sessionScope.friends}" var="f">
                <li title="${f.fullname}" onclick="showBox2('${f.fullname}','${f.friendId}');loadMessage2('${f.friendId}'); getBox();">
                    <div class="author-thmb">
                        <c:if test="${f.avatar != null}">
                            <img class="fiximg" src="userPhoto/${f.friendId}/avatar/${f.avatar}" alt="">
                        </c:if>
                        <c:if test="${f.avatar == null}">
                            <img class="fiximg" src="images/avatardefault.png" alt="">
                        </c:if>
                        <c:if test="${f.active == 1}">
                            <span class="status f-online"></span>
                        </c:if>
                        <c:if test="${f.active == 2}">
                            <span class="status f-offline"></span>
                        </c:if>

                    </div>
                </li>

            </c:forEach>
        </ul>
        <div hidden id="currentID"></div>
        <script>

            function showBox2(fName,uID) {

                $.ajax({
                    url: 'testServlet',
                    type: 'post',
                    data: {
                        id: fName
                    },
                    success: function (data) {
                        var mess = document.getElementById('chatHeader');
                        mess.innerHTML = data;
                        document.getElementById('currentID').innerHTML = uID;
                    }
                });
            }

            function loadMessage2(uID) {
                $.ajax({
                    url: 'loadMessage2',
                    type: 'post',
                    data: {
                        id: uID
                    },
                    success: function (data) {
                        var mess = document.getElementById('listChatt');
                        mess.innerHTML = data;
                    }
                });
            }
            function sendMessAllPage(content) {
                var c = document.getElementById('currentID').innerHTML;
                $.ajax({
                    url: "sendMessAllPage",
                    type: "post",
                    data: {
                        id: c,
                        content: content
                    },
                    success: function (data) {
                        var listSearch = document.getElementById('listChatt');
                        listSearch.innerHTML = data;
                    }
                });
            }
            function getBox() {
                setInterval(
                        function () {
                            var c = document.getElementById('currentID').innerHTML;
                            $.ajax({
                                url: "loadMessRealtime2",
                                type: "post",
                                data: {
                                    id: c
                                },
                                success: function (data) {
                                    var listSearch = document.getElementById('listChatt');
                                    listSearch.innerHTML = data;
                                }
                            });
                        }, 2000);
            }


        </script>

        <div class="chat-box" style="bottom: -455px;min-height: 420px;top: 262px">
            <div class="chat-head">
                <span class="status f-online"></span>
                <h6 id="chatHeader">Nhắn tin</h6>
                <div class="more">
                    <div class="more-optns"><i class="ti-more-alt"></i>
                        <ul>
                            <li>chặn</li>
                            <li>bỏ chặn</li>
                            <li>xem trong tin nhắn</li>
                        </ul>
                    </div>
                    <span class="close-mesage"><i class="ti-close"></i></span>
                </div>
            </div>
            <style>
                .myInput{
                    width: 100%;
                    height: 40px;
                    margin-bottom: 10px;
                    border-radius: 11px;
                    padding-left: 15px;
                }
            </style>
            <div class="chat-list">
                <form class="text-box" onsubmit="return false;">
                    <input oninput="validate1(this)" autocomplete="off" class="myInput" id="messsage" onkeydown="if (event.keyCode == 13) {
                                var content = document.getElementById('messsage').value;
                                sendMessAllPage(content);
                                //console.log(content);
                                document.getElementById('messsage').value = '';
                                return false;
                            }" placeholder="Enter để gửi...">
                    <button type="submit">Gửi</button>
                </form>
                <ul id="listChatt">
                </ul>

            </div>
        </div>
    </div>
</div>
<script>

</script>