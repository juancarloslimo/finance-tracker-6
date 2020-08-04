class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = "Ticker '#{params[:stock]}' doesn't exist. Please enter a valid symbol to search."
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search."
      redirect_to my_portfolio_path
    end
  end
end