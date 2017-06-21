<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
.img{
width:1000px;
height:200px;
}

</style>
<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<title>admin Page</title>   

<meta name="description" content="Insert Your Site Description" /> 

<!-- Mobile Specifics -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="HandheldFriendly" content="true"/>
<meta name="MobileOptimized" content="320"/>   

<!-- Mobile Internet Explorer ClearType Technology -->
<!--[if IEMobile]>  <meta http-equiv="cleartype" content="on">  <![endif]-->

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/_include/css/bootstrap.min.css" rel="stylesheet">

<!-- Main Style -->
<link href="${pageContext.request.contextPath}/resources/_include/css/main.css" rel="stylesheet">

<!-- Supersized -->
<link href="${pageContext.request.contextPath}/resources/_include/css/supersized.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/_include/css/supersized.shutter.css" rel="stylesheet">

<!-- FancyBox -->
<link href="${pageContext.request.contextPath}/resources/_include/css/fancybox/jquery.fancybox.css" rel="stylesheet">

<!-- Font Icons -->
<link href="${pageContext.request.contextPath}/resources/_include/css/fonts.css" rel="stylesheet">

<!-- Shortcodes -->
<link href="${pageContext.request.contextPath}/resources/_include/css/shortcodes.css" rel="stylesheet">

<!-- Responsive -->
<link href="${pageContext.request.contextPath}/resources/_include/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/_include/css/responsive.css" rel="stylesheet">

<!-- Supersized -->
<link href="${pageContext.request.contextPath}/resources/_include/css/supersized.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/_include/css/supersized.shutter.css" rel="stylesheet">

<!-- Google Font -->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>

<!-- Fav Icon -->
<link rel="shortcut icon" href="#">

<link rel="apple-touch-icon" href="#">
<link rel="apple-touch-icon" sizes="114x114" href="#">
<link rel="apple-touch-icon" sizes="72x72" href="#">
<link rel="apple-touch-icon" sizes="144x144" href="#">

<!-- Modernizr -->
<script src="${pageContext.request.contextPath}/resources/_include/js/modernizr.js"></script>

<!-- Analytics -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'Insert Your Code']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- End Analytics -->

</head>


<body>

<!-- This section is for Splash Screen -->
<div class="ole">
<section id="jSplash">
	<div id="circle"></div>
</section>
</div>
<!-- End of Splash Screen -->

<!-- Homepage Slider -->
<div id="home-slider">	
    <div class="overlay"></div>

    <div class="slider-text">
    	<div id="slidecaption"></div>
    </div>   
	
	<div class="control-nav">
        <a id="prevslide" class="load-item"><i class="font-icon-arrow-simple-left"></i></a>
        <a id="nextslide" class="load-item"><i class="font-icon-arrow-simple-right"></i></a>
        <ul id="slide-list"></ul>
        
        <a id="nextsection" href="#work"><i class="font-icon-arrow-simple-down"></i></a>
    </div>
</div>
<!-- End Homepage Slider -->

<!-- Header -->
<header>
    <div class="sticky-nav">
   <!--  	<a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>
         -->
<!--         <div id="logo">
        	<a id="goUp" href="#home-slider" title="Brushed | Responsive One Page Template">POS_SYSTEM</a>
        </div>
         -->
         <div class="session" style="float:left;">	
        		<b>아이디:${sessionScope.Staff.Staff_id}</b>
        		<b>이름:${sessionScope.Staff.Staff_name}</b>
        		<b>직책:${sessionScope.Staff.Staff_level}</b>
        		</br>
        		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
            </div>	
        <nav id="menu">
        	<ul id="menu-nav">
        	
            	<li class="current"><a href="#home-slider">Home</a></li>
                <li><a href="#work">cateGory</a></li>
                <li><a href="#about">Team_Profile</a></li>
                
				</nav>
			
            </ul>
        	
       
    </div>
</header>
<!-- End Header -->

