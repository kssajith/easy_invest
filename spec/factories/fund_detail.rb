FactoryBot.define do
  factory :fund_detail do
    nav { 10.2941 }
    date { "2015-04-01".to_date }
    fund
  end

  factory :newer_fund_detail, parent: :fund_detail do
    date { "2019-04-01".to_date }
    association :fund, factory: :newer_fund
  end
end
