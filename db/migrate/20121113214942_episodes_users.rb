class EpisodesUsers < ActiveRecord::Migration
  def up
    create_table 'episodes_users', :id => false do |t|
      t.column :episode_id, :integer
      t.column :user_id, :integer
    end
  end

  def down
    drop_table 'episodes_users'
  end
end
