$(document).ready(function() {
	//taste
	var score = new Array();
	$(".taste").each(function(){
		var taste = $(this).val();
		console.log(taste);
		taste = taste*1;
		score.push(taste);
	});
	console.log(score);
	for(var i=0;i<score.length+1;i++){
		for(var j=1;j<7;j++){
			if(score[i]==j){
				console.log(j);
				for(var l=1;l<j+1;l++){
				$(".ta"+i).append("<span class='on'>★</span>");
					}
				}
		}
	}

	//hygiene
	var score1 = new Array();
	$(".hygiene").each(function(){
		var hygiene = $(this).val();
		console.log(hygiene);
		hygiene = hygiene*1;
		score1.push(hygiene);
	});
	console.log(score1);
	for(var i=0;i<score1.length+1;i++){
		for(var j=1;j<7;j++){
			if(score1[i]==j){
				console.log(j);
				for(var l=1;l<j+1;l++){
				$(".hy"+i).append("<span class='on'>★</span>");
					}
				}
		}
	}


	//kindness
	var score2 = new Array();
	$(".kindness").each(function(){
		var kindness = $(this).val();
		console.log(kindness);
		kindness = kindness*1;
		score2.push(kindness);
	});
	console.log(score2);
	for(var i=0;i<score2.length+1;i++){
		for(var j=1;j<7;j++){
			if(score2[i]==j){
				console.log(j);
				for(var l=1;l<j+1;l++){
				$(".ki"+i).append("<span class='on'>★</span>");
					}
				}
		}
	}
	
});
