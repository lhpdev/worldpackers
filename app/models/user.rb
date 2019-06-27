class User < ApplicationRecord
  has_many :tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates_presence_of :name, :email, :password

  def first_name
    self.name.split.first
  end
end
