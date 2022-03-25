<%-- 
    Document   : about
    Created on : Feb 17, 2022, 3:55:33 PM
    Author     : PC
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>Thông tin cá nhân</title>
        <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 

        <link rel="stylesheet" href="css/main.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .post{display: none}
        </style>
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
                                                <div class="about">
                                                    <div class="d-flex flex-row mt-2">
                                                        <ul class="nav nav-tabs nav-tabs--vertical nav-tabs--left" >
                                                            <li class="nav-item">
                                                                <a href="#gen-setting" class="nav-link " data-toggle="tab" ><i class="fa fa-gear"></i> Cài đặt chung</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a href="#edit-profile" class="nav-link active" data-toggle="tab" ><i class="fa fa-pencil"></i> Sửa thông tin cá nhân</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a href="#messages" class="nav-link" data-toggle="tab" ><i class="fa fa-comment"></i> Nhắn tin</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a href="#privacy" class="nav-link" data-toggle="tab"  ><i class="fa fa-shield"></i> Privacy & Data</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a href="#security" class="nav-link" data-toggle="tab" ><i class="fa fa-lock"></i> Bảo mật</a>
                                                            </li>
                                                        </ul>
                                                        <div class="tab-content">
                                                            <div class="tab-pane fade " id="gen-setting" >
                                                                <div class="set-title">
                                                                    <h5>Cài đặt chung</h5>
                                                                    <span>Thay đổi các cài đặt tài khoản tại đây.</span>
                                                                </div>
                                                                <div class="onoff-options ">
                                                                    <form method="post">

                                                                        <div class="setting-row">
                                                                            <span>Bật/tắt thông báo</span>
                                                                            <p>Gửi thông báo cho tôi nếu có ai đó thích hoặc bình luận bài viết của tôi.</p>
                                                                            <input type="checkbox" id="switch02" /> 
                                                                            <label for="switch02" data-on-label="ON" data-off-label="OFF"></label>
                                                                        </div>


                                                                        <div class="submit-btns">
                                                                            <button type="button" class="main-btn" data-ripple=""><span>Lưu</span></button>
                                                                            <button type="button" class="main-btn3" data-ripple=""><span>Hủy</span></button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="account-delete">
                                                                    <h5>Thay đổi cho tài khoản</h5>
                                                                    <div>
                                                                        <span>Ẩn bài viết và thông tin cá nhân </span>
                                                                        <button type="button" class=""><span>Ẩn</span></button>
                                                                    </div>	
                                                                    <div>
                                                                        <span>Xóa tất cả về bạn </span>
                                                                        <button type="button" class=""><span>Xóa tài khoản</span></button>
                                                                    </div>
                                                                </div>
                                                            </div><!-- general setting -->
                                                            <div class="tab-pane fade show active" id="edit-profile" >
                                                                <div class="set-title">
                                                                    <h5>Sửa thông tin</h5>
                                                                    <span>Người dùng có thể thấy các thông tin của bạn như sau.</span>
                                                                </div>
                                                                
                                                            <div class="stg-form-area">
                                                                <form action="changeInfo" class="c-form" method="post">
                                                                    <div>
                                                                        <label>Họ và tên</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="lastname" type="text" placeholder="Họ" required value="${myInfor.lastName}">
                                                                        <label></label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="middlename" type="text" placeholder="Tên đệm" value="${myInfor.middleName}">                                                
                                                                        <label></label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="firstname" type="text" placeholder="Tên" required value="${myInfor.firstName}">
                                                                    </div>

                                                                    <div>
                                                                        <label>Địa chỉ email</label>
                                                                        <input oninput="validate1(this)" name="email" type="text" placeholder="abc@gmail.com" value="${myInfor.email}" readonly>
                                                                    </div>
                                                                    <div>
                                                                        <label>Giới tính</label>
                                                                        <div class="form-radio">
                                                                            <div class="radio">
                                                                                <label>
                                                                                    <input  value="Nam" type="radio" ${myInfor.sex == "Nam" ? "checked":""} name="gender"><i class="check-box"></i>Nam
                                                                                </label>
                                                                            </div>
                                                                            <div class="radio">
                                                                                <label>
                                                                                    <input value="Nữ" type="radio" ${myInfor.sex == "Nữ" ? "checked":""} name="gender"><i class="check-box"></i>Nữ
                                                                                </label>
                                                                            </div>
                                                                            <div class="radio">
                                                                                <label>
                                                                                    <input value="Giới tính khác" type="radio" ${myInfor.sex == "Giới tính khác" ? "checked":""} name="gender"><i class="check-box"></i>Giới tính khác
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div>
                                                                        <label>Sinh nhật</label>
                                                                        <input oninput="validate1(this)" name="birthdate" type="date" placeholder="mm/dd/yyyy" value="${myInfor.birthdate}">
                                                                    </div>
                                                                    <div>
                                                                        <label>Địa chỉ</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="address" type="text" placeholder="Vd: Đà Nẵng, Việt Nam" value="${myInfor.address}">
                                                                    </div>
                                                                    <div>
                                                                        <label>Số điện thoại</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="phone" type="number" placeholder="0xxxxxxxxx" value="${myInfor.phone}">
                                                                    </div>
                                                                    <div>
                                                                        <label>Học vấn</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="education" type="text" placeholder="VD: FPT University" value="${myInfor.education}">
                                                                    </div>
                                                                    <div>
                                                                        <label>Nghề Nghiệp</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="job" type="text" placeholder="VD: Kỹ sư, ..." value="${myInfor.job}">
                                                                    </div>
                                                                    <div>
                                                                        <label>Sở thích</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="hobbie" type="text" placeholder="VD:Đọc sách, xem phim,..." value="${myInfor.hobbie}">
                                                                    </div>
                                                                    <div>
                                                                        <label>Giới thiệu khác</label>
                                                                        <textarea name="other" rows="3" placeholder="viết thêm về bạn...">${myInfor.orther}</textarea>
                                                                    </div>
                                                                    <div>
                                                                        <label>Facebook cá nhân</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="fblink" type="text" placeholder="" value="${myInfor.fbLink}">
                                                                    </div>
                                                                    <div>
                                                                        <label>Instagram Link</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="iglink" type="text" placeholder="" value="${myInfor.igLink}">
                                                                    </div>
                                                                    <div>
                                                                        <label>Twitter Link</label>
                                                                        <input oninput="validate1(this)" autocomplete="off" name="twitterlink" type="text" placeholder="" value="${myInfor.tweetLink}">
                                                                    </div>
                                                                    <div id="acceptChange">
                                                                                                                 
                                                                    </div>
                                                                    <div>
                                                                        <a class="main-btn2 accept-change" type="submit" data-ripple="">Xác nhận thay đổi</a>                                         
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div><!-- edit profile -->
                                                        <div class="tab-pane fade" id="messages" role="tabpanel">
                                                            <div class="set-title">
                                                                <h5>Messages Setting</h5>
                                                                <span>Set your login preference, help us personalize your experience and make big account change here.</span>
                                                                <div class="mesg-seting">

                                                                    <div class="set-title">
                                                                        <h6>i'd like to receive emails and updates from Pitnik about</h6>
                                                                    </div>	
                                                                    <div class="checkbox">
                                                                        <label>
                                                                            <input type="checkbox" checked="checked"><i class="check-box"></i>
                                                                            Always General announcement, updates, posts, and videos. 
                                                                        </label>
                                                                        <label>
                                                                            <input type="checkbox" checked="checked"><i class="check-box"></i>
                                                                            Personalise tips for my page. 
                                                                        </label>
                                                                        <label>
                                                                            <input type="checkbox" checked="checked"><i class="check-box"></i>
                                                                            Announcements and recommendations. 
                                                                        </label>
                                                                        <p><a href="#" title="">learn more</a> about emails from pitnik</p>
                                                                    </div>
                                                                    <div class="set-title">
                                                                        <h6>Other Messages</h6>
                                                                    </div>	
                                                                    <div class="checkbox">
                                                                        <label>
                                                                            <input type="checkbox" checked="checked"><i class="check-box"></i>
                                                                            From Recommended videos. 
                                                                        </label>
                                                                        <label>
                                                                            <input type="checkbox" checked="checked"><i class="check-box"></i>
                                                                            Messages from activity on my page or channel. 
                                                                        </label>
                                                                        <label>
                                                                            <input type="checkbox" checked="checked"><i class="check-box"></i>
                                                                            Message me the replyer Activity on my comments. 
                                                                        </label>
                                                                        <label>
                                                                            <input type="checkbox" checked="checked"><i class="check-box"></i>
                                                                            Reply to comments. 
                                                                        </label>
                                                                        <label>
                                                                            <input type="checkbox" checked="checked"><i class="check-box"></i>
                                                                            Mentions. 
                                                                        </label>

                                                                    </div>
                                                                    <div class="set-title">
                                                                        <h6>Language Preference</h6>
                                                                        <span>Select your Messages language</span>
                                                                    </div>
                                                                    <select class="select">
                                                                        <option value="">Eglish US</option>
                                                                        <option value="">Eglish UK</option>
                                                                        <option value="">Russia</option>
                                                                    </select>
                                                                    <p>
                                                                        you will always get notifications you have turned on for individual <a href="#" title="">Manage All Subscriptions</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div><!-- messages -->
                                                        <div class="tab-pane fade" id="privacy" role="tabpanel">
                                                            <div class="set-title">
                                                                <h5>Privacy & data</h5>
                                                                <span>Deceide whether your profile will be hidden from search engine and what kind of data you want to use to imporve the recommendation and ads you see <a href="#" title="">Learn more</a></span>
                                                            </div>
                                                            <div class="onoff-options ">
                                                                <form method="post">
                                                                    <div class="setting-row">
                                                                        <span>Search Privacy</span>
                                                                        <p>Hide your profile from search engine (Ex.google) <a href="#" title="">Learn more</a>
                                                                        </p>
                                                                        <input type="checkbox" id="switch0001" /> 
                                                                        <label for="switch0001" data-on-label="ON" data-off-label="OFF"></label>
                                                                    </div>
                                                                    <div class="set-title">
                                                                        <h5>Personalization</h5>
                                                                    </div>	
                                                                    <div class="setting-row">
                                                                        <span>Search Privacy</span>
                                                                        <p>use sites you visit to improve which recommendation and ads you see. <a href="#" title="">Learn more</a>
                                                                        </p>
                                                                        <input type="checkbox" id="switch0002" /> 
                                                                        <label for="switch0002" data-on-label="ON" data-off-label="OFF"></label>
                                                                    </div>
                                                                    <div class="setting-row">
                                                                        <span>Search Privacy</span>
                                                                        <p>use information from our partners to improve which ads you see<a href="#" title="">Learn more</a>
                                                                        </p>
                                                                        <input type="checkbox" id="switch0003" /> 
                                                                        <label for="switch0003" data-on-label="ON" data-off-label="OFF"></label>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div><!-- privacy -->
                                                        <div class="tab-pane fade" id="security" role="tabpanel">
                                                            <div class="set-title">
                                                                <h5>Security Setting</h5>
                                                                <span>trun on two factor authentication and check your list of connected device to keep your account posts safe <a href="#" title="">Learn More</a>.</span>
                                                            </div>
                                                            <div class="seting-box">
                                                                <p>to turn on two-factor authentication, you must <a href="#" title=""> confirm Your Email </a> and <a href="#" title="">Set Password</a></p>
                                                                <div class="set-title">
                                                                    <h5>Connected Devicese</h5>
                                                                </div>
                                                                <p>This is a list of devices that have logged into your account, Revok any session that you do not recognize. <a href="#" title="">Hide Sessions</a></p>
                                                                <span>Last Accessed</span>
                                                                <p>August 30, 2020 12:25AM</p>
                                                                <span>Location</span>
                                                                <p>Berlin, Germany (based on IP = 103.233.24.5)</p>
                                                                <span>Device Type</span>
                                                                <p>Chrome on windows 10</p>
                                                            </div>
                                                        </div><!-- security -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>	
                                    </div><!-- centerl meta -->
                                </div>	
                            </div>
                        </div>
                    </div>
                </div>	
            </section>
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
                            <input oninput="validate1(this)" type="text" placeholder="Sophia">
                            <textarea placeholder="Write Message"></textarea>
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

        <div class="popup-wraper3">
            <div class="popup">
                <span class="popup-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        <h5>Report Post</h5>
                    </div>
                    <div class="Rpt-meta">
                        <span>We're sorry something's wrong. How can we help?</span>
                        <form action="load" method="post" class="c-form">
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
                            </div>
                        </form>	
                    </div>
                </div>	
            </div>
        </div><!-- report popup -->
        <div class="popup-wraper9">
            <div class="popup">
                <span class="acceptChange-closed"><i class="ti-close"></i></span>
                <div class="popup-meta">
                    <div class="popup-head">
                        <h5>Xác nhận thay đổi</h5>
                    </div>
                    <div class="Rpt-meta">
                        <span>Thông tin của bạn sẽ được cập sau khi hoàn thành việc xác thực mật khẩu</span>
                        <form method="post" class="c-form" onsubmit="return false">
                            <div>
                                <label>Nhập mật khẩu của bạn</label>
                                <input oninput="validate1(this)" id="password" value="" name="password" type="password" placeholder="Mật khẩu">
                            </div>
                            <br>
                            <div>
                                <button onclick="validateUser()" data-ripple="" type="submit" class="main-btn acceptChange-closed">Xác nhận thay đổi</button>
                            </div>
                        </form>	
                    </div>
                </div>	
            </div>
        </div>
        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/main.min.js"></script>
        <script src="js/script.js"></script>
        <script>
                function validateUser() {
                    var password = document.getElementById("password").value;
                    $.ajax({
                        url: "acceptChangeInfo",
                        type: "post",
                        data: {
                            password : password
                        },
                        success: function (data) {
                            var liStatus = document.getElementById("acceptChange");
                            liStatus.innerHTML = data;
                        },
                        error: function (xhr) {

                        }
                    });
            }
        </script>
    </body>

</html>