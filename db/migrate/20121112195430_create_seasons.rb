class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :number
      t.integer :show_id

      t.timestamps
    end
  end
end
