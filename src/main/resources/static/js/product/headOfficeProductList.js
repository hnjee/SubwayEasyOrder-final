
//전체 선택
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

//선택삭제
$(".SD").click(function(){
	var deletes =[] ;
	var result =true;
	if(confirm("상품을 삭제 하시겠습니까?")){
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
				url:"./productDeletes",
				data:{
					deletes
				},
				success : function(data){
					if(data>0){
						alert("삭제가 완료 되었습니다");
						location.reload();
				}

			},error : function(request, status, error) {
					alert("code = " + request.status + " message = "
							+ request.responseText + " error = " + error);
				} 	
		
	});
	}
	
});

//개별삭제
$(".del").click(function(){
	var menuNum = $(this).attr("title");
	console.log(menuNum);
	if(confirm("상품을 삭제 하시겠습니까?")){
		location.href="./productDelete?menuNum="+menuNum;
		}
	});

//품절,품절해제
$(document).ready(function() { 
    $('#myModal').on('show.bs.modal', function(event) {          
        var menuNum = $(event.relatedTarget).data('notifyid');
        var sale = $(event.relatedTarget).data('nonotifyid');
        console.log(sale);
        if(sale==1){	//품절
			$(".title0").show();
			$(".title1").hide();
	        }else{	//품절해제
	        	$(".title1").show();
	        	$(".title0").hide();
		   }

		$("#yes").click(function(){
			console.log("click");
    	 $.ajax({
			type:"GET",
			url: "./modal",
			data : {
				menuNum:menuNum,sale:sale
				},
			success : function(data){
					if(data>0){
						if(sale==1){
							alert("품절 되었습니다");
						}else{
							alert("품절이 해제 되었습니다");
						}
						
						$("#myModal").modal("hide");
						location.reload();
				}

			}
			
        	}); 
			});
	
   });

 
});

