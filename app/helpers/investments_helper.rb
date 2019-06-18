module InvestmentsHelper
  def current_val(investment)
    amount = investment.current_value.to_f.round(2)
  end
end
