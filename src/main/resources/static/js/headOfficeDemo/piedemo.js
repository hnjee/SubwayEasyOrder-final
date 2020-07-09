// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';



// Pie Chart Example

var sw = $("#sw").val();
var sa = $("#sa").val();
var si = $("#si").val();
var wr = $("#wr").val();
var gr = $("#gr").val();

var ctx = document.getElementById("myPieChart");

var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Sandwich", "Salad", "Side", "Wrap", "Catering Menu"],
    
    datasets: [{
      data: [sw, sa, si, wr, gr],
      backgroundColor: ['#ffce32', '#0d9133', '#00a5dd','#85c441', '#fa8306'],
      hoverBackgroundColor: ['#ffc400', '#0a7529','#0099cc', '#75b036', '#e17605'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 50,
  },
});
