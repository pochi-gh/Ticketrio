class CreateArtistConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_concerts do |t|
      t.references :artist, foreign_key: true
      t.references :live, foreign_key: true
      t.timestamps
    end
  end
end
