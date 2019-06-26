class RemoveTask
  include Interactor

  def call 
    task = context.params
    task.deleted!
    if task.status == 'deleted'
      context.task = task
    else
      context.fail!(message: "remove_task.failure")
    end
  end
end