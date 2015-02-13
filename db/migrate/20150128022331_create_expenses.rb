class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :amount
      t.text :purpose
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
