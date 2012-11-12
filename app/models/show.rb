class Show < ActiveRecord::Base
  attr_accessible :name, :plot

  has_many :seasons
  has_many :users
end
