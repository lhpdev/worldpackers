class Task < ApplicationRecord
  enum status: { ongoing: 0, completed: 1 }

  validates_presence_of :description
end
