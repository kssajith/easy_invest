require_relative '../lib/load_nav'

FundHouse.where(name: 'Axis Mutual Fund').first_or_create
LoadNav.new.load_axis_bank_data
