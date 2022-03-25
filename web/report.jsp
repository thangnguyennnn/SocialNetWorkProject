<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>Report</title>
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
                                        <div class="col-lg-1"></div>
                                        <div class="col-lg-10">
                                            <div class="load-more">
                                                <div class="central-meta">
                                                    <div class="editing-interest">
                                                        <span class="create-post">
                                                            <i class="ti-bell"></i> Tất cả báo cáo
                                                            <a onclick="updateReportStatus('3')" style="font-size: 14px; cursor: pointer;" title="">Đánh dấu đọc tất cả</a>
                                                        </span>
                                                        <div class="notification-box">
                                                            <ul id="report">
                                                            <c:forEach items="${listR}" var="o">
                                                                <li>
                                                                    <a onclick="readReport('${o.reportID}')" href="${o.link}" title="">
                                                                        <figure>
                                                                            <c:if test="${o.avatar != '' && o.avatar != null}">
                                                                                <img class="fiximg" src="userPhoto/${o.accuser}/avatar/${o.avatar}" alt="">
                                                                            </c:if>
                                                                            <c:if test="${o.avatar == '' || o.avatar == null}">
                                                                                <img class="fiximg" src="images/avatardefault.png">
                                                                            </c:if>
                                                                        </figure>
                                                                        <div class="notifi-meta">
                                                                            <c:if test="${o.status == '0'}">
                                                                                <p>${o.message} --- Lý do: ${o.reason}</p>
                                                                            </c:if>
                                                                            <c:if test="${o.status == '1'}">
                                                                                <p style="color: #fa6342;">${o.message}</p>
                                                                            </c:if>
                                                                            <span><i class="fa fa-flag"></i> ${o.date}</span>
                                                                        </div>
                                                                    </a>
                                                                    <div class="more">
                                                                        <div class="more-post-optns"><i class="ti-more-alt"></i>
                                                                            <ul>
                                                                                <li onclick="taskReport('${o.reportID}', '1')"><i class="fa fa-bell-o"></i>Đánh dấu là chưa đọc</li>
                                                                                <li onclick="taskReport('${o.reportID}', '2')"><i class="fa fa-trash-o"></i>Gỡ báo cáo này</li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>	
                                    </div><!-- centerl meta -->
                                    <div class="col-lg-1"></div>
                                </div>	
                            </div>
                        </div>
                    </div>
                </div>	
            </section>
        </div>

        <script src="js/main.min.js"></script>
        <script src="js/script.js"></script>
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
                                                                                    function taskReport(param1, param2) {
                                                                                        var reportID = param1;
                                                                                        var indeX = param2;
                                                                                        $.ajax({
                                                                                            url: "taskWithReport",
                                                                                            type: "post",
                                                                                            data: {
                                                                                                reportid: reportID,
                                                                                                index: indeX
                                                                                            },
                                                                                            success: function (data) {
                                                                                                var liStatus = document.getElementById("report");
                                                                                                liStatus.innerHTML = data;
                                                                                            },
                                                                                            error: function (xhr) {

                                                                                            }
                                                                                        });
                                                                                    }
                                                                                    function updateReportStatus(param) {
                                                                                        var indeX = param;
                                                                                        $.ajax({
                                                                                            url: "taskWithReport",
                                                                                            type: "post",
                                                                                            data: {
                                                                                                index: indeX
                                                                                            },
                                                                                            success: function (data) {
                                                                                                var liStatus = document.getElementById("report");
                                                                                                liStatus.innerHTML = data;
                                                                                            },
                                                                                            error: function (xhr) {

                                                                                            }
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
    </body>	

</html>
