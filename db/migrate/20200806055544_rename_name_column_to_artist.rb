class RenameNameColumnToArtist < ActiveRecord::Migration[5.2]
  def change
    rename_column :artists, :name, :artist_name
  end
end
