class AddIndexToFundDetailsOnFundId < ActiveRecord::Migration[5.2]
  def change
    add_index :fund_details, :fund_id
  end
end
