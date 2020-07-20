class StatisticController < ApplicationController
    def index
        # convert to dataset for chart.js
        # Shold be all
        @currentPrefectureYesterdayStatistic = Statistic.find_by(name_ja: "東京")
    end

    def create
        @statistic = Statistic.new(params[:statistic])
        @statistic.save
        redirect_to @statistic
    end
end
