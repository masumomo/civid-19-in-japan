import Chart from "chart.js";

const ctx = document.getElementById("statisticPerAgeData").getContext("2d");

const statisticPerAgeData = JSON.parse(
  document.getElementById("statistic_per_age_data").getAttribute("data")
);
const chart = new Chart(ctx, {
  type: "bar",
  data: statisticPerAgeData,
  animation: {
    duration: 3000,
    easing: "easeInOutExpo",
  },
});
