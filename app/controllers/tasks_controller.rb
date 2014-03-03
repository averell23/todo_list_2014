class TasksController < ApplicationController
# class TasksController extends ApplicationController

  # public Object index() { return render("something"); }
  def index
    render text: "Hello World"
  end

end
