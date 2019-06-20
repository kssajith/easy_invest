class Investment < ApplicationRecord
  belongs_to :fund

  def self.total_return(investments)
    investments.inject(0.0) do |sum, investment|
      sum += investment.current_value.to_f
      sum.round(2)
    end
  end

  def current_value

    nav_on_investing = FundDetail.get_nav(self.fund_id, self.date_of_investing)
    latest_nav = FundDetail.latest_nav(self.fund_id)
    return nil unless (nav_on_investing && latest_nav)

    number_of_units = self.amount / nav_on_investing
    (number_of_units * latest_nav).to_f
  end
end
