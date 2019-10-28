class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :item
      t.integer :quantity
      t.references :account_owner, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
