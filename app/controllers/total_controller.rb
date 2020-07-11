class TotalController < ApplicationController
    def index
        @totals = Total.all
    end
    def new
    end
    def show
        @total = Total.find(params[:id])
    end
    def create
        @total = Total.new(params[:total])
        @total.save
        redirect_to @total
    end
end
