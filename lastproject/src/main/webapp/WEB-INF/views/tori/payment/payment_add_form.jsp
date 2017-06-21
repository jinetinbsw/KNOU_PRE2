<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- jQuery UI library -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Payment_ADD</title>

<script>
$(document).ready(function(){

	$("#CARDADD").hide();
	$("#ToMemberJoin").hide();
	$("#paymentSave").hide();
	$("#paymentLoad").hide();
	$('#payment_cate_cd').attr('checked',true);
	
	
	$('#member_phone').focus();
	
	 /* $('#member_phone').focusout($('#member_phone').trigger("click")); */
	
	/* if($("#payment_pay").val() != ""||$("#payment_pay").val() != null){
		console.log($("#payment_pay").val()+"<<<<<<<<<");
		$('#payment_change').trigger("click");
	}
	 */
	document.getElementById('payment_usemileage').value = 0;
	
	
	$('#paymentAdd').click(function(){

		if($('#table_order_id').val()==''){
			alert('테이블주문번호를 입력해주세요.');
      		$('#table_order_id').focus();
		}else if($('#payment_total').val()==''){
			alert('주문총액을 입력해주세요.');
      		$('#payment_total').focus();
		}else if($('#payment_pay').val()==''){
			alert('주문금액을 입력해주세요.');
      		$('#payment_pay').focus();
		}else if($('#payment_cate').val()==''){
			alert('거래유형을 선택해 주세요.');
      		$('#payment_cate').focus();
		}else {
			$('#paymentForm').submit();
		}
	});
});

playAlert = setInterval(function() {

	
	// 테이블주문번호를 통해서 총결제금액 값을 가져오고, 마일리지를 산출하여 텍스트박스에 그 결과값을 표시해주는 스크립트
/*  function bringOrderList(){
	 console.log("bringOrderList"); */
	 var OrderList = $("#table_order_id").val();
	 var values;
	 
	 $.ajax({
			type:'POST',
			data:"Toid="+$("#table_order_id").val(),
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			url:'${pageContext.request.contextPath}/tori/payment/bringOrderList',
			success : function(data){
				/* alert("성공"); */
				var chkRst = data;
				//values = data.OrderList;
				if(chkRst>="0"){
					/* alert("가격 산정 완료"); */
					/* console.log(data); */			// data값이 잘 받아와졌는지 확인테스트
					//console.log(values);
					data = Number(data);		// data타입은 문자열인데 이것을 정수로 형변환
					var mileage = data*0.01;	
					/* console.log(data); */			// 형변환 잘 되었는지 출력
					/* console.log(mileage); */
					document.getElementById('payment_total').value = data;			// 자바스크립트 코드를 이용하여 id값이 payment_total인 요소의 값을 data변수의 값으로 설정해준다.
					document.getElementById('payment_addmileage').value = mileage;
					//document.getElementById('payment_maxusemileage').value = usemileage;
				}else{
					//alert("가격 산정 불가");
					/* console.log(data); */
					//console.log(values);
				}
			},
			error : function(request,status,error){
				
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				//alert("실패 : 해당 주문번호가 존재하지 아니함");
				//document.getElementById('notexistid').value="주문번호가 존재하지 않네요!";
			}
		});
 /* } */

}, 10);

// 회원전화번호를 통해서 회원전화번호 탐색 및 회원의 총 가용 마일리지를 구해준 후에, 그것을 해당 아이디값을 가지는 텍스트박스에 넣어준다.
function bringMemberList(){
	/* console.log("bringMemberList"); */
	alert('휴대폰 중복여부를 확인하고 마일리지 정보를 가져옵니다.');

	 $.ajax({
			type:'POST',
			data:"Toid="+$("#member_phone").val(),
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			url:'${pageContext.request.contextPath}/tori/payment/bringMemberList',
			success : function(data){
				alert("성공");
				var chkRst = data;
				
				if(chkRst>="0"){
					alert("마일리지 가져오기 완료");
					/* console.log(data); */			// data값이 잘 받아와졌는지 확인테스트
				
					data = Number(data);		// data타입은 문자열인데 이것을 정수로 형변환
					
					/* console.log(data);	 */		// 형변환 잘 되었는지 출력
				
					document.getElementById('payment_maxusemileage').value = data;	// 자바스크립트 코드를 이용하여 id값이 payment_maxusemileage인 요소의 값을 data변수의 값으로 설정해준다.
					
				}else{
					alert("마일리지 가져오기 불가");
					/* console.log(data); */
					alert('폰번호 없음');
					//console.log(values);
				}
			},
			error : function(request,status,error){
				
					$("#ToMemberJoin").show();
				
				/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
				alert("실패 : 폰번호 존재하지 않음");
				//document.getElementById('notexistphone').value = "폰번호가 존재하지 않습니다!";
			}
		});
}

