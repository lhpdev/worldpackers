class ToggleTask
  include Interactor
  include SetNotice

  def call
    task = context.task
    prev_task_status = task.status

    if task.doing?
      task.completed!
      event = Event.new(event_type: 'Congratulations', 
                                    content: {
                                      color: set_color,
                                      message: set_message(task)
                                    })
      event.task = task
    elsif task.completed?
      task.doing!
      event = Event.new(event_type: 'Congratulations', 
                                    content: {
                                      color: set_color,
                                      message: set_message(task)
                                    })
      event.task = task
    end

    if event.save && (task.status != prev_task_status)
      context.event = event
      context.color = event.content["color"]
      context.message = event.content["message"]
    else
      context.fail!(message: "toggle_task.failure")
    end
  end
end