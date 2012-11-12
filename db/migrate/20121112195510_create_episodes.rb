class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :number
      t.string :name
      t.text :plot
      t.integer :season_id
      t.date :air_date

      t.timestamps
    end
  end
end
