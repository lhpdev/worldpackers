class Event < ApplicationRecord
  belongs_to :task

  enum event_type: { congratulation: 0, shame: 1 }

  validates_presence_of :event_type, :content
end