<!-- Our Work Section -->
<div id="work" class="page">
	<div class="container">
    	<!-- Title Page -->
        <div class="row">
            <div class="span12">
                <div class="title-page">
                    <h2 class="title">cateGory</h2>
                    <h3 class="title-description">원하시는 메뉴를 클릭하세요</h3>
                </div>
            </div>
        </div>
        <!-- End Title Page -->
        
        <!-- Portfolio Projects -->
        <div class="row">
        	<div class="span3">
            	<!-- Filter -->
                <nav id="options" class="work-nav">
                    <ul id="filters" class="option-set" data-option-key="filter">
                    	<li class="type-work">Type of Work</li>
                        <li><a href="#filter" data-option-value="*" class="selected">전체메뉴</a></li>
                        <li><a href="#filter" data-option-value=".member">회원관리</a></li>
                        <li><a href="#filter" data-option-value=".shop">매장관리</a></li>
                        <li><a href="#filter" data-option-value=".staff">직원관리</a></li>
                    </ul>
                </nav>
                <!-- End Filter -->
            </div>
            
            <div class="span9">
            	<div class="row">
                	<section id="projects">
                    	<ul id="thumbs">
                        
							<!-- 회원 리스트 링크 -->
                        	<li class="item-thumbs span3 member">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<%-- <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="member_list" href="${pageContext.request.contextPath}/member_list"> --%>
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="member_list" href="${pageContext.request.contextPath}/member_list">
                                	<span class="overlay-img">member_List</span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/member.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                        	<!-- End Item Project -->
                            
							<!-- 메뉴 입력 링크 -->
                        	<li class="item-thumbs span3 shop">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="menu_add_form" href="${pageContext.request.contextPath}/menu_add_form">
                                	<span class="overlay-img">menu_add</span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/bgimg02.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                        	<!-- End Item Project -->
                            
							<!-- 주문 리스트 링크 -->
                        	<li class="item-thumbs span3 shop">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="order_list" href="${pageContext.request.contextPath}/order_list"">
                                	<span class="overlay-img">order_list</span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/order.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                        	<!-- End Item Project -->
                            
							<!-- 식자재 품목 링크 -->
                        	<li class="item-thumbs span3 shop">
                            	<!-- Fancybox Media - Gallery Enabled - Title - Link to Video -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="food_list" href="${pageContext.request.contextPath}/food_list">
                                	<span class="overlay-img">food_list</span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/food.jpg" alt="Video">
                            </li>
                        	<!-- End Item Project -->
                            
							<!-- 폐기품목 링크 -->
                        	<li class="item-thumbs span3 shop">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="drop_list" href="${pageContext.request.contextPath}/drop_list">
                                	<span class="overlay-img">drop_list</span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/drop_list.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                        	<!-- End Item Project -->
                            
							<!-- 발주업체 링크 -->
                        	<li class="item-thumbs span3 shop">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="ep_manage_list" href="${pageContext.request.contextPath}/ep_manage_list">
                                	<span class="overlay-img">ep_manage_list</span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/ep_manage_list.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                        	<!-- End Item Project -->
                            
							<!-- 결제관리업무 -->
                        	<li class="item-thumbs span3 shop">
                            	<!-- Fancybox Media - Gallery Enabled - Title - Link to Video -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="payment_add_form" href="${pageContext.request.contextPath}/tori/payment/payment_add_form">
                                	<span class="overlay-img">payment_add_form</span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/payment.jpg" alt="Video">
                            </li>
                        	<!-- End Item Project -->
                            
							<!-- 직원관리업무 -->
                        	<li class="item-thumbs span3 staff">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="staff_add_form" href="${pageContext.request.contextPath}/tori/staff/staff_add_form">
                                	<span class="overlay-img">staff_add_form</span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/images.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li>
                        	<!-- End Item Project -->
                            
							<!-- Item Project and Filter Name -->
                        	<%-- <li class="item-thumbs span3 design">
                            	<!-- Fancybox - Gallery Enabled - Title - Full Image -->
                            	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Beach" href="${pageContext.request.contextPath}/resources/_include/img/work/full/image-07-full.jpg">
                                	<span class="overlay-img"></span>
                                    <span class="overlay-img-thumb font-icon-plus"></span>
                                </a>
                                <!-- Thumb Image and Description -->
                                <img class="img" src="${pageContext.request.contextPath}/resources/_include/img/work/thumbs/image-07.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                            </li> --%>
                        	<!-- End Item Project -->
                        </ul>
                    </section>
                    
            	</div>
            </div>
        </div>
        <!-- End Portfolio Projects -->
    </div>
