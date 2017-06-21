<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>회원가입</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/simple-line-icons.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/icheck/skins/flat/aero.css"/>
  <link href="${pageContext.request.contextPath}/resources/asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      
   <!-- 새로이 스크립트로 추가한 부분 -->
   <script>
   function returnPayment(){
	   alert('결제창으로 돌아갑니다. 결제창에서 기존에 입력했던 정보를 입력하세요..');
	   location.href = "${pageContext.request.contextPath}/tori/payment/payment_add_form";
   }
   </script>
    </head>

    <body id="mimin" class="dashboard form-signin-wrapper">

      <div class="container">

        <form class="form-signin"  action="${pageContext.request.contextPath}/sign_up_action" method="post">
          <div class="panel periodic-login">
              <!-- <span class="atomic-number">28</span> -->
              <div class="panel-body text-center">
                  <!-- <p class="atomic-symbol">POSSYS</p> -->
                  <!-- <p class="atomic-mass">14.072110</p> -->
                  <p class="element-name">회원가입 화면</p>

                  <i class="icons icon-arrow-down"></i>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" name="member_name" id="member_name" class="form-text" required>
                    <span class="bar"></span>
                    <label>회원이름</label>
                  </div>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" name="member_email" id="member_email"  class="form-text" required>
                    <span class="bar"></span>
                    <label>Email</label>
                  </div>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" name="member_phone" id="member_phone"  class="form-text" required>
                    <span class="bar"></span>
                    <label>전화번호</label>
                  </div>
                 <!--  <label class="pull-left">
                  <input type="checkbox" class="icheck pull-left" name="checkbox1"/> &nbsp Agree the terms and policy
                  </label> -->
                  <input type="submit" class="btn col-md-12" value="가입신청"/><br>
                  <input type="button" class="btn col-md-12" value="결제화면으로" onclick="javascript:returnPayment();"/>
              </div>
               
          </div>
        </form>

      </div>

      <!-- end: Content -->
      <!-- start: Javascript -->
      <script src="${pageContext.request.contextPath}/resources/asset/js/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/asset/js/jquery.ui.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/asset/js/bootstrap.min.js"></script>

      <script src="${pageContext.request.contextPath}/resources/asset/js/plugins/moment.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/asset/js/plugins/icheck.min.js"></script>

      <!-- custom -->
      <script src="${pageContext.request.contextPath}/resources/asset/js/main.js"></script>
      <script type="text/javascript">
       $(document).ready(function(){
         $('input').iCheck({
          checkboxClass: 'icheckbox_flat-aero',
          radioClass: 'iradio_flat-aero'
        });
       });
     </script>
     <!-- end: Javascript -->
   </body>
   </html>