// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var c2=[];
$(".taste").each(function(){
	c2.push($(this).val());
});
console.log(c2);


var c3=[];
$(".hygiene").each(function(){
	c3.push($(this).val());
});
console.log(c3);

var c4=[];
$(".kindness").each(function(){
	c4.push($(this).val());
});
console.log(c4);
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
	  //데이터의 라벨을 입력하는 부분
    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    datasets: [{
      label: "taste",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "#92A8D1",
      pointRadius: 3,
      pointBackgroundColor: "#0F4C81",
      pointBorderColor: "#0F4C81",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "#0F4C81",
      pointHoverBorderColor: "#0F4C81",
      pointHitRadius: 10,
      pointBorderWidth: 2,       
      //실제값
      //rgba(78, 115, 223, 1)
      data:c2,
    }, 
    {
        label: "hygiene",
        lineTension: 0.3,
        backgroundColor: "rgba(78, 115, 223, 0.05)",
        borderColor: "#f29db9",
        pointRadius: 3,
        pointBackgroundColor: "#c2275a",
        pointBorderColor: "#c2275a",
        pointHoverRadius: 3,
        pointHoverBackgroundColor: "#c2275a",
        pointHoverBorderColor: "#c2275a",
        pointHitRadius: 10,
        pointBorderWidth: 2,       
        //실제값
        //rgba(78, 115, 223, 1)
        data:c3,
      }, 
    {
      label: "kindness",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "#63ebc9",
      pointRadius: 3,
      pointBackgroundColor: "#326e3d",
      pointBorderColor: "#326e3d",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "#326e3d",
      pointHoverBorderColor: "#326e3d",
      pointHitRadius: 10,
      pointBorderWidth: 2,       
      //실제값
      //rgba(78, 115, 223, 1)
      data:c4,
    },
    ],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return number_format(value)+'점';
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': ' + number_format(tooltipItem.yLabel)+'점';
        }
      }
    }
  }
});


//
//window.onload = function () {
//
//var chart = new CanvasJS.Chart("chartContainer", {
//	animationEnabled: true,
//	exportEnabled: true,
//	title:{
//		text: ""            
//	}, 
//	axisY:{
//		title: "점수"
//	},
//	toolTip: {
//		shared: true
//	},
//	legend:{
//		cursor:"pointer",
//		itemclick: toggleDataSeries
//	},
//	data: [{        
//		type: "spline",  
//		name: "메뉴(맛)",        
//		showInLegend: true,
//		dataPoints: [
//			{ label: "Jan" , y: 4 },     
//			{ label:"Feb", y: 3 },     
//			{ label: "Mar", y: 3 },     
//			{ label: "Apr", y: 3 },     
//			{ label: "May", y: 4 },
//			{ label: "Jun", y: 2 },
//			{ label: "Jul", y: 4 },
//			{ label: "Aug", y: 2 },
//			{ label: "Sep", y: 4 },
//			{ label: "Oct", y: 3 },
//			{ label: "Nov", y: 5 },
//			{ label: "Dec", y: 1 }
//		]
//	}, 
//	{        
//		type: "spline",
//		name: "위생",        
//		showInLegend: true,
//		dataPoints: [
//			{ label: "Jan" , y: 3 },     
//			{ label:"Feb", y: 1 },     
//			{ label: "Mar", y: 1 },     
//			{ label: "Apr", y: 5 },     
//			{ label: "May", y: 3 },
//			{ label: "Jun", y: 2 },
//			{ label: "Jul", y: 5 },
//			{ label: "Aug", y: 3 },
//			{ label: "Sep", y: 3 },
//			{ label: "Oct", y: 4 },
//			{ label: "Nov", y: 1 },
//			{ label: "Dec", y: 4 }
//		]
//	},
//	{        
//		type: "spline",  
//		name: "친절",        
//		showInLegend: true,
//		dataPoints: [
//			{ label: "Jan" , y: 5 },     
//			{ label:"Feb", y: 4 },     
//			{ label: "Mar", y: 1 },     
//			{ label: "Apr", y: 2 },     
//			{ label: "May", y: 3 },
//			{ label: "Jun", y: 4 },
//			{ label: "Jul", y: 4 },
//			{ label: "Aug", y: 5 },
//			{ label: "Sep", y: 2 },
//			{ label: "Oct", y: 2 },
//			{ label: "Nov", y: 3 },
//			{ label: "Dec", y: 3 }
//		]
//	},
//	{        
//
//	},
//	{        
//
//	},  
//	{        
//
//	}]
//});
//
//chart.render();
//
//function toggleDataSeries(e) {
//	if(typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
//		e.dataSeries.visible = false;
//	}
//	else {
//		e.dataSeries.visible = true;            
//	}
//	chart.render();
//}
//
//}