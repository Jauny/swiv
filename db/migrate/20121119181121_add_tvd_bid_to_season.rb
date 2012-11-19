class AddTvdBidToSeason < ActiveRecord::Migration
  def change
    add_column :seasons, :tvdbid, :integer
  end
end
