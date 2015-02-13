class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.text :description
      t.text :place
      t.integer :registration_number
      t.string :user_name

      t.timestamps null: false
    end
  end
end
