class StatisticController < ApplicationController
    def index
        # convert to dataset for chart.js
        # Shold be all
        @allPrefectureStatistic = Statistic.all
    end

    def create
        @statistic = Statistic.new(params[:statistic])
        @statistic.save
        redirect_to @statistic
    end
end
