class TasksController < ApplicationController
# class TasksController extends ApplicationController

  # public Object index() { return render("something"); }
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find params[:id]
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :notes))
    if @task.save
      flash.notice = "New task created"
      redirect_to tasks_url
    else
      flash.now.notice = @task.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes!(params.require(:task).permit(:title, :notes, :done))
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy!
    flash.notice = "Task deleted"
    redirect_to tasks_url
  end

end
