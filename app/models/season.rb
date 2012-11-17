class Season < ActiveRecord::Base
  attr_accessible :number, :show_id

  belongs_to :show
  has_many :episodes

  def all_seen?(user)
    self.episodes.count == user.episodes.select {|ep| ep.season == self }.count
  end
end
