class Task < ApplicationRecord
  belongs_to :user
  
  enum status: { ongoing: 0, completed: 1 }

  validates_presence_of :description
end