</div>
<!-- End Our Work Section -->

<!-- About Section -->
<div id="about" class="page-alternate">
<div class="container">
    <!-- Title Page -->
    <div class="row">
        <div class="span12">
            <div class="title-page">
                <h2 class="title">Team Name</h2>
                <h3 class="title-description">Smart Order Management & POS System Based on  Web</h3>
            </div>
        </div>
    </div>
    <!-- End Title Page -->
    
    <!-- People -->
    <div class="row">
    	
        <!-- Start Profile -->
    	<div class="span4 profile">
        	<div class="image-wrap">
                <div class="hover-wrap">
                    <span class="overlay-img"></span>
                    <span class="overlay-text-thumb">CTO/Founder</span>
                </div>
                <img src="${pageContext.request.contextPath}/resources/_include/img/profile/profile-01.jpg" alt="John Doe">
            </div>
            <h3 class="profile-name">팀장:홍경인</h3>
            <p class="profile-description">
            	담당업무:주문관리 및 매출관리
            </a>
            </p>
            	
            <div class="social">
            	<ul class="social-icons">
                	<li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-dribbble"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-facebook"></i></a></li>
                </ul>
            </div>
        </div>
        <!-- End Profile -->
        
        <!-- Start Profile -->
    	<div class="span4 profile">
        	<div class="image-wrap">
                <div class="hover-wrap">
                    <span class="overlay-img"></span>
                    <span class="overlay-text-thumb">Creative Director</span>
                </div>
                <img src="${pageContext.request.contextPath}/resources/_include/img/profile/profile-02.jpg" alt="Jane Helf">
            </div>
            <h3 class="profile-name">오광진</h3>
            <p class="profile-description"></a>
            	담당업무:발주관리 및 재고관리
            </p>
            	
            <div class="social">
            	<ul class="social-icons">
                	<li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-email"></i></a></li>
                </ul>
            </div>
        </div>
        <!-- End Profile -->
        
        <!-- Start Profile -->
    	<div class="span4 profile">
        	<div class="image-wrap">
                <div class="hover-wrap">
                    <span class="overlay-img"></span>
                    <span class="overlay-text-thumb">Lead Designer</span>
                </div>
                <img src="${pageContext.request.contextPath}/resources/_include/img/profile/profile-03.jpg" alt="Joshua Insanus">
            </div>
            <h3 class="profile-name">배상훈</h3>
            <p class="profile-description"></a> 
            	담당업무:로그인 인터셉터 및 회원관리,레이아웃
            </p>
            	
            <div class="social">
            	<ul class="social-icons">
                	<li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-linkedin"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-google-plus"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-vimeo"></i></a></li>
                </ul>
            </div>
        </div>
        <!-- End Profile -->
        
                <!-- Start Profile -->
    	<div class="span4 profile">
        	<div class="image-wrap">
                <div class="hover-wrap">
                    <span class="overlay-img"></span>
                    <span class="overlay-text-thumb">Lead Designer</span>
                </div>
                <img src="${pageContext.request.contextPath}/resources/_include/img/profile/profile-03.jpg" alt="Joshua Insanus">
            </div>
            <h3 class="profile-name">백승욱</h3>
            <p class="profile-description"></a>
            	담당업무:결제관리 및 직원관리
            </p>
            	
            <div class="social">
            	<ul class="social-icons">
                	<li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-linkedin"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-google-plus"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-vimeo"></i></a></li>
                </ul>
            </div>
        </div>
        <!-- End Profile -->
                <!-- Start Profile -->
    	<div class="span4 profile">
        	<div class="image-wrap">
                <div class="hover-wrap">
                    <span class="overlay-img"></span>
                    <span class="overlay-text-thumb">Lead Designer</span>
                </div>
                <img src="${pageContext.request.contextPath}/resources/_include/img/profile/profile-03.jpg" alt="Joshua Insanus">
            </div>
            <h3 class="profile-name">최홍락</h3>
            <p class="profile-description"></a>
            	담당업무:메뉴관리 및 메뉴별 식재소비관리
            </p>
            	
            <div class="social">
            	<ul class="social-icons">
                	<li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-linkedin"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-google-plus"></i></a></li>
                    <li><a href="#"><i class="font-icon-social-vimeo"></i></a></li>
                </ul>
            </div>
        </div>
        <!-- End Profile -->
    </div>
    <!-- End People -->
