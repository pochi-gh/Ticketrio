class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :live, foreign_key: true
      t.string :seat, null: false
      t.integer :piece, null: false
      t.references :user, foreign_key: true
      t.text :text, null: false
      t.timestamps
    end
  end
end
