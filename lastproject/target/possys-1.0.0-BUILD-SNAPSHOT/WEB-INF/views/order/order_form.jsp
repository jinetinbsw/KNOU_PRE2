<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
<style>

::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; display:none;}
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url(`./images/bg.png`) #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
     
	
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);

html {
  font-family: 'Montserrat', Arial, sans-serif;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
}

body {
  background: #F2F3EB;
}

button {
  overflow: visible;
}

button, select {
  text-transform: none;
}

button, input, select, textarea {
  color: #5A5A5A;
  font: inherit;
  margin: 0;
}

input {
  line-height: normal;
}

textarea {
  overflow: auto;
}

#container {
  border: solid 3px #474544;
  max-width: 768px;
  margin: 60px auto;
  position: relative;
}

form {
  padding: 37.5px;
  margin: 50px 0;
}

h1 {
  color: #474544;
  font-size: 32px;
  font-weight: 700;
  letter-spacing: 7px;
  text-align: center;
  text-transform: uppercase;
}

.underline {
  border-bottom: solid 2px #474544;
  margin: -0.512em auto;
  width: 80px;
}

.icon_wrapper {
  margin: 50px auto 0;
  width: 100%;
}

.icon {
  display: block;
  fill: #474544;
  height: 50px;
  margin: 0 auto;
  width: 50px;
}

.email {
	float: right;
	width: 45%;
}

input[type='text'], [type='email'], select, textarea {
	background: none;
  border: none;
	border-bottom: solid 2px #474544;
	color: #474544;
	font-size: 1.000em;
  font-weight: 400;
  letter-spacing: 1px;
	margin: 0em 0 0.275em 0;
	padding: 0 0 0.275em 0;
  text-transform: uppercase;
	width: 100%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	-o-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.message {
	float: none;
}

.name {
	float: left;
	width: 45%;
}

select {
  background: url('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-arrow-down-32.png') no-repeat right;
  outline: none;
  -moz-appearance: none;
  -webkit-appearance: none;
}

select::-ms-expand {
  display: none;
}

.subject {
  width: 100%;
}

.telephone {
  width: 100%;
}

textarea {
	line-height: 150%;
	height: 150px;
	resize: none;
  width: 100%;
}

::-webkit-input-placeholder {
	color: #474544;
}

:-moz-placeholder { 
	color: #474544;
	opacity: 1;
}

::-moz-placeholder {
	color: #474544;
	opacity: 1;
}

:-ms-input-placeholder {
	color: #474544;
}

#form_button {
  background: none;
  border: solid 2px #474544;
  color: #474544;
  cursor: pointer;
  display: inline-block;
  font-family: 'Helvetica', Arial, sans-serif;
  font-size: 0.875em;
  font-weight: bold;
  outline: none;
  padding: 20px 35px;
  text-transform: uppercase;
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

#form_button:hover {
  background: #474544;
  color: #F2F3EB;
}

@media screen and (max-width: 768px) {
  #container {
    margin: 20px auto;
    width: 95%;
  }
}

@media screen and (max-width: 480px) {
  h1 {
    font-size: 26px;
  }
  
  .underline {
    width: 68px;
  }
  
  #form_button {
    padding: 15px 25px;
  }
}

