<%-- 
    Document   : about
    Created on : Feb 17, 2022, 3:55:33 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <jsp:include page="directIMG.jsp"></jsp:include>
        <title>${GInfor.lastName} ${GInfor.middleName} ${GInfor.firstName}</title>
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
                                    <div class="col-lg-4 col-md-4">
                                        <aside class="sidebar">
                                            <div class="central-meta stick-widget">
                                                <span class="create-post">Thông tin cá nhân</span>
                                                <div class="personal-head">
                                                    <span class="f-title"><i class="fa fa-birthday-cake"></i> Sinh nhật:</span>
                                                    <p>
                                                        ${GInfor.birthdate} 
                                                    </p>
                                                    <span class="f-title"><i class="fa fa-phone"></i> Số điện thoại:</span>
                                                    <p>
                                                        ${GInfor.phone}
                                                    </p>
                                                    <span class="f-title"><i class="fa fa-male"></i> Giới tính:</span>
                                                    <p>
                                                        ${GInfor.sex}
                                                    </p>
                                                    <span class="f-title"><i class="fa fa-globe"></i> Địa chỉ:</span>
                                                    <p>
                                                        ${GInfor.address}
                                                    </p>
                                                    
                                                    <span class="f-title"><i class="fa fa-handshake-o"></i> Tham gia vào:</span>
                                                    <p>
                                                        ${GInfor.creatAt}
                                                    </p>

                                                    <span class="f-title"><i class="fa fa-envelope"></i> Email:</span>
                                                    <p>
                                                        ${GInfor.email} 
                                                    </p>

                                                </div>
                                            </div>
                                        </aside>	
                                    </div>	
                                    <div class="col-lg-8 col-md-8">
                                        <div class="central-meta">
                                            <span class="create-post">Thông tin chung</span>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="gen-metabox">
                                                        <span><i class="fa fa-puzzle-piece"></i> Sở thích</span>
                                                        <p>
                                                            ${GInfor.hobbie}
                                                        </p>
                                                    </div>
                                                    <div class="gen-metabox">
                                                        <span><i class="fa fa-plus"></i> Giới thiệu thêm</span>
                                                        <p>
                                                            ${GInfor.orther}
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="gen-metabox">
                                                        <span><i class="fa fa-mortar-board"></i> Học vấn</span>
                                                        <p>
                                                            ${GInfor.education}
                                                        </p>
                                                    </div>
                                                    <div class="gen-metabox">
                                                        <span><i class="fa fa-briefcase"></i> Nghề nghiệp</span>
                                                        <p>
                                                            ${GInfor.job}
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="gen-metabox no-margin">
                                                        <span><i class="fa fa-sitemap"></i> Liên kết tài khoản</span>
                                                        <ul class="sociaz-media">
                                                            <li><a class="facebook" href="${GInfor.fbLink}" title=""><i class="fa fa-facebook"></i></a></li>
                                                            <li><a class="twitter" href="${GInfor.tweetLink}" title=""><i class="fa fa-twitter"></i></a></li>
                                                            <li><a class="google" href="${GInfor.emailLink}" title=""><i class="fa fa-google-plus"></i></a></li>                                              
                                                            <li><a class="instagram" href="${GInfor.igLink}" title=""><i class="fa fa-instagram"></i></a></li>

                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="gen-metabox no-margin">
                                                        <span><i class="fa fa-trophy"></i> Thành tựu</span>
                                                        <ul class="badged">
                                                            <li><img src="images/badges/badge2.png" alt=""></li>
                                                            <li><img src="images/badges/badge19.png" alt=""></li>
                                                            <li><img src="images/badges/badge21.png" alt=""></li>
                                                            <li><img src="images/badges/badge3.png" alt=""></li>
                                                            <li><img src="images/badges/badge4.png" alt=""></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
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

        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/main.min.js"></script>
        <script src="js/script.js"></script>
        
    </body>	

</html>