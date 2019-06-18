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
    investment = Investment.new(investment_params)

    if investment.save
      redirect_to investments_path
      flash[:notice] = "Investment added successfully!"
    else
      flash[:error] = "Error in adding investment"
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:amount, :date_of_investing, :fund_id)
  end
end