function phonecheck(){
	//휴대폰번호를 결제목록에 입력시에 일반적인 휴대폰번호 작성 및 표기법에 맞게 유효성검사 실시(시작)
	//var regExp = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	var MemberList = $("#member_phone").val();

	if(MemberList != ''){
		if(!regExp.test(MemberList)){
			alert("올바른 형식의 번호를 입력하세요");
			$('#member_phone').focus();
			return false;
		}
		alert(MemberList);
		return false;
	}else{
		alert('폰번호를 입력해주십시요');
		return false;
	}
	
}

/* function paymentsave(){
	//카드폼으로 이동하고 카드폼 입력 이전에 작성했던 데이터값을 받아놓는다.
	alert("실행이 되는가?");
	var reservePhone = $("#member_phone").val();
	var reserveUseMileage = $("#payment_usemileage").val();
	var reservePay = $("#payment_pay").val();
	var reserveChange = $("#payment_change").val();
	//alert(reservePhone  + reserveUseMileage + reservePay + reserveChange);
	
}


function paymentload(){
	//카드폼에서 정보를 작성한 후 다시 결제폼으로 돌아올때 이전에 작성해놓았던 데이터값을 불러온다.
	//var loadvalue = paymentsave.reservePhone;
	
	alert(paymentsave.apply(reservePhone));

} */

// 라디오버튼의 값이 카드일때 카드결제폼으로 이동한다.
function gotoCardAddForm(){

	//$("#paymentSave").show();
	//$("#paymentLoad").show();
		 //location.href = "${pageContext.request.contextPath}/tori/payment/payment_card_form";
		$("#CARDADD").show();

}

//회원전화번호가 존재하지 않을때 회원가입폼으로 이동시켜준다.
function toMemberJoin(){
		//alert('실행된다');
		location.href = "${pageContext.request.contextPath}/member/sign_up";
		
}

//
function paymentChange(){
	//alert("실행되었당");
	var mileage = $("#payment_usemileage").val();
	var payment_usemileage = Number(mileage);
	//alert(payment_usemileage);
	var payment_change = $("#payment_pay").val() - $("#payment_total").val() + payment_usemileage;
	
	if($('#payment_pay').val() != ''){
		
		//alert(payment_change);
		//$("#payment_change").val()=payment_change;
		document.getElementById('payment_change').value = payment_change;
	}else{
		alert("우선적으로 지불한 금액을 입력해주세요");
		$('#payment_pay').focus();
	}
}

//팝업창에서 값 받아오기
window.onload = function(){
	
	 var x = opener.document.getElementById('table_order_id').value;
	 //alert('test');
	document.getElementById('table_order_id').value = x;
	
	
	};

