class AddTaskToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :task, foreign_key: true
  end
end
