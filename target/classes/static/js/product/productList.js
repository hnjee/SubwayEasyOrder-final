$("#allCheck").click(function() {
		var allCheck = $("#allCheck").prop("checked");
	  		
	  	if(allCheck){
	  		$(".rowCheck").prop("checked",allCheck);
	  	}else{
	  		$(".rowCheck").prop("checked", false);
	  	}
	  		
	  });


	
	   $(document).ready(function() { 
		    $('#myModal').on('show.bs.modal', function(event) {          
		        var menuNum = $(event.relatedTarget).data('notifyid');
		        var sell = $(event.relatedTarget).data('nonotifyid');
		        
		        if(sell==1){	//품절
		        	console.log("Sell = 1");
					$(".title0").show();
					$(".title1").hide();
					$("#yes").click(function(){
			    	 $.ajax({
						type:"GET",
						url: "./menuSoldout0",
						data: {
							menuNum
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
			        	console.log("Sell = 2");
			        	$(".title1").show();
			        	$(".title0").hide();
			        	$("#yes").click(function(){
					    	 $.ajax({
								type:"GET",
								url: "./menuSoldout1",
								data: {
									menuNum
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
