class DeleteTask
  include Interactor

  def call 
    task = context.task
    task.destroy
    if task.destroyed?
      context.success!
    else
      context.fail!(message: "update_task.failure")
    end
  end
end