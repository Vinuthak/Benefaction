class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :name
      t.integer :amount
      t.string :purpose
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
