class CreateShowsusers < ActiveRecord::Migration
  def change
    create_table :showsusers do |t|
      t.integer :show_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
