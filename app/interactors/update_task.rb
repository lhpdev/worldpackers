class UpdateTask
  include Interactor

  def call 
    task = context.task
    params = context.params
    if task.update(params)
      context.task = task
    else
      context.fail!(message: "update_task.failure")
    end
  end
end