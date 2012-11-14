class Show < ActiveRecord::Base
  attr_accessible :name, :plot

  has_many :seasons
  has_and_belongs_to_many :users

end
