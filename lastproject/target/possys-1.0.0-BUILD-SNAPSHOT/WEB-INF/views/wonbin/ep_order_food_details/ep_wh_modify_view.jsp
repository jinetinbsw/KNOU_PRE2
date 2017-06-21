<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>�԰� ����ȭ��</title>
<%-- <%@ include file="../../modal/header.jsp" %> --%>
<script type="text/javascript">
		window.onload = function(){	
		var ep_order_id = opener.document.getElementById('wh_mody').value;
// 		alert(ep_order_id+'asd');
		document.getElementById('_ep_order_id').value = ep_order_id;		
		}
	$(document).ready(function(){
		var ep_order_id = $('#_ep_order_id').val()
		$('#ep_order_id').html("�����ڵ� : "+ep_order_id);
		//�԰�id�� ����Ʈ ��������
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/ajax/ep_wh_add_form",
			data : "ep_order_id="+ep_order_id,
			dataType : "JSON",
			success : function(data){
				
				$.each(data,function(){
// 					console.log(this.ep_id+"<<<<<");
					ep_order_id = this.ep_order_id;
// 					console.log(ep_order_id+'<<<< ep_order_id');
					$('#ep_order_id').html("�����ڵ� : "+ep_order_id);
					$('#wh_cancel').val(ep_order_id); // �԰���� ��ư val() �԰� �ڵ� ��ȣ �Է�
					ep_id = this.ep_id;
					ep_name = this.ep_name;
					food_id = this.food_id;
					food_name = this.food_name;
					ep_order_wh_ea = this.ep_order_wh_ea;
					_ep_order_food_shelflife = this.ep_order_food_shelflife;
// 					alert(_ep_order_food_shelflife);
					_ep_order_unit_price = this.ep_order_unit_price;
					_ep_order_total_price = this.ep_order_total_price;
// 					alert(_ep_order_unit_price);
// 					console.log(ep_id+ep_name+food_id+food_name+ep_order_ea)
									
					$('#wh_body').append("<tr class='tr_reset'>"
							+"<td class='ep_id'>"+ep_id+"</td>"
							+"<td class='ep_name'>"+ep_name+"</td>"
							+"<td class='food_id'>"+food_id+"</td>"
							+"<td class='food_name'>"+food_name+"</td>"
							+"<td>"
							+'<button id="del" type="button" value="ep_order_wh_ea" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;">'
							+'<i class="fa fa-minus" style="font-size:15px;color:#489CFF"></i>'
							+'</button>'							
							+'<input class="_ep_order_wh_ea" id="_ep_order_wh_ea" name="ep_order_wh_ea" type="text" value="'+ep_order_wh_ea+'" size="3" style="padding-top: 1px; padding-bottom: 3px;"/>'
							+'<button id="add" type="button" value="ep_order_wh_ea" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;">'
							+'<i class="fa fa-plus" style="font-size:15px;color:#489CFF"></i>'
							+'</button>'							
							+"</td>"							
							+"<td>"
							+'<input class="_ep_order_food_shelflife" id="_ep_order_food_shelflife" name="ep_order_food_shelflife" type="date" value="'+_ep_order_food_shelflife+'"/>'
							+"</td>"
							+"<td>"
							+'<input class="_ep_order_unit_price" type="text" id="_ep_order_unit_price" name="ep_order_unit_price" value="'+_ep_order_unit_price+'" size="3" style="padding-top: 1px; padding-bottom: 3px;"/>'
							+"</td>"
							+"<td>"
							+'<input class="_ep_order_total_price" type="text" value="'+_ep_order_total_price+'" id="_ep_order_total_price" name="ep_order_total_price" readonly="readonly" size="4" style="padding-top: 1px; padding-bottom: 3px;"/>'
							+"</td>"							
							+"</tr>")
						
					$('#wh_form').append("<div class='in_reset'>"
							+'<input type="hidden" id="ep_order_id" name="ep_order_id" value="'+ep_order_id+'"/>'
							+'<input type="hidden" id="food_id" name="food_id" value="'+food_id+'"/>'
							+'<input class="ep_order_wh_ea" type="hidden" id="ep_order_wh_ea" name="ep_order_wh_ea"/>'
							+'<input class="ep_order_food_shelflife" type="hidden" id="ep_order_food_shelflife" name="ep_order_food_shelflife"/>'
							+'<input class="ep_order_unit_price" type="hidden" value="0" id="ep_order_unit_price" name="ep_order_unit_price"/>'
							+'<input class="ep_order_total_price" type="hidden" value="0" id="ep_order_total_price" name="ep_order_total_price"/>'
							+"</div>")							
				}); //�ݺ��� ��
				// table �հ� ȭ�鿡 �ڵ����� �հ�� �ݾ� �����ϱ�
				var _ea = $('._ep_order_wh_ea')
				var _unit = $('._ep_order_unit_price')
				var _total = $('._ep_order_total_price')
				var total = $('.ep_order_total_price')
				$(document).on('change','.tr_reset',function(){
					for(var i=0; i<_total.length; i++){
						_total[i].value = parseInt(_ea[i].value) * parseInt(_unit[i].value);
					}
				})
				
			},			
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
			}
		});//ajax End
		//"+","-" ��ư Ŭ���� ���� ����
		//�������� ������ �±״� ������ �̺�Ʈ�������� ���� ����� �� .on
		$(document).on('click','#add',function(){
		 			//���� ���� ����� val()���� add�� �ش� value�� parseInt�� +1 ���༭ value�� ��´�.
				var _add = $(this).prev().val();
				$(this).prev().val(parseInt(_add)+1);
//	 			console.log(_add);
				var unit = $(this).parent().next().next().children().val();
				// add ��ư�� �θ�� add��ư�� ���� <td> �±� , �� ���� ������Ҵ� ��������� ���� <td> �±�, �� ���� ������Ҵ� �ܰ��� ���� <td>�±�, �� �ڽĿ�Ҵ� �ܰ� input�Է� 
//	 			var total = $(this).parent().next().next().next().children().val();
//	 			alert(unit+"<<< �ܰ�") alert(total+"<<< �Ұ�")
				var multi = parseInt((parseInt(_add)+1) * unit);
//	 			alert(multi+"<< ���ϱ�")
				$(this).parent().next().next().next().children().val(multi);
				// ���ϱ��Ѱ� ����			
		})
		$(document).on('click','#del',function(){
				var _del = $(this).next().val();
						//parseInt �� ���� �ν�
				if(_del > 0){ // 0�� �Էµɼ� ������ 0����
					$(this).next().val(parseInt(_del)-1);
				}else{alert('���̻� ���� �Ҽ������ϴ�.');}
				var unit = $(this).parent().next().next().children().val();
				var multi = parseInt((parseInt(_del)-1) * unit);
				$(this).parent().next().next().next().children().val(multi);
		})
												// �԰���� �׼�	
	$(document).on('click','#wh_mody_bt',function(){
// 		alert('��Ϲ�ư Ŭ��');
		var _ea = $('._ep_order_wh_ea') //���� Ŭ����
		var ea = $('.ep_order_wh_ea')
		var _life = $('._ep_order_food_shelflife') //������� Ŭ����
		var life = $('.ep_order_food_shelflife')
		var _unit = $('._ep_order_unit_price') // �ܰ�
		var unit = $('.ep_order_unit_price')
		var _total = $('._ep_order_total_price')
		var total = $('.ep_order_total_price')		
		for(var i=0; i<_ea.length; i++){
			ea[i].value = _ea[i].value //���� hidden input value �� ����
			life[i].value = _life[i].value //������� hidden input value �� ����
			unit[i].value = _unit[i].value //�ܰ� hidden input value �� ����
			total[i].value = _total[i].value // �հ� hidden input value �� ����
//			console.log(fo_life[i].value+"<< fo_life.value"+i+"��°");
		}
		// ��ȿ�� �˻� / ���Խ�
		var num = /^[0-9]*$/;
		var success = 0;
		var success2 = 0;
		var success3 = 0;
		var count2 = 0;
			//����
		$('._ep_order_wh_ea').each(function(){
			var ep_order_ea = $(this).val();
// 			alert(ep_order_ea);
			if(!ep_order_ea){
				var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
						+'�԰� ������ �Է� ���ֽʽÿ�.'
						+'</div>'
				$('#div_vaild').html(al);
				$(this).focus();
				
				success = 0;
				return false;
			}else if(!num.test(ep_order_ea)){
				var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
  						+'�԰� ������ ���ڸ� �Է� �����մϴ�.'
						+'</div>'
				$('#div_vaild').html(al);
				$(this).focus();
				
				success = 0;
				return false;
			}else{
				success = 1;
			}
// 				if(ep_order_ea == 0){
				
// 				var re = confirm('������ 0���� ����ᰡ �ֽ��ϴ�. ��� �����Ͻðڽ��ϱ�?');
// 				if(re){
// 					$(this).parent().next().next().children().attr('readonly',true);
// 					success = 1;					
// 				}else{
// 					success = 0;
// 					return false;
// 					}				
// 			}else{
// 				$(this).parent().next().next().children().attr('readonly',false);
// 				success = 1;
// 			}
		})
		if(success == 1){ 			
			//�������
			$('._ep_order_food_shelflife').each(function(){
				var ep_order_food_shelflife = $(this).val();
				if(!ep_order_food_shelflife){
					var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
  						+'��������� �Է� ���ֽʽÿ�.'
						+'</div>'
				$('#div_vaild').html(al);
				$(this).focus();
					success2 = 0;
					return false;
				}else{
					success2 = 1;
					}
			})			
		}
		var count = 0;
		if(success2 == 1){			
			// �ܰ�			
			$('._ep_order_unit_price').each(function(){
				var ep_order_unit_price = $(this).val();
				if(!ep_order_unit_price){
					var al = '<div "class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
							+'�ܰ��� �Է� ���ֽʽÿ�.'
							+'</div>'
					$('#div_vaild').html(al);
					$(this).focus();
					
				}else if(!num.test(ep_order_unit_price)){
					var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
							+'�ܰ��� ���ڸ� �Է°����մϴ�.'
							+'</div>'
					$('#div_vaild').html(al);
					$(this).focus();
					success3 = 0;
					return false;				
					}else if(ep_order_unit_price == 0){
						count++;
						success3 = 1;
						return false;
					}else{
						count = 0;
						success3 = 1;
					}				
			}) // �ܰ� �ݺ���
		}
// 		alert(count);
		if(success3 == 1){
			if(count > 0){
				var re = confirm('�ܰ��� 0���� ����ᰡ �ֽ��ϴ�. ��� �����Ͻðڽ��ϱ�?');
				if(re){
					var addform = $('#wh_form').serialize();
					$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/ep_wh_mody",
							data : addform,
							success : function(data){
								alert('�����Ǿ����ϴ�.');
								var cnt = 1;
								if(cnt == 1) {
								   opener.location.reload(); // �θ�â�� �ѹ� ���ΰ�ħ �����ش�.
								   cnt = 0;
								}
								self.close(); // insert ���������� â�� �ݴ´�
							},
							error : function(request,status,error){
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
							}
						});// �����׼� ajax ��
				}
			}else if(count == 0){
				var addform = $('#wh_form').serialize();
				$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/ep_wh_mody",
						data : addform,
						success : function(data){
							alert('�����Ǿ����ϴ�.');
							var cnt = 1;
							if(cnt == 1) {
							   opener.location.reload(); // �θ�â�� �ѹ� ���ΰ�ħ �����ش�.
							   cnt = 0;
							}
							self.close(); // insert ���������� â�� �ݴ´�
						},
						error : function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
						}
					});// �����׼� ajax ��				
			}
		}
	}) //�԰���� �׼� End
		
	// �ش� �԰� ���
	$('#wh_cancel').click(function(){
// 		alert($(this).val())
		var ep_order_id = $(this).val();
		var re = confirm('�ش� �԰� ����Ͻø� �԰����� �ٽ� ���ּž��մϴ�. ��� �����Ͻðڽ��ϱ�? ');
		if(re){
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/ajax/ep_wh_cancel",
				data : 'ep_order_id='+ep_order_id,
				success : function(data){
					alert('�ش� �԰� ��ҵǾ����ϴ�.');
					var cnt = 1;
					if(cnt == 1) {
					   opener.location.reload(); // �θ�â�� �ѹ� ���ΰ�ħ �����ش�.
					   cnt = 0;
					}
					self.close(); // insert ���������� â�� �ݴ´�
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
				}
			});// �԰���� ajax ��
		}
	})
	// �ݱ� �̺�Ʈ
	$('#wh_exit').click(function(){
		self.close();
	})
	
	}) // ready End
