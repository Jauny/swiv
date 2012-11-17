# require 'tvdb'

class Show < ActiveRecord::Base
  attr_accessible :name, :plot

  has_many :seasons
  has_and_belongs_to_many :users

  def self.from_tvdb(tvdb_series_id)
    TVDB.build_all!(tvdb_series_id)
  end

end
