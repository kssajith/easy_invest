class CreateFundHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :fund_houses do |t|
      t.string :name

      t.timestamps
    end
  end
end
