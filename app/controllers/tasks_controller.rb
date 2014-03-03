class TasksController < ApplicationController
# class TasksController extends ApplicationController

  # public Object index() { return render("something"); }
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
  end

end
