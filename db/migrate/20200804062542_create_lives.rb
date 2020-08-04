class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.string :title, null: false
      t.date :data, null: false
      t.time :time, null: false
      t.integer :prefecture_id, null: false
      t.string :hall, null: false
      t.timestamps
    end
  end
end
