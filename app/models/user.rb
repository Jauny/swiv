class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  validates :name, presence: true

  has_and_belongs_to_many :shows
  has_and_belongs_to_many :episodes

  def all_seen_ep
    self.shows.map do |show| 
      show.episodes.select do |ep|
        ep.seen?(self)
      end
    end.flatten
  end
end