function getCardId(){
	//paymentSelect메서드를 실행하기에 앞서서 우선적으로 iframe의 값을 가져와본다.
	var bringCardId = $('#CARDADD').contents().find('#card_id').val();
	var bringPaymentId = $('#CARDADD').contents().find('#payment_id').val();
	var bringCardApp = $('#CARDADD').contents().find('#card_app').val();
	var bringCardDetail = $('#CARDADD').contents().find('#card_detail').val();
	var bringCardDate = $('#CARDADD').contents().find('#card_date').val();
	var bringCardCompany = $('#CARDADD').contents().find('#card_company').val();
	var bringCardTotal = $('#CARDADD').contents().find('#card_total').val();
	var bringCardPrice = $('#CARDADD').contents().find('#card_price').val();
	var bringCardTax = $('#CARDADD').contents().find('#card_tax').val();
	//alert(bringCardId,bringPaymentId,bringCardApp,bringCardDetail,bringCardDate,bringCardCompany,bringCardTotal,bringCardPrice,bringCardTax);
	console.log(bringCardId);
	console.log(bringPaymentId);
	console.log(bringCardApp);
	console.log(bringCardDetail);
	console.log(bringCardDate);
	console.log(bringCardCompany);
	console.log(bringCardTotal);
	console.log(bringCardPrice);
	console.log(bringCardTax);
	document.getElementById('card_id').value = bringCardId;
	document.getElementById('payment_id').value = bringPaymentId;
	document.getElementById('card_app').value = bringCardApp;
	document.getElementById('card_detail').value = bringCardDetail;
	document.getElementById('card_date').value = bringCardDate;
	document.getElementById('card_company').value = bringCardCompany;
	document.getElementById('card_total').value = bringCardTotal;
	document.getElementById('card_price').value = bringCardPrice;
	document.getElementById('card_tax').value = bringCardTax;
	
	//iframe으로 소환된 카드결제화면에서 카드결제를 입력하고 405에러 등이 뜰 때 에려화면을 가려줌과 동시에 카드결제화면이 들어있는 iframe요소를 숨겨준다.
	$('#CARDADD').hide();
}

function dateSave(){
	var paymentDate = $("#payment_date").val();
}

function moneySave(){
	var paymentPay = $("#payment_pay").val();
}

</script>

