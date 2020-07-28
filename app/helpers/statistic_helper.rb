module StatisticHelper
    def current_prefecture_statistic
        if user_signed_in?
            @current_prefecture_statistic = Statistic.find_by(name: current_user.prefecture)
        else
            @current_prefecture_statistic = Statistic.find_by(name: "Tokyo")
        end
    end

    def statistic_by_gender(statistic)
        @statisticdata = {}
        @statisticdata[:labels] = ["Male","Female", "Unknown"]
        @statisticdata[:datasets] = [{
            label: "Positives",
            data:[
                statistic.male_count,
                statistic.female_count,
                statistic.unknown_gender_count
                ]
            }]
        return @statisticdata
    end

    def statistic_by_age(statistic)
        @statisticdata = {}
        @statisticdata[:labels] = ["00s","10s", "20s","30s","40s", "50s", "60s","70s", "80s","90s","100s"]
        @statisticdata[:datasets] = [{
            label: "Positives",
            data:[
                statistic.male_00s + statistic.female_00s + statistic.unknown_gender_00s,
                statistic.male_10s + statistic.female_10s + statistic.unknown_gender_10s,
                statistic.male_20s + statistic.female_20s + statistic.unknown_gender_20s,
                statistic.male_30s + statistic.female_30s + statistic.unknown_gender_30s,
                statistic.male_40s + statistic.female_40s + statistic.unknown_gender_40s,
                statistic.male_50s + statistic.female_50s + statistic.unknown_gender_50s,
                statistic.male_60s + statistic.female_60s + statistic.unknown_gender_60s,
                statistic.male_70s + statistic.female_70s + statistic.unknown_gender_70s,
                statistic.male_80s + statistic.female_80s + statistic.unknown_gender_80s,
                statistic.male_90s + statistic.female_90s + statistic.unknown_gender_90s,
                statistic.male_100s + statistic.female_100s + statistic.unknown_gender_100s,
                ]
            }]
        return @statisticdata
    end
end
