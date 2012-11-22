require 'tvdb'
class Show < ActiveRecord::Base
  attr_accessible :name, :plot, :image, :banner, :tvdbid

  validates :name, presence: true
  validates :tvdbid, presence: true 

  has_many :seasons
  has_and_belongs_to_many :users

  def self.from_tvdb(tvdb_id)
    TVDB.build_all!(tvdb_id)
  end

  def episodes
    self.seasons.map do |season|
      season.episodes
    end.flatten
  end

end
