<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body>

<h1><Strong>�ڵ� �ֹ� ��ȸ ��� </Strong></h1>
�������� �����ִ� ����</br>
DB���� �ֹ� ���� ó���� ���� ���� �ֹ��� �ִ°��</br>
������������ DB�� ��ȸ ������ �ϴܿ� �˸�â�� ����Ѵ�.</br>
<button id="requestPermissionButton" class="btn btn-warning btn-lg btn-block">����ũž �˸�â ���� ��û(<---1�� click)</button>
</br>
<div id="notificationBlock" class="form-group">
   <!--  <label class="control-label">(�˸� �޽��� ���� �Է��� �ֹ���û click)</label></br> -->

   
    <div class="input-group">
        <!-- <span class="input-group-addon">�޽���</span>
        <input id="notificationMessage" type="text" class="form-control" disabled/> -->
        <span class="input-group-btn">
           <center><button id="notificationButton" class="btn btn-info" type="button" disabled>���ο� �ֹ� Ȯ��</button></center>
        </span>
    </div>
</div>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<!-- <script type="text/javascript">
playAlert = setInterval(function() {
   alert('http://webisfree.com');
}, 3000);
</script> -->


<script>
var requestPermissionButton = $("#requestPermissionButton");
var notificationButton = $("#notificationButton");
var notificationMessage = $("#notificationMessage");
var iconDataURI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAKBJREFUeNpiYBjpgBFd4P///wJAaj0QO9DEQiAg5ID9tLIcmwMYsDgABhqoaTHMUHRxpsGYBv5TGqTIZsDkYWLo6gc8BEYdMOqAUQeMOoAqDgAWcgZAfB9EU63SIAGALH8PZb+H8v+jVz64KiOK6wIg+ADEArj4hOoCajiAqMpqtDIadcCoA0YdQIoDDtCqQ4KtBY3NAYG0csQowAYAAgwAgSqbls5coPEAAAAASUVORK5CYII=";

//����ũž �˸� ���� ��û ��ư�� ������,
requestPermissionButton.on("click", function () {
	//����ũž �˸� ���� ��û
    Notification.requestPermission(function (result) {

        //��û�� �����ϸ�,
        if (result === 'denied') {
            return;
        }
        //��û�� ����ϸ�,
        else {
            //����ũž �˸� ���� ��û ��ư�� ��Ȱ��ȭ
            requestPermissionButton.attr('disabled', 'disabled');
            //����ũž �޽��� �Է����� Ȱ��ȭ
            notificationMessage.removeAttr('disabled');
            //����ũž �޽��� ��û ��ư�� Ȱ��ȭ
            notificationButton.removeAttr('disabled');
            return;
        }
    });
});



	playAlert = setInterval(function() {
		   
		
	$.ajax({
		type:'GET',
		url:"${pageContext.request.contextPath}/alram_test",
		dataType:"JSON",
		success:function(data){
			/* alert('����'); */
			console.log(data);
			
			$.each(data, function (){
				
			var table_order_end = this.table_order_end;
			
				if(table_order_end =="f"){
					/* alert('�ֹ���û'); */	
					var message = "���ο� �ֹ��� �ֽ��ϴ�";
				  if (message !== null && message.length > 0) {
				        
				        var options = {
				            body: message,
				            icon: iconDataURI
				        }
				        //����ũž �˸� ��û
				        var notification = new Notification("�ֹ���û����", options);
				        
				        //�˸� �� 5�� ��,
				        setTimeout(function () {
				            //��� �޽��� �ݱ�
				            notification.close();
				        }, 5000);
				    }
				}else{
					/* alert('�ֹ�����ó��'); */
				}
			});
		}
	});
	
	}, 9000);
//����ũž �˸� ��ư�� ������,
/* notificationButton.on("click", function () { */
	/* var test1 = "���ο� �ֹ��� �ֽ��ϴ�"; */
	
    /* var message = notificationMessage.val(); */
    /* var message = test1 */
    
    //�޽����� �Է��� ��쿡��,
   /*  if (message !== null && message.length > 0) {
        
        var options = {
            body: message,
            icon: iconDataURI
        } */
       
        //����ũž �˸� ��û
       /*  var notification = new Notification("�ֹ���û����", options);
        
        //�˸� �� 5�� ��,
        setTimeout(function () {
            //��� �޽��� �ݱ�
            notification.close();
        }, 50000);
    } */
/* }); */
</script>
</body>
</html>