</script>
</head>
<body>
<br>
<br>
<div class="container">
<h4>�԰� ����</h4>
		<span id="ep_order_id"></span>
		<input type="hidden" id="_ep_order_id"/>
		<div style="overflow:auto;height:500px;">
		<table  class="chkclass table table-hover" style="text-align:center">
			<thead>
				<tr style='position:relative;top:expression(this.offsetParent.scrollTop);background:black;color:white;" align="left"'>
					<th>��ü�ڵ�</th>
					<th>��ü��</th>
					<th>�����ڵ�</th>
					<th>��ǰ��</th>
					<th>����</th>
					<th>�������</th>
					<th>�ܰ�</th>
					<th>�Ұ�</th>
				</tr>
			</thead>
			<tbody id="wh_body" style='width:100%;max-height:100px;overflow:auto;'>
				<!-- ajax append �� -->				
			</tbody>
		</table>
			<form id="wh_form" action="${pageContext.request.contextPath}/ep_wh_mody" method="get"> <!-- �迭�̶� �׷��� get������� ������ -->
<!-- 				hidden ó�� �ϰ� �� ���� // ��ü�ڵ�,�����ڵ� ��� -->							
			</form>
			<div>
			<div id="div_vaild">
			</div>
				<center>
				<button class="btn btn-primary" type="button" id="wh_mody_bt">����</button>				
				<button class="btn btn-default" type="button" id="wh_cancel">�԰����</button>
				<button class="btn btn-default" type="button" id="wh_exit">�ݱ�</button>
				</center>
			</div>
			
		</div>		
	</div> <!-- �԰��� �� end -->
</body>
</html>