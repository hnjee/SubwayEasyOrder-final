

$(document).ready(function() { 
	    $('#myModal').on('show.bs.modal', function(event) {          
	        var ingreNum = $(event.relatedTarget).data('notifyid');
	        var sell = $(event.relatedTarget).data('nonotifyid');
	        
	        if(sell==1){	//품절
				$(".title0").show();
				$(".title1").hide();
				$("#yes").click(function(){
		    	 $.ajax({
					type:"GET",
					url: "./ingreOutOfStock",
					data: {
						ingreNum
						},
					success : function(data){
						if(data>0){
							alert("품절 되었습니다");
							$("#myModal").modal("hide");
							location.reload();
						}
					
		        	} 
				});
		   });

		        }else{	//품절해제
		        	$(".title1").show();
		        	$(".title0").hide();
		        	$("#yes").click(function(){
				    	 $.ajax({
							type:"GET",
							url: "./ingreSelling",
							data: {
								ingreNum
								},
							success : function(data){
								if(data>0){
									alert("품절해제 되었습니다");
									$("#myModal").modal("hide");
									location.reload();
								}
							
				        	} 
						});
				   });
			   }
					

	    });
	 
	});




//
//$(".Out-of-stock").click(function(){
//	var ingreNum = $(this).attr('title')
//	console.log(ingreNum);
//	$.ajax({
//		type:"get",
//		url:"./ingreOutOfStock",
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
//
//
//
//$(".ingreSelling").click(function(){
//	var ingreNum = $(this).attr('title')
//	console.log(ingreNum);
//	$.ajax({
//		type:"get",
//		url:"./ingreSelling",
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

