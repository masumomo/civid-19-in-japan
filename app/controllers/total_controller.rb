class TotalController < ApplicationController
    def index
    end


    def create
        @total = Total.new(params[:total])
        @total.save
        redirect_to @total
    end
end
