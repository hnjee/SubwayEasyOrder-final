window.onload = function () {

	var ta = $("#ta").val();
	var hy = $("#hy").val();
	var ki = $("#ki").val();
	
	var tap = $("#tap").val();
	var hyp = $("#hyp").val();
	var kip = $("#kip").val();
	
var chart = new CanvasJS.Chart("surveyPieChart", {
	animationEnabled: true,

	data: [{
		type: "doughnut",
		startAngle: 60,
		//innerRadius: 50,
		indexLabelFontSize: 17,
		indexLabel: "{label} - {percent}%",
		toolTipContent: "<b>{label}:</b> {y} ({percent}%)",
		dataPoints: [
			{ y: ta, label: "메뉴 만족도", color: "#ffce32", percent: tap},
			{ y: hy, label: "위생 만족도" ,color: "#0d9133",percent: hyp},
			{ y: ki, label: "서비스 만족도" ,color: "#00a5dd",percent: kip},
		]
	}],

});
chart.render();

}