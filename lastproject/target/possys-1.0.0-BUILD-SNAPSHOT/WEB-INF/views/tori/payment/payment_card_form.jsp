<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- jQuery UI library -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Card_Payment_ADD</title>
<script>
$(document).ready(function(){
	/* $('#paymentCardAdd').click(function(){
		if($('#card_id').val().length<4){
		alert('아이디를 4글자 이상 입력하시오.');
      	$('#card_id').focus();
		}else if($('#payment_id').val().length<4){
		alert('결제아이디를 4자리 이상 입력하시오.');
      	$('#payment_id').focus();
		}else if($('#card_app').val()==''){
		alert('신용구븐를 입력해주십시오.');
      	$('#card_app').focus();
		}else if($('#card_detail').val()==''){
		alert('카드사상세정보를 입력해주세요.');
      	$('#card_detail').focus();
		}else if($('#card_date').val()==''){
		alert('카드결제기일을 입력해주세요.');
      	$('#card_date').focus();
		}else if($('#card_company').val()==''){
		alert('신용카드사를 입력해주세요.');
      	$('#card_company').focus();
		}else if($('#card_company').val()==''){
		alert('신용카드사를 입력해주세요.');
      	$('#card_company').focus();
		}else if($('#card_total').val()==''){
		alert('카드총결제금액은 얼마인지 입력해주세요!');
      	$('#card_total').focus();
		}else if($('#card_price').val()==''){
		alert('공급가액은 얼마인지 입력해주세요.');
      	$('#card_price').focus();
		}else if($('#card_tax').val()==''){
		alert('카드 부가세는 얼마인가요?');
      	$('#card_tax').focus();
		}else {
			$('#paymentCardForm').submit();
		}
	}); */
});

function chkDupCardId(){
	var prmId = $("#card_id").val();
	console.log(prmId);
	if($("#card_id").val() == '')
		{	alert('ID를 입력해 주세요!');
			return;
		}
	 $.ajax({
		type:'POST',
		data:"prmId="+$("#card_id").val(),
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		dataType:'text',
		url:'${pageContext.request.contextPath}/tori/payment/chkDupCardId',
		success : function(data){
			alert("성공");
			var chkRst = data;
			if(chkRst=="Y"){
				alert("등록 가능 합니다");
				console.log(data);
				$("#idcheck").val('Y');
			}else{
				alert("중복됩니다");
				console.log(data);
				$("#idcheck").val('N');
			}
		},
		error : function(request,status,error){
			
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("실패");
		}
	});
}

/*
function insertChk(){
	var frm = document.paymentForm;
	
	if(!chkVal('card_id','card_id'))
		return false;
	if($("#idChk").val()=='N'){
		alert('ID체크를 해주시오');
		return;
	}
} */

//카드결제폼에서 결제내역폼으로 이동해주는 역할
function returnform(){
	
	if($('#card_app').val()==''){
		alert('신용구분를 입력해주십시오.');
  		$('#card_app').focus();
	}else if($('#card_detail').val()==''){
		alert('카드사상세정보를 입력해주세요.');
  		$('#card_detail').focus();
	}else if($('#card_date').val()==''){
		alert('카드결제기일을 입력해주세요.');
  		$('#card_date').focus();
	}else if($('#card_company').val()==''){
		alert('신용카드사를 입력해주세요.');
  		$('#card_company').focus();
	}else if($('#card_company').val()==''){
		alert('신용카드사를 입력해주세요.');
  		$('#card_company').focus();
	}else if($('#card_total').val()==''){
		alert('카드총결제금액은 얼마인지 입력해주세요!');
  		$('#card_total').focus();
	}else if($('#card_price').val()==''){
		alert('공급가액은 얼마인지 입력해주세요.');
  		$('#card_price').focus();
	}else if($('#card_tax').val()==''){
		alert('카드 부가세는 얼마인가요?');
  		$('#card_tax').focus();
	}else {
		$('#paymentCardForm').submit();
	}
	
	location.href='${pageContext.request.contextPath}/tori/payment/payment_add_form';
	//var payment_cate = location.href.$("#payment_cate").val();
	alert(location.href.$("#payment_cate").val());
	//$("#payment_cate").val() = '카드';
	//alert($("#payment_cate").val());
	location.href.$('input:radio[name="payment_cate"]:radio[value="현금"]').attr('checked',true);
}

