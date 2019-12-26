class User < ApplicationRecord
  
  has_many :schedules, dependent: :destroy

  validates :name, :email, :password,  {presence: true, uniqueness: true}
  
end
