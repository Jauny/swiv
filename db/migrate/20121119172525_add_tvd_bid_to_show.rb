class AddTvdBidToShow < ActiveRecord::Migration
  def change
    add_column :shows, :tvdbid, :integer
    add_column :episodes, :tvdbid, :integer
  end
end
