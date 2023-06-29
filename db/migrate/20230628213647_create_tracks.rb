class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :track_name, null: false, default: ""
      t.integer :time, null: false, default: 0
      t.string :track_url, null: false, default: ""
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tracks, :track_name
  end
end
