class Season < ActiveRecord::Base
  attr_accessible :number, :show_id

  belongs_to :show
  has_many :episodes

  def all_seen?(user)
    self.episodes.count == user.episodes.select {|ep| ep.season == self }.count
  end

  def mark_all_seen(user)
    episodes.each do |ep|
      ep.mark_seen(user)
    end
  end
end
