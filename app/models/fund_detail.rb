class FundDetail < ApplicationRecord
  belongs_to :fund

  class << self
    def get_nav(fund_id, date)
      self.where(fund_id: fund_id)
          .where("date < ?", date)
          .order(:date).last.try(:nav)
    end

    def latest_nav(fund_id)
      get_nav(fund_id, 1.day.ago.to_date)
    end
  end
end
