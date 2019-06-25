class Event < ApplicationRecord
  belongs_to :task
  
  validates_presence_of :event_type, :content
end
