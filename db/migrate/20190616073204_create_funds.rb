class CreateFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :funds do |t|
      t.string :scheme_name
      t.integer :fund_house_id

      t.timestamps
    end
  end
end
