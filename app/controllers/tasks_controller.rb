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

  def create
    @task = Task.new(params.require(:task).permit(:title))
    @task.save!
    redirect_to tasks_url
  end

end
