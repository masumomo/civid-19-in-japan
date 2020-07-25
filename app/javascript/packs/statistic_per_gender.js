import Chart from "chart.js";

const ctx = document.getElementById("statisticPerGenderData").getContext("2d");

const statisticPerGenderData = JSON.parse(
  document.getElementById("statistic_per_gender_data").getAttribute("data")
);
const chart = new Chart(ctx, {
  type: "doughnut",
  data: statisticPerGenderData,
  animation: {
    duration: 3000,
    easing: "easeInOutExpo",
  },
});
