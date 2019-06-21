class InvestmentsController < ApplicationController

  def index
    @investments = Investment.includes(fund: :fund_details).all
    # @total = Investment.total_return(@investments)
    @new_investment = Investment.new
  end

  def new
    @investment = Investment.new
  end

  def create
    unless valid_params?
      flash[:error] = "Some parameters are empty!"
      redirect_to investments_path and return
    end

    investment = Investment.new(investment_params)
    date_is_valid = investment.valid_investment_date?

    if  investment.valid? && date_is_valid && investment.save
      flash[:notice] = "Investment added successfully!"
    elsif !date_is_valid
      flash[:error] = "Scheme does not exists on the selected date"
    else
      flash[:error] = "Error in adding investment"
    end

    redirect_to investments_path
  end

  def load_schemes
    date = params[:date]
    @funds = Fund.load_funds_after(date)
  end

  private

  def investment_params
    params.require(:investment).permit(:amount, :date_of_investing, :fund_id)
  end

  def valid_params?
    !investment_params.values.map(&:blank?).include?(true)
  end
end
