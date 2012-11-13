class Episode < ActiveRecord::Base
  attr_accessible :air_date, :name, :number, :plot, :season_id

  belongs_to :show
  has_and_belongs_to_many :users
end
