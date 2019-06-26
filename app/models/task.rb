class Task < ApplicationRecord
  belongs_to :user
  has_many :events
  
  enum status: { doing: 0, completed: 1, deleted: 2 }

  validates_presence_of :description
end
