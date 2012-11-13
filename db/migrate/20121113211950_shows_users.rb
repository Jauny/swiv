class ShowsUsers < ActiveRecord::Migration
  def up
    create_table 'shows_users', :id => false do |t|
      t.column :show_id, :integer
      t.column :user_id, :integer
    end
  end

  def down
    drop_table 'shows_users'
  end
end
