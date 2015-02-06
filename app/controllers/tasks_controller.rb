class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @task = Task.new
    @tasks_to_do = Task.where(:email => current_user.email, :done => false).order(:created_at => :desc)
    @tasks_done = Task.where(:email => current_user.email, :done => true).order(:updated_at => :desc)

  end


  def show
    respond_with(@task)
  end

  def new
    @task = Task.new

  end

  def create
    @task = Task.new(task_params)
    if @task.name.empty?
      redirect_to tasks_path, :alert => "Please give a name of your Task!"
    end
    if @task.save
      redirect_to tasks_path, :notice => "Your new Task is added successfully!"
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

      params.require(:task).permit(:name, :done, :email)
    end
end
