class CreateBingos < ActiveRecord::Migration
  def change
    create_table :bingos do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.integer :amount
      t.date :date
      t.account_id :integer

      t.timestamps null: false
    end
  end
end
