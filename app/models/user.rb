class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :storage_spaces
  has_many :bookings
  has_many :buy_adverts
  has_many :sell_adverts
  after_create :get_username

  def get_username
    self.username = self.email.split("@")[0]
  end
end
