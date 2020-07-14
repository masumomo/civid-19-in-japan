const { statistics } = require("./statistics");
const { prefectures } = require("./prefectures");

const fs = require("fs");
const convertStatisticsData = [];
const convertedPrefectureData = [];
const convertedPrefectures = [];

statistics.data.forEach((s) => {
  const statisticData = {
    id: s.id,
    name_ja: s.name_ja,
    total_count: s.total_count,
    male_count: s.male.count,
    male_00s: s.male.generations_count["00s"],
    male_10s: s.male.generations_count["10s"],
    male_20s: s.male.generations_count["20s"],
    male_30s: s.male.generations_count["30s"],
    male_40s: s.male.generations_count["40s"],
    male_50s: s.male.generations_count["50s"],
    male_60s: s.male.generations_count["60s"],
    male_70s: s.male.generations_count["70s"],
    male_80s: s.male.generations_count["80s"],
    male_90s: s.male.generations_count["90s"],
    male_100s: s.male.generations_count["100s"],
    male_unknown: s.male.generations_count["unknown"],
    female_count: s.female.count,
    female_00s: s.female.generations_count["00s"],
    female_10s: s.female.generations_count["10s"],
    female_20s: s.female.generations_count["20s"],
    female_30s: s.female.generations_count["30s"],
    female_40s: s.female.generations_count["40s"],
    female_50s: s.female.generations_count["50s"],
    female_60s: s.female.generations_count["60s"],
    female_70s: s.female.generations_count["70s"],
    female_80s: s.female.generations_count["80s"],
    female_90s: s.female.generations_count["90s"],
    female_100s: s.female.generations_count["100s"],
    female_unknown: s.female.generations_count["unknown"],
    unknown_gender_count: s.unkown_gender.count,
    unknown_gender_00s: s.unkown_gender.generations_count["00s"],
    unknown_gender_10s: s.unkown_gender.generations_count["10s"],
    unknown_gender_20s: s.unkown_gender.generations_count["20s"],
    unknown_gender_30s: s.unkown_gender.generations_count["30s"],
    unknown_gender_40s: s.unkown_gender.generations_count["40s"],
    unknown_gender_50s: s.unkown_gender.generations_count["50s"],
    unknown_gender_60s: s.unkown_gender.generations_count["60s"],
    unknown_gender_70s: s.unkown_gender.generations_count["70s"],
    unknown_gender_80s: s.unkown_gender.generations_count["80s"],
    unknown_gender_90s: s.unkown_gender.generations_count["90s"],
    unknown_gender_100s: s.unkown_gender.generations_count["100s"],
    unknown_gender_unknown: s.unkown_gender.generations_count["unknown"],
  };
  console.log("statisticsData :>> ", statisticData);

  convertStatisticsData.push(statisticData);
});
prefectures.data.forEach((p) => {
  const prefectureData = {
    id: p.id,
    name_ja: p.name_ja,
    cases: p.cases,
    cases_date: p.last_updated.cases_date,
    deaths: p.deaths,
    deaths_date: p.last_updated.deaths_date,
    pcr_date: p.pcr_date,
    pcr_date: p.last_updated.pcr_date,
    hospitalize_date: p.hospitalize_date,
    hospitalize_date: p.last_updated.hospitalize_date,
    severe_date: p.severe_date,
    severe_date: p.last_updated.severe_date,
    discharge_date: p.discharge_date,
    discharge_date: p.last_updated.discharge_date,
    symptom_confirming_date: p.symptom_confirming_date,
    symptom_confirming_date: p.last_updated.symptom_confirming_date,
  };
  convertedPrefectureData.push(prefectureData);
  convertedPrefectures.push({
    id: p.id,
    name_ja: p.name_ja,
    name_en: p.name_en,
    lat: p.lat,
    lng: p.lng,
    population: p.population,
  });
});

fs.writeFile(
  "./data/convertStatisticsData.js",
  JSON.stringify(convertStatisticsData),
  (err) => {
    if (err) throw err;

    // success case, the file was saved
    console.log("convertStatisticsData saved!");
  }
);

fs.writeFile(
  "./data/convertPrefecturesData.js",
  JSON.stringify(convertedPrefectureData),
  (err) => {
    if (err) throw err;

    // success case, the file was saved
    console.log("convertedPrefectureData saved!");
  }
);

fs.writeFile(
  "./data/convertPrefectures.js",
  JSON.stringify(convertedPrefectures),
  (err) => {
    if (err) throw err;

    // success case, the file was saved
    console.log("convertedPrefectures saved!");
  }
);
