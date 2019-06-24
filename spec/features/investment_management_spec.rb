require 'rails_helper'

RSpec.feature "InvestmnetManagement" do

  before do
    FactoryBot.create(:fund_detail)
  end

  scenario 'User creates a new widget' do
    visit investments_path

    fill_in 'Amount', :with => 10000
    fill_in 'Date of investing', :with => '2017-06-05'
    find('#fund_id_select').select('Axis Multicap Fund - Direct Plan - Dividend')

    click_button 'Create'

    expect(page).to have_text('Investment added successfully!')
  end

  scenario 'User clicks on create button without filling inputs' do
    visit investments_path
    click_button 'Create'

    expect(page).to have_text('Invalid inputs !')
  end

  scenario 'User selects a plan and inputs date lesser than its creation date' do
    FactoryBot.create(:newer_fund_detail)
    visit investments_path

    fill_in 'Amount', :with => 10000
    fill_in 'Date of investing', :with => '2017-06-05'
    find('#fund_id_select').select('Axis Multicap Fund - Direct Plan - Growth')
    click_button 'Create'

    expect(page).to have_text('Scheme does not exists on the selected date')
  end
end
