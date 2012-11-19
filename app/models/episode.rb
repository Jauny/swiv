class Episode < ActiveRecord::Base
  attr_accessible :air_date, :name, :number, :plot, :season_id, :tvdbid

  belongs_to :season
  has_and_belongs_to_many :users

  def seen?(user)
    user.episodes.include?(self)
  end

  def mark_seen(user)
    user.episodes << self
  end
end
