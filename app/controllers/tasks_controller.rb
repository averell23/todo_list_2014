class TasksController < ApplicationController
# class TasksController extends ApplicationController

  # public Object index() { return render("something"); }
  def index
    @message = "I am the world"
  end

end
