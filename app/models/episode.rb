class Episode < ActiveRecord::Base
  attr_accessible :air_date, :name, :number, :plot, :season_id

  belongs_to :show
end