//카드결제폼에 날짜형식을 빌려서 자바스크립트로 난수아이디를 생성한다
function addCardId(){
	
	var cardId = "cd"+getTimeStamp();
	
	function getTimeStamp() {
		  var d = new Date();

		  var s =
		    leadingZeros(d.getFullYear(), 1) +
		    leadingZeros(d.getMonth() + 1, 1) +
		    leadingZeros(d.getDate(), 1) +
		    leadingZeros(d.getSeconds(), 1);

		  return s;
		}



		function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
		
		document.getElementById('card_id').value = cardId;
}

/* function loadCardTotal(){
	//부모프레임인 결제폼에 접근하여 카드결제금액을 가져온다
	//window.parent.moneySave();
	//alert("실행됩니까?");
	var cardTotal = $("#payment_pay",parent.document).val();
	alert(cardTotal);
	cardTotal = Number(cardTotal);
	cardPrice = cardTotal * 10/11;
	cardTax = cardTotal * 1/11;
	document.getElementById('card_total').value = cardTotal;
	document.getElementById('card_price').value = cardPrice.toFixed(0);
	document.getElementById('card_tax').value = cardTax.toFixed(0);
	/* var ffrom = parent.document.paymentForm;
	var fto = document.paymentForm;
	for(var i = 0; i < ffrom.elements.length; ++i){
		var fId = ffrom.elements[i]
		fto.elements[fId.payment_pay].value=fId.value;
	} 
} */

</script>
 
</head>
<body>
<h1><center>카드 결제</center></h1>
	<div class="container">
		<form id="paymentCardForm" action="${pageContext.request.contextPath}/tori/payment/payment_card_action" method="post" class="form-inline">
			<table class="table table-hover table-stripped">
				<tr>
					<td>승인번호 :
					</td>
					<td><input type="text" class="form-control" name="card_id" id="card_id" size="auto" placeholder="승인번호를 입력해주세요" onclick="javascript:addCardId();">
					</td>
				</tr>
				<tr>
					<td>결제번호 : 
					</td>
					<td><input type="text" class="form-control" name="payment_id" id="payment_id" size="auto" placeholder="결제아이디를 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>승인구분 : 
					</td>
					<td>
					<input type="radio" name="card_app" id="card_app" value="정상(승인)" size="auto">정상
					<input type="radio" name="card_app" id="card_app" value="취소" size="auto">취소
					</td>
				</tr>
				<tr>
					<td>상세내역 : 
					</td>
					<td><input type="text" class="form-control" name="card_detail" id="card_detail" size="auto" placeholder="결제상세내역을 입력해 주세요">
					</td>
				</tr>
				<tr>
					<td>승인날짜 : 
					</td>
					<td><input type="date" class="form-control" name="card_date" id="card_date" size="auto">
					<!-- <input type="date" class="form-control" name="card_date" id="card_date" size="auto" onclick="javascript:loadCardDate();"> -->
					</td>
				</tr>
				<tr>
					<td>카드사 : 
					</td>
					<td><input type="text" class="form-control" name="card_company" id="card_company" size="auto" placeholder="카드사를 입력해 주세요">
					</td>
				</tr>
				<tr>
					<td>카드결제금액 :
					</td>
					<td><input type="text" class="form-control" name="card_total" id="card_total" size="auto"  placeholder="결제금액을 입력해 주세요">
					<!-- <input type="text" class="form-control" name="card_total" id="card_total" size="auto" onclick="javascript:loadCardTotal()" placeholder="결제금액을 입력해 주세요"> -->
					</td>
				</tr>
				<tr>
					<td>공급가액: 
					</td>
					<td><input type="text" class="form-control" name="card_price" id="card_price" size="auto" placeholder="공급가액을 입력해 주세요">
					</td>
				</tr>
				<tr>
					<td>부가세 : 
					</td>
					<td><input type="text" class="form-control" name="card_tax" id="card_tax" size="auto" placeholder="부가세를 입력해 주세요">
					</td>
				</tr>
				</table>
		<input type="submit" class="btn btn-primary btn-sm" id="paymentCardAdd" name="paymentCardAdd" value="카드거래입력">
		<input type="reset" class="btn btn-primary btn-sm" id="paymentCancel" name="paymentCancel" value="다시입력">
		<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/tori/payment/payment_card_list">글목록</a>
		<!-- <input type="button" class="btn btn-primary btn-sm" value="리턴하기" onclick="javascript:returnform();"/> -->
		<input type="button" class="btn btn-primary btn-sm" value="승인번호중복체크" onclick="javascript:chkDupCardId();"/>
		</form>
		<br><br>
			<!-- <div>
			ID 체크 확인용
			<input type="hidden" id="idChk" value="N"/>
			</div> -->
	</div>
</body>
</html>