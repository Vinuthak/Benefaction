class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :place
      t.references :account, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :accounts
  end
end
