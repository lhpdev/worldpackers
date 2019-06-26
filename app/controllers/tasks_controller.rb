class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_status, :remove]
  before_action :set_current_tasks, only: [:index]

  # GET /tasks
  # GET /tasks.json
  def index
    @color = params[:color]
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    result = CreateTask.call(
      params: task_params,
      user: current_user
    )
    if result.success?
      redirect_to tasks_url
    else
      redirect_to tasks_url, notice: "Can't create task with blank description"
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    result = UpdateTask.call(
      params: task_params,
      task: @task
    )
    if result.success?
      redirect_to tasks_url
    else
      redirect_to tasks_url, notice: "Couldn't update the task"
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    result = DeleteTask.call(
      task: @task
    )
    if result.success?
      redirect_to tasks_url
    else
      redirect_to tasks_url, notice: "Couldn't delete the task"
    end
  end

  def toggle_status
    result = ToggleTask.call(
      task: @task
    )
    if result.success?
      flash[:notice] = result.message
      redirect_to tasks_url(color: result.color)
    else
      redirect_to tasks_url, notice: "Couldn't toggle the task"
    end
  end

  def remove
    result = RemoveTask.call(
      params: @task
    )
    if result.success?
      redirect_to tasks_url
    else
      redirect_to tasks_url, notice: "Task couldn't be deleted"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_current_tasks
      @tasks = Task.where(user_id: current_user.id).where.not(status: 2)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description)
    end
end
