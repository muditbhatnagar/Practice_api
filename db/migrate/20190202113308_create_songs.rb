class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :upload_song
      t.integer :user_id

      t.timestamps
    end
  end
end