@media screen and (max-width: 420px) {
  h1 {
    font-size: 18px;
  }
  
  .icon {
    height: 35px;
    width: 35px;
  }
  
  .underline {
    width: 53px;
  }
  
  input[type='text'], [type='email'], select, textarea {
    font-size: 0.875em;
  }
}
	
	/* .addbutton{
	    background-color: #4CAF50;
	    border: 1;
	    color: white;
	    padding: 15px 32px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	    
	} */
	
		.buttons{
		  background: #3498db;
		  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
		  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
		  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
		  background-image: -o-linear-gradient(top, #3498db, #2980b9);
		  background-image: linear-gradient(to bottom, #3498db, #2980b9);
		  -webkit-border-radius: 28;
		  -moz-border-radius: 28;
		  border-radius: 28px;
		  font-family: Arial;
		  color: #ffffff;
		  font-size: 12px;
		  padding: 5px 7px 5px 7px;
		  text-decoration: none;
	    
	}
	
	
/* 		.catebutton{
	    background-color: #4CAF50;
	    border: none;
	    color: white;
	    padding: 15px 32px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	} */
	</style>
	
	<!--  슬라이드 쇼-->
<style>
* {box-sizing:border-box}
body {font-family: Verdana,sans-serif;margin:0}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor:pointer;
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

<!-- 버튼-->

</style>
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문</title>
<%@ include file="../modal/wide_menu_order.jsp" %>
<script type="text/javascript">

	$(document).ready(function(){
		
		
		
		$('.addbutton').click(function(){
			
			
			var cls = "."+this.id;

			var menu_price = $(cls).children('#menu_price').text();
			var menu_id = $(cls).children('#menu_id').text();
			var menu_name = $(cls).children('#menu_name').text();
			var order_max_per = $(cls).children('#order_max_per').text();
			var menu_check = $('#menu_check').val();
			
			if(parseInt(order_max_per) <= 0){
				$('#'+this.id).text("매진");
				
			}

			else if($('#menu_frame').children(cls).text()==""){
			menu_check = parseInt(menu_check)+1;	
			$('#menu_check').val(menu_check);
			$('#menu_frame').append
			("<div class = '"+menu_id+"'><input name ='menu_id' id ='menu_id'"
					+"class ='"+menu_id+"' type ='text' value='"+menu_id+"' readonly='readonly' hidden = 'hidden'/> "
					+"<div class= '"+menu_id+" name'>"
					+"<input name ='menu_name' id ='menu_name'"
					+"class ='"+menu_id+"' type ='text' value='"+menu_name+"'readonly='readonly'/> "
					+"</div>"
					+"<div class= '"+menu_id+" email'>"
					+"<input name ='order_detail_ea' id ='order_detail_ea'"
					+"class ='"+menu_id+"' type ='text' value='1'readonly='readonly'/> "
					+"</div>"
					+"<div class= '"+menu_id+" telephone'>"
					+"<input name ='order_detail_sum' id ='order_detail_sum'"
					+"class ='"+menu_id+"' type ='text' value='"+menu_price+"'readonly='readonly'/> "
					+"<input name ='order_max_pers' id ='order_max_pers'"
					+"class ='"+menu_id+"' type ='text' value='"+order_max_per+"'readonly='readonly'/ hidden = 'hidden'> "
					+"</div>"
					+"<input name ='menu_price' id ='menu_prices'"
					+"class ='"+menu_id+"' type ='text' value='"+menu_price+"'readonly='readonly'/ hidden = 'hidden'> "
					+"<div class= '"+menu_id+" submit'>"
					+"<button  type='button' id = '"+menu_id+"' class = 'delbutton buttons'>X</button> "
					+"<button  type='button' id = '"+menu_id+"' class = 'plusbutton buttons'>▲</button> "
					+"<button  type='button' id = '"+menu_id+"' class = 'minusbutton buttons'>▼</button></div>"
					+"</div><br/>"
					 
					)
			}

			
			
			
		});
		
		
		$('#addsubmit').click(function(){
			var menu_check = $('#menu_check').val();
			
			if(menu_check == 0){
				
				return false;	
			}
			else{
				return true;
			}
			
			
		})
		
		$('.catebutton').click(function(){
			var cls = "."+this.id;
			var catego = this.id;
			$('#catego').val(catego);
			currentSlide();
			
/* 			alert(cls+"히든");
			$('.all').hide();
			$(cls).show();
			$('.hid').hide(); */
			
		});
		
		$(document).on("click",".delbutton",function(){
			
			var menu_check = $('#menu_check').val();
			menu_check = parseInt(menu_check)-1;	
			$('#menu_check').val(menu_check);
			
			var cls = "."+this.id;
			
			$('#menu_frame').children(cls).remove();
		});
		
		$(document).on("click",".plusbutton",function(){
			
			var cls = "."+this.id;
			var max = $(cls).children('#order_max_pers').val();;
			
			
			var now = $(cls).children('#order_detail_ea').val();
			now = parseInt(now)+1;
			var price = $(cls).children('#menu_prices').val();
			var total = now*price			
			
			
			if(now <= 0){
				
			}
			else if(now > max){
				alert("재고가 부족합니다.");
				now = parseInt(now)-1;
			}
			else{
			
			$(cls).children('#order_detail_ea').val(now);
			$(cls).children('#order_detail_sum').val(total);
			}
			/* alert(total); */
			
		});
		
		$(document).on("click",".minusbutton",function(){
			
			var cls = "."+this.id;
			var now = $(cls).children('#order_detail_ea').val();
			now = parseInt(now)-1;
			var price = $(cls).children('#menu_prices').val();
			var total = now*price
			if(now <= 0){
				now = parseInt(now)+1;
				
			}
			else{
			$(cls).children('#order_detail_ea').val(now);
			$(cls).children('#order_detail_sum').val(total);
			}
			/* alert(total); */
			
			
			
		});
		
		
		
		
		
	});
</script>


</head>
<body>


<br/><br/><br/>

<input id = "catego" type = "text" value ="all" hidden = "hidden"/>
<div class = "slideshow-container">
			<c:forEach varStatus="status" var="m" items="${menu_list}">
					
				<!-- 사진 추가부분 -->
				<div class="mySlides fade all ${m.menu_cate} ${m.menu_id}">
				
				<div name = "newname" id = "newname" class = "${m.menu_id}"><img src = "${m.newname}" style="width:100%"></div>
				<div class="text">
				메뉴명 : ${m.menu_name}<br/>
				가격 : ${m.menu_price} 열량 : ${m.menu_kcal}kcal<br/>
				<%-- 재고 : ${m.order_max_per}<br/> --%><!-- 삭제예정 -->
				<button class = "addbutton buttons" id = "${m.menu_id}"type = "button" >추가</button>
				</div>
				
				
				<table style="width:100%">
				<tr class = "${m.menu_id}">
				<td name = "menu_id" id = "menu_id" class = "${m.menu_id} hid" style = "display:none">${m.menu_id}</td>
				<td name = "menu_name" id = "menu_name" class = "${m.menu_id}" style="display:none">${m.menu_name}</td>
				<td name = "menu_cate" id = "menu_cate" class = "${m.menu_id} hid" style = "display:none">${m.menu_cate}</td>
				<td name = "menu_price" id = "menu_price" class = "${m.menu_id}" style="display:none">${m.menu_price}</td>
				<td name = "menu_sprice" id = "menu_sprice" class = "${m.menu_id} hid" style = "display:none">${m.menu_sprice}</td>
				<td name = "menu_kcal" id = "menu_kcal" class = "${m.menu_id}" style="display:none">${m.menu_kcal}kcal</td>
				<td name = "order_max_per" id = "order_max_per" class = "${m.menu_id} hid" style = "display:none">${m.order_max_per}</td>
				
				<%-- <td style="width:20%"><button class = "addbutton" id = "${m.menu_id}"type = "button" >추가</button></td> --%>
				</tr>
				</table>
				
				</div>
			
			</c:forEach>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
		<div id = "dotp" style="text-align:center">
		
			<c:forEach varStatus="status" var="m" items="${menu_list}">
				<span class="dot" onclick="currentSlides(${status.index}+1)"></span> 
			</c:forEach>
		</div>

<form id="addform" action="${pageContext.request.contextPath}/order_action" method="post">
		<input name = "table_order_id" id = "table_order_id" class = "${result_id}" type = "text" value = "${result_id}" hidden="hidden"/>
		<input name = "menu_check" id = "menu_check" type = "text" value = "0" hidden = "hidden"/>
		<input name = "table_order_num" id = "table_order_num" type = "text" value = "${table_order_num}" hidden="hidden"/>
		<div id = "menu_frame"  style = "overflow:scroll; height : 200px;">	
		</div>
		<br/>
		<div>
		<input class = "buttons" type="submit" id="addsubmit" value="주문">
		</div>
</form>


<script>
<!-- 슬라이더 쇼 -->
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide() {
	var catego = $("#catego").val();
	var slides = document.getElementsByClassName(catego);
	$(".dot").remove();
	for(var i = 1; i <= slides.length; i++){
		$("#dotp").append("<sapn class = 'dot' onclick='currentSlides("+i+")'></span>");
	}
 	showSlides(slideIndex);
}
function currentSlides(n) {
	  showSlides(slideIndex = n);
	}

function showSlides(n) {
  var i;
  var catego = $("#catego").val();
  var slides = document.getElementsByClassName(catego);
  var allslides = document.getElementsByClassName("all");
  var dots = document.getElementsByClassName("dot");
  
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < allslides.length; i++) {
	  allslides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }

  slides[slideIndex-1].style.display = "block"; 
  dots[slideIndex-1].className += " active";
  
}
</script>
	
	

</body>
</html>