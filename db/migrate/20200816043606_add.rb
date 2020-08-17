class Add < ActiveRecord::Migration[5.2]
  def change
    add_index :artists, :artist_name, :unique => true
  end
end
