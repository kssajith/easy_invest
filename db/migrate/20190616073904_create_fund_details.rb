class CreateFundDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :fund_details do |t|
      t.integer :fund_id
      t.float :nav
      t.date :date

      t.timestamps
    end
  end
end
