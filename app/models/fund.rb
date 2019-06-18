class Fund < ApplicationRecord
  has_many :fund_details

  def self.scheme_name_id_map
    Fund.select(:scheme_name, :id).inject({}) do |acc, rec|
      acc[rec.scheme_name] = rec.id
      acc
    end
  end
end
