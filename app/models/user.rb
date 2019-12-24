class User < ApplicationRecord
  
  has_many :schedules

  validates :name, :email, :password,  {presence: true, uniqueness: true}
  
end
