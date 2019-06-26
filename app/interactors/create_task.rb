class CreateTask
  include Interactor

  def call 
    task = Task.new(context.params)
    task.user = context.user
    if task.save
      context.task = task
    else
      context.fail!(message: "create_task.failure")
    end
  end
end