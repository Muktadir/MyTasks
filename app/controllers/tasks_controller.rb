class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @task = Task.new
    @tasks_to_do = Task.where(done: false)
    @tasks_done = Task.where(done: true)

  end


  def show
    respond_with(@task)
  end

  def new
    @task = Task.new

  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, :notice => "Your new Task is added successfully!"

    else
      render "new"
    end
  end

  def edit
  end



  def update
    if @task.update_attribute(:done, true)
      redirect_to tasks_path, :notice => "Your task marked as completed!"
    else
      redirect_to tasks_path, :notice => "Your task was unable to marked as completed!"
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_path, :notice => "Your task has been deleted!"
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params

      params.require(:task).permit(:name, :done)
    end
end
