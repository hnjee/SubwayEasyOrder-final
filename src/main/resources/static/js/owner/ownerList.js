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
				url:"./ownerDeletes",
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
$(".deleteOne").click(function(){
	alert("가맹점 회원의 정보까지 함께 사라집니다. " +
			"삭제하시겠습니까?")
});
