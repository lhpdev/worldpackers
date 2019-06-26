class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_status, :remove]
  before_action :set_current_tasks, only: [:index]
  include SetNotice

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
    @task = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @task.doing?
      @task.completed! && set_notice 
      @event = @task.events.create!(event_type: 'Congratulations', 
                                    content: {
                                      color: @color,
                                      message: @message
                                    })
      respond_to do |format|
        flash[:notice] = @message
        format.html { redirect_to tasks_url(color: @color) }
      end 
    elsif @task.completed?
      @task.doing! && set_notice
      @event = @task.events.create!(event_type: 'Shame', 
                                    content: {
                                      color: @color,
                                      message: @message
                                    })
      respond_to do |format|
        flash[:notice] = @message
        format.html { redirect_to tasks_url(color: @color) }
      end
    end
  end

  def remove
    @task.deleted!
    respond_to do |format|
      format.html { redirect_to tasks_url }
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
