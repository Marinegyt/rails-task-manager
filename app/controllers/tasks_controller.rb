class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path(@task)
  end

  def edit

  end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path, status: :see_other
  end

  def show

  end

  private

  def set_task
    # Cette méthode privée me permet de refactoriser en ne répétant pas la même ligne dans plusieurs méthodes
    @task = Task.find(params[:id])
  end

  def task_params
    # Cette méthode gère les STRONG PARAMS => elle autorise sur le model restaurant l'accès aux params name, address et ratings
    params.require(:task).permit(:title, :details, :completed)
  end

end