</head>
<body>
<center><h2>결 제</h2></center>
<div class="container">
<!-- form action에도 입력폼 및 리스트로 가는 것을 작성하지 않고 다른 경로를 작성해본다. 그리고  컨트롤러, 리스트, 매퍼, DTO, DAO, 및 입력 폼의 name속성의 값들을 전부  DB내의 컬럼명으로 통일해서 작성한다-->
	<form id="paymentForm" class="form-inline" action="${pageContext.request.contextPath}/tori/payment/payment_add_action" method="post">
	<table class="table table-stripped table-hover">
		<!-- <tr>
		<td>결제번호</td>
		<td><input class="form-control" size="auto" id="payment_id" name="payment_id"></td>
		<td>
			ID 체크 확인용
			<input type="hidden" id="idChk" value="N" />
			<p id="IDCheck"></p>
		</td>
		</tr> -->
		<tr>
		<td>테이블사용코드</td>
		<td><input class="form-control" size="auto" id="table_order_id" name="table_order_id" type="text" placeholder="테이블주문번호를 입력해 주세요" readonly></td>
		<td>
		<!-- <p id="notexistid"></p> -->
		<!-- <input type="button" class="btn btn-primary form-control" name="ToidCheck" value="체크" size="auto" onclick="javascript:toidCheck();"> -->
		<!-- <input type="button" class="btn btn-primary form-control" name="BringOrderList" value="가져오기" size="auto" onclick="javascript:bringOrderList();"> -->
		</td>
		</tr>
		<tr>
		<td>전화번호</td>
		<td><input class="form-control" size="auto" id="member_phone" name="member_phone" type="tel" onclick="javascript:phonecheck();" placeholder="회원전화번호를 입력해 주세요"></td>
		<td>
		<!-- <p id="notexistphone"></p> -->
		<input type="button" class="btn btn-primary form-control btn-sm" name="ToMemberJoin" id="ToMemberJoin"value="회원가입" size="auto" onclick="javascript:toMemberJoin();">
	<!-- 	<input type="button" class="btn btn-primary form-control" name="BringMemberList" value="가져오기" size="auto" onclick="javascript:bringMemberList();"> -->
		</td>
		</tr>
		<tr>
		<td>총액</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_total" name="payment_total" type="text" readonly></td>
		</tr>
		<tr>
		<td>결제금액</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_pay" name="payment_pay" type="text" placeholder="결제금액을 입력해 주세요"></td>
		</tr>
		<tr>
		<td>거스름돈</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_change" name="payment_change" type="text" onclick="javascript:paymentChange();" readonly></td>
		</tr>
		<tr>
		<td>적립할마일리지 </td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_addmileage" name="payment_addmileage" type="text" placeholder="적립할 마일리지를 입력해 주세요" readonly>
		<!-- <input class="form-control" size="auto" id="payment_maxaddmileage" name="payment_maxaddmileage" type="text" readonly> -->
		</td>
		</tr>
		<tr>
		<td>사용마일리지 / 회원총마일리지</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_usemileage" name="payment_usemileage" type="text" placeholder="사용할 마일리지를 입력해 주세요">
		<input class="form-control" size="auto" id="payment_maxusemileage" name="payment_maxusemileage" type="text" readonly>
		</td>
		</tr>
		<!-- <tr>
		<td>날짜</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_date" name="payment_date" type="date"></td>
		</tr> -->
		<tr>
		<td>구분</td>
		<td colspan="2">
		<input type="radio" name="payment_cate" id="payment_cate" value="현금">현금
		&nbsp;&nbsp;
		<input type="radio" name="payment_cate" id="payment_cate_cd" value="카드" onclick="javascript:gotoCardAddForm();">카드
		<!-- <input class="form-control" size="auto" id="payment_cate" name="payment_cate" type="text"> -->
		</td>
		</tr>
		<tr>
		<td colspan="2">
		<iframe id="CARDADD" width="100%" height="100%" src="${pageContext.request.contextPath}/tori/payment/payment_card_form"></iframe>
		<a href="#" onclick="javascript:getCardId();">카드결제 입력 완료</a>
		<input type="hidden" name="card_id" id="card_id" size="auto">
		<input type="hidden" name="payment_id" id="payment_id" size="auto">
		<input type="hidden" name="card_app" id="card_app" size="auto">
		<input type="hidden" name="card_detail" id="card_detail" size="auto">
		<input type="hidden" name="card_date" id="card_date" size="auto">
		<input type="hidden" name="card_company" id="card_company" size="auto">
		<input type="hidden" name="card_total" id="card_total" size="auto">
		<input type="hidden" name="card_price" id="card_price" size="auto">
		<input type="hidden" name="card_tax" id="card_tax" size="auto">
		</td>
		</tr>
		<!-- <tr>
		<td>상태</td>
		<td><input class="form-control" size="auto" id="payment_state" name="payment_state" type="text"></td>
		<td><label id="paymentcancelYN"></label></td>
		</tr> -->
	</table>
	
	<!-- <input class="btn btn-primary" type="button" id="paymentAdd" name="paymentAdd" onclick="javascript:SubmitYesNo();" value="제출"> -->
	<!-- <input class="btn btn-primary btn-sm" type="reset" id="paymentCancel" name="paymentCancel" value="되돌림"> -->
	<%-- <a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_list">글목록</a> --%>
	<center>
	<input class="btn btn-primary btn-sm" type="button" id="paymentAdd" name="paymentAdd" value="결제완료">
	<input type="button" class="btn btn-primary btn-sm" id="idcheck" name="idcheck" value="휴대폰중복체크" onclick="javascript:bringMemberList();"/>
	</center>
	<input type="button" class="btn btn-primary btn-sm" id="paymentSave" name="paymentSave" value="SAVE" onclick="javascript:paymentsave();"/>
	<input type="button" class="btn btn-primary btn-sm" id="paymentLoad" name="paymentLoad" value="LOAD" onclick="javascript:paymentload();"/>
	</form>
	<br><br>
	<!-- payment_state가 취소라면 payment_cancel_list.jsp로 화면을 이동하게끔 한다. 그리고 실질적인 데이터베이스 반영이 되어져야 한다 -->
<%--<div>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_cancel_form">결제취소직권입력</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_card_form">카드결제직권입력</a>
	</div> --%>
</div>
</body>
</html>
