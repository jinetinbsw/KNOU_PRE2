<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Responsive Auto Show/Hide Toggle Menu Demo</title>
 
 
 
 
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/modal/style_order.css" />
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
	$('#btn').click(function(){
		
		window.open("ho.html",'popup','width=500,height=300,left=0,top=0,toolbar=no,locaton=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
			
		
	});
});
</script>



<div class="nav_wrapper"> 
  <!--<a class="menu-link" href="#menu"></a>-->
  
  <div class="spinner-master">
    <input type="checkbox" id="spinner-form" />
    <label for="spinner-form" class="spinner-spin">
    <div class="spinner diagonal part-1"></div>
    <div class="spinner horizontal"></div>
    <div class="spinner diagonal part-2"></div>
    </label>
  </div>
  <nav id="menu" class="menu">
    <ul class="dropdown">
      <li ><a class = "catebutton " id = "all" title="Link">전체</a></li>
      <li ><a class = "catebutton " id = "drinkmenu" title="Link">음료류</a></li>
      <li ><a class = "catebutton " id = "sidemenu">사이드메뉴</a></li>
      <li ><a class = "catebutton " id = "hambuger">햄버거류</a></li>
      <li ><a class = "catebutton " id = "setmenu">세트메뉴</a></li>
  </nav>
<!-- 
  <form class="search_box" id="search_box" action="/search/">
    <input name="search_criteria" id="search" placeholder="Search here">
    <input class="search_icon" value="Search" type="submit">
  </form> -->
</div>




<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/modal/script.js"></script>
<!-- 네비바 종료 -->




<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/modal/script.js"></script>

</body>
</html>
