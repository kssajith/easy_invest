class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.integer :user_id
      t.float :amount
      t.datetime :date_of_investing
      t.integer :fund_id
      t.integer :user_id

      t.timestamps
    end
  end
end
