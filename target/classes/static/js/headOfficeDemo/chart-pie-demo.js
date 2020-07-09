window.onload = function () {

	var sw = $("#sw").val();
	var sa = $("#sa").val();
	var si = $("#si").val();
	var wr = $("#wr").val();
	var gr = $("#gr").val();
	
	var swp = $("#swp").val();
	var sap = $("#sap").val();
	var sip = $("#sip").val();
	var wrp = $("#wrp").val();
	var grp = $("#grp").val();
	
	
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,

	data: [{
		type: "doughnut",
		startAngle: 60,
		//innerRadius: 50,
		indexLabelFontSize: 17,
		indexLabel: "{label} - {percent}%",
		toolTipContent: "<b>{label}:</b> {y} ({percent}%)",
		dataPoints: [
			{ y: sw, label: "Sandwich", color: "#ffce32", percent: swp},
			{ y: sa, label: "Salad" ,color: "#0d9133",percent: sap},
			{ y: si, label: "Side" ,color: "#00a5dd",percent: sip},
			{ y: wr, label: "Wrap",color: "#85c441",percent: wrp},
			{ y: gr, label: "Catering Menu",color: "#fa8306",percent: grp},
		]
	}],

});
chart.render();

}