</div>
</div>
<!-- End About Section -->




<!-- Twitter Feed -->
<div id="twitter-feed" class="page-alternate">
	<div class="container">
    	<div class="row">
            <div class="span12">
                <div class="follow">
                    <a href="https://twitter.com/Bluxart" title="Follow Me on Twitter" target="_blank"><i class="font-icon-social-twitter"></i></a>
                </div>
                    
                <div id="ticker" class="query"> 
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Twitter Feed -->

<!-- Socialize -->
<div id="social-area" class="page">
	<div class="container">
    	<div class="row">
            <div class="span12">
                <nav id="social">
                    <ul>
                        <li><a href="https://twitter.com/Bluxart" title="Follow Me on Twitter" target="_blank"><span class="font-icon-social-twitter"></span></a></li>
                        <li><a href="http://dribbble.com/Bluxart" title="Follow Me on Dribbble" target="_blank"><span class="font-icon-social-dribbble"></span></a></li>
                        <li><a href="http://forrst.com/people/Bluxart" title="Follow Me on Forrst" target="_blank"><span class="font-icon-social-forrst"></span></a></li>
                        <li><a href="http://www.behance.net/alessioatzeni" title="Follow Me on Behance" target="_blank"><span class="font-icon-social-behance"></span></a></li>
                        <li><a href="https://www.facebook.com/Bluxart" title="Follow Me on Facebook" target="_blank"><span class="font-icon-social-facebook"></span></a></li>
                        <li><a href="https://plus.google.com/105500420878314068694" title="Follow Me on Google Plus" target="_blank"><span class="font-icon-social-google-plus"></span></a></li>
                        <li><a href="http://www.linkedin.com/in/alessioatzeni" title="Follow Me on LinkedIn" target="_blank"><span class="font-icon-social-linkedin"></span></a></li>
                        <li><a href="http://themeforest.net/user/Bluxart" title="Follow Me on ThemeForest" target="_blank"><span class="font-icon-social-envato"></span></a></li>
                        <li><a href="http://zerply.com/Bluxart/public" title="Follow Me on Zerply" target="_blank"><span class="font-icon-social-zerply"></span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- End Socialize -->

<!-- Footer -->
<footer>
	<p class="credits">&copy;2016 Brushed. Crafted by <a href="http://designscrazed.org/" title="Brushed | Responsive One Page Template">Allie</a></p>
</footer>
<!-- End Footer -->

<!-- Back To Top -->
<a id="back-to-top" href="#">
	<i class="font-icon-arrow-simple-up"></i>
</a>
<!-- End Back to Top -->


<!-- Js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> <!-- jQuery Core -->
<script src="${pageContext.request.contextPath}/resources/_include/js/bootstrap.min.js"></script> <!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/resources/_include/js/supersized.3.2.7.min.js"></script> <!-- Slider -->
<script src="${pageContext.request.contextPath}/resources/_include/js/waypoints.js"></script> <!-- WayPoints -->
<script src="${pageContext.request.contextPath}/resources/_include/js/waypoints-sticky.js"></script> <!-- Waypoints for Header -->
<script src="${pageContext.request.contextPath}/resources/_include/js/jquery.isotope.js"></script> <!-- Isotope Filter -->
<script src="${pageContext.request.contextPath}/resources/_include/js/jquery.fancybox.pack.js"></script> <!-- Fancybox -->
<script src="${pageContext.request.contextPath}/resources/_include/js/jquery.fancybox-media.js"></script> <!-- Fancybox for Media -->
<script src="${pageContext.request.contextPath}/resources/_include/js/jquery.tweet.js"></script> <!-- Tweet -->
<script src="${pageContext.request.contextPath}/resources/_include/js/plugins.js"></script> <!-- Contains: jPreloader, jQuery Easing, jQuery ScrollTo, jQuery One Page Navi -->
<script src="${pageContext.request.contextPath}/resources/_include/js/main.js"></script> <!-- Default JS -->
<!-- End Js -->

</body>