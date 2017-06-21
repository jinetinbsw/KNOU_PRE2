<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<%@ include file="../modal/header.jsp" %>


<script>

   	$(document).ready(function (){
   		var reg_id = /^[a-z0-9_-]{3,12}$/; 
   		var ckeck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
   		var go = /^[A-Za-z]*$/; 
   	$('#addmenu').click(function()
   			{
   		if(ckeck.test($('#menu_name').val())){ 
   			$('#menu_cate').focus();
   		}else{
   			$('#menu_name').focus();
   		}
   		if(go.test($('#menu_cate').val())){
   			$('#menu_price').focus();
   	    if(!reg_id.test($('#menu_price').val())){
	   		alert("가격은 3자 이상이여야 하며 숫자로 입력해주세요");
	   		$('#menu_price').focus();
	   	}else if(!reg_id.test($('#menu_sprice').val())){
	   		alert("할인은 3자 이상이여야 하며 숫자로 입력해주세요");
	   		$('#menu_sprice').focus();
	   	}else if(!reg_id.test($('#menu_kcal').val())){
	   		alert("칼로리은 3자 이상이여야 하며 숫자로 입력해주세요");
	   		$('#menu_kcal').focus();
	   	}else {
	   		addform.submit();
	   		}
   		}else{
   			alert('영어로 입력해주세요');
   		$('#menu_cate').focus();		
   		}
   		}); 		
   	});
</script>
<title></title>
</head>
<body>
</br></br></br></br></br></br></br></br></br>
<div class="container">
    <h1></h1>
    <form id="addform" action="${pageContext.request.contextPath}/menu_add_form" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="menuPw"> 메뉴명:</label>
            <input class="form-control" name="menu_name" id="menu_name" type="text" placeholder="메뉴명을 입력해주세요"/>
        </div>
        </br></br>
        <div class="form-group">
            <label for="menuPw">상품카테고리:</label>
            <input class="form-control" name="menu_cate" id="menu_cate" type="text" placeholder="상품 카테고리를 입력해주세요"/>
        </div>
        </br></br>
        <div class="form-group">
            <label for="menuName">가격:</label>
            <input class="form-control" name="menu_price" id="menu_price" type="text" placeholder="가격을 입력해주세요 (숫자 3자 이상)"/>
        </div>
        </br></br>
        <div class="form-group">
            <label for="menuName">할인가격:</label>
            <input class="form-control" name="menu_sprice" id="menu_sprice" type="text" placeholder="할인가격을 입력해주세요 (숫자 3자 이상)"/>
        </div>
        </br></br>
        <div class="form-group">
            <label for="menuName">칼로리 :</label>
            <input class="form-control" name="menu_kcal" id="menu_kcal" type="text" placeholder="칼로리를 입력해주세요(숫자 3자 이상)"/>
        </div>
        </br></br>
        <div class="form-group">
            <label for="order_file">사진:</label>
            <input  class="form-control" type="file" id="order_file" name="order_file"> <!-- 이미지 파일 -->
        </div>
        <div>
			<input type="button" id="addmenu" value="등록">
			<input type="reset" id="reset" value="초기화">
		</div>

    </form>
</div>
</body>
</html>
