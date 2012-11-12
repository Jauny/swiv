class Season < ActiveRecord::Base
  attr_accessible :number, :show_id

  belongs_to :show
  has_many :episodes
end
