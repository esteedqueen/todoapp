class TasksController < ApplicationController
  def index
    @uncompleted_tasks = Task.uncompleted
    @completed_tasks = Task.completed
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

  def complete
    @task = Task.find(params[:id])
    @task.status = 'completed'
    if @task.save
      redirect_to root_path, notice: 'Task completed'
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :status)
  end
end
