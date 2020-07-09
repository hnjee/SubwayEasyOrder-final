$("#allCheck").click(function() {
	var allCheck = $("#allCheck").prop("checked");
  		
  	if(allCheck){
  		$(".rowCheck").prop("checked",allCheck);
  	}else{
  		$(".rowCheck").prop("checked", false);
  	}
  		
  });

$(".rowCheck").click(function(){
	var result=true;
 	$(".rowCheck").each(function(){
		var v=$(this).prop("checked");
			if(!(v)){
				result=false;
			}
 	});
 	$("#allCheck").prop("checked",result);
});


$(".del-btn-all").click(function(){
	var deletes =[] ;
	var result =true;

	$(".rowCheck").each(function(){
		var check=$(this).prop("checked");
		if(check){
			deletes.push($(this).attr("name"));
		}
	});
	console.log(deletes);
	$.ajax({
			type:"get",
				traditional: true,
				url:"./listDeletes",
				data:{
					deletes
				},
				success: function(data)			
				{	console.log("삭제성공");
				console.log(data);
					location.reload();
				},error : function(request, status, error) {
					alert("code = " + request.status + " message = "
							+ request.responseText + " error = " + error);
				} 	
		
	});
	
});


$(document).ready(function() { 
	    $('#myModal').on('show.bs.modal', function(event) {          
	    	var ingreNum = $(event.relatedTarget).data('notifyid');
	    	 var sale = $(event.relatedTarget).data('nonotifyid');
	    	
			if(sale==1){	//품절
				$(".title0").show();
				$(".title1").hide();
				$("#yes").click(function(){
					$.ajax({
					type:"GET",
					url:"./ingredientSoldOut",
					data:{
						ingreNum:ingreNum,sale:sale
					},
					success : function(data){
							if(data>0){
								alert("단종 처리 되었습니다");
								
								$("#myModal").modal("hide");
								location.reload();
								}
					}
					
		        	}); //ajax
				});//function
			}else{	//품절해제
	        	$(".title1").show();
	        	$(".title0").hide();
	        	$("#yes").click(function(){
	        		console.log(sale);
					$.ajax({
					type:"GET",
					url:"./ingredientUnsold",
					data:{
						ingreNum
					},
					success : function(data){
							if(data>0){
								alert("단종 해제되었습니다");
								
								$("#myModal").modal("hide");
								location.reload();
								}
					}
					
		        	}); //ajax
				});//function
		   }
			
			
	   });

	 
	});

//$(".btn-Unsold").click(function(){
//	console.log("UnSoldOut");
//	var ingreNum = $(this).attr('title')
//	console.log(ingreNum);
//	$.ajax({
//		type:"get",
//		url:"./ingredientUnsold",
//		data:{
//			ingreNum
//		},
//		success: function(data)			
//		{	console.log("품절해제 성공");
//		console.log(data);
//			location.reload();
//		},error : function(request, status, error) {
//			alert("code = " + request.status + " message = "
//					+ request.responseText + " error = " + error);
//		} 	
//	});
//});
///*$(".btn-soldOut").click(function(){*/
//$(".btn-soldOut").click(function(){
//	console.log("ingredientSoldOut");
//	var ingreNum = $(this).attr('title')
//	console.log(ingreNum);
//	$.ajax({
//		type:"get",
//		url:"./ingredientSoldOut",
//		data:{
//			ingreNum
//		},
//		success: function(data)			
//		{	console.log("품절성공");
//		console.log(data);
//			location.reload();
//		},error : function(request, status, error) {
//			alert("code = " + request.status + " message = "
//					+ request.responseText + " error = " + error);
//		} 	
//	});
//});


$(".deleteOne").click(function(){
	alert("정말 삭제하시겠습니까?")
});
