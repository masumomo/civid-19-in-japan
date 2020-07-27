import Chart from "chart.js";

const ctx = document.getElementById("totalData").getContext("2d");
// var fillPattern0 = ctx.createLinearGradient(20, 0, 220, 0);

// fillPattern0.addColorStop(0, "#2779BD");
// fillPattern0.addColorStop(0.5, "#1C3D5A");
const totalData = JSON.parse(
  document.getElementById("totals_data").getAttribute("data")
);

// totalData.datasets[0].backgroundColor = "rgba(39, 121, 189, 0.2)";
// totalData.datasets[0].borderColor = "rgba(39, 121, 189, 0.8)";
// totalData.datasets[1].backgroundColor = "rgba(86, 97, 179, 0.2)";
// totalData.datasets[1].borderColor = "rgba(86, 97, 179, 0.8)";
// totalData.datasets[2].backgroundColor = "rgba(120, 23, 25, 0.2)";
// totalData.datasets[2].borderColor = "rgba(120, 23, 25, 0.8)";
// totalData.datasets[3].backgroundColor = "rgba(0, 0, 0, 0.2)";
// totalData.datasets[3].borderColor = "rgba(0, 0, 0, 0.8)";
// totalData.datasets[4].backgroundColor = "rgba(0, 0, 0, 0.2)";
// totalData.datasets[4].borderColor = "rgba(0, 0, 0, 0.8)";
// totalData.datasets[5].backgroundColor = "rgba(0, 0, 0, 0.2)";
// totalData.datasets[5].borderColor = "rgba(0, 0, 0, 0.8)";
// totalData.datasets[6].backgroundColor = "rgba(250, 187, 98, 0.2)";
// totalData.datasets[6].borderColor = "rgba(250, 187, 98, 0.8)";

const chart = new Chart(ctx, {
  type: "line",
  borderWidth: 0.1,
  data: totalData,
  // Configuration options go here
  options: {
    layout: {
      padding: {
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      },
    },
    animation: {
      duration: 3000,
      easing: "easeInOutExpo",
    },
    title: {
      display: false,
      text: "Coronavirus (COVID-19)",
    },
    scales: {
      xAxes: [
        {
          ticks: {
            beginAtZero: true,
            callback: function (value) {
              if ((value - 1) % 10 === 0) {
                const year = Math.floor(value / 10000);
                const month = Math.floor((value - year * 10000) / 100);
                return `${year}/${month}`;
              }
              return "";
            },
          },
        },
      ],
    },
  },
});
