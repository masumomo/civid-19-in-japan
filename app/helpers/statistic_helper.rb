module StatisticHelper
    def current_prefecture_statistic
        if user_signed_in?
            @current_prefecture_statistic = Statistic.find_by(name_ja: current_user.prefecture)
        else
            @current_prefecture_statistic = Statistic.find_by(name_ja: "東京")
        end
    end
end
