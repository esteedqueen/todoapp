class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.status = 'uncompleted'
    if @task.save
      redirect_to root_path, notice: 'Task created'
    else
      redirect_to root_path,
                  alert: "Task is invalid. #{@task.errors.full_messages.first}"
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :status)
  end
end
