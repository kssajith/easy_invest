class Fund < ApplicationRecord
  has_many :fund_details

  class << self
    def scheme_name_id_map
      self.select(:scheme_name, :id).inject({}) do |acc, rec|
        acc[rec.scheme_name] = rec.id
        acc
      end
    end

    def load_funds_after(date)
      self.joins(:fund_details).where("fund_details.date <= ?", date)
    end
  end
end
