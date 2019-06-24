FactoryBot.define do
  factory :fund do
    scheme_name { "Axis Multicap Fund - Direct Plan - Dividend" }
    fund_house_id { 1 }
  end

  factory :newer_fund, parent: :fund do
    scheme_name { "Axis Multicap Fund - Direct Plan - Growth" }
  end
end
