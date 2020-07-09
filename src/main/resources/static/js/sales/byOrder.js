$(document).ready(function() { 
    $('#myModal').on('show.bs.modal', function(event) {          
        var payNum = $(event.relatedTarget).data('notifyid');
    	$.ajax({
			type:"POST",
			url: "./byOrder",
			data:{
				payNum:payNum
			},
			success : function(data){
				if(data.payNum.length>1){
					console.log("1개이상");
					}
				console.log("success");
				console.log(data.payNum);
				$("#Pname").text(data.name);
				$("#PId").text(data.id);
				$("#Pdate").text(data.payDate);
				$("#Pnum").text(data.payNum);
				$("#Pprice").text(data.totalPrice);
				console.log($("#Pname").text);
				
				}
        	
        	});
    	
   });

 
});

	$("#refund").click(function(){
		var payNum = $("#Pnum").text();
		var id = $("#PId").text();
		var price = $("#Pprice").text();
		var totalPrice = price.split('원');
		console.log(totalPrice);
		if(confirm("정말 거래를 취소 하시겠습니까?")){
    	$.ajax({
			type:"GET",
			url: "./byRefund?payNum="+payNum+"&id="+id+"&totalPrice="+totalPrice,
			success : function(data){
				if(data > 0){
					alert("거래취소 완료");
					$("#myModal").modal("hide"); //모달 닫기
					window.reload();
				}
			}
        	
        	});
		}
	});
   