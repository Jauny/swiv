class AddBannersToShow < ActiveRecord::Migration
  def change
    add_column :shows, :banner, :string
  end
end
