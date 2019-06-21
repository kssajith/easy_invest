class Investment < ApplicationRecord
  validates :amount, :date_of_investing, :fund_id, presence: true

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

  def valid_investment_date?
    return false unless(self.date_of_investing && self.fund_id && self.amount)
    first_fund_rec = FundDetail.where(fund_id: self.fund_id).order(:date).first
    self.date_of_investing.to_date >= first_fund_rec.date
  end
end
