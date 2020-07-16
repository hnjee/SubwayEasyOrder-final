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
	if(confirm("가맹점 회원의 정보까지 함께 사라집니다. 삭제하시겠습니까?")){
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
	}
});


$(".deleteOne").click(function(){
	var storeNum = $(this).attr("title");
	if(confirm("가맹점 회원의 정보까지 함께 사라집니다. 삭제하시겠습니까?")){
		location.href="./ownerDelete?storeNum"+storeNum;
	}
});

$("#bestReset").click(function(){

	var storeNum = $(this).attr("title");
	console.log(storeNum);
	if(confirm("베스트매장을 리셋 하시겠습니까?")){
		location.href="./bestRest";
		}
	});

$("#bestClick").click(function(){
	var pick =[];
	var result =true;
	
	if(confirm("베스트매장을 선정 하시겠습니까?")){
		$(".rowCheck").each(function(){
			var check=$(this).prop("checked");
			if(check){
				pick.push($(this).attr("name"));
			}
		});
		console.log(pick);
		$.ajax({
			type:"get",
				traditional: true,
				url:"./bestPick",
				data:{
					pick:pick
				},
				success: function(data)			
				{	console.log("pick성공");
				console.log(data);
					location.reload();
				},error : function(request, status, error) {
					alert("code = " + request.status + " message = "
							+ request.responseText + " error = " + error);
				} 	
		
	});
		
		}
	});
//location.href="./bestPick;

$("#bestList").click(function(){
		location.href="./bestList";
		console.log("이동");
	
});

$("#worstList").click(function(){
		location.href="./worstList";
		console.log("worstList 이동");
	
});