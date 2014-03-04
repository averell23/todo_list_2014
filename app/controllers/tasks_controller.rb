class TasksController < ApplicationController
# class TasksController extends ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task, only: [:show, :edit, :update, :destroy]

  # public Object index() { return render("something"); }
  def index
    @tasks = Task.where(user_id: current_user.id)
    if params[:show] == 'pending'
      @tasks = @tasks.where(done: nil)
    end
    @tasks = @tasks.limit 10
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(params.require(:task).permit(:title, :notes))
    if @task.save
      flash.notice = "New task created"
      redirect_to tasks_url
    else
      flash.now.notice = @task.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @task.update_attributes(params.require(:task).permit(:title, :notes, :done))
      redirect_to @task
    else
      flash.now.notice = @task.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @task.destroy!
    flash.notice = "Task deleted"
    redirect_to tasks_url
  end

  private

  def find_task
    @task = Task.where(user_id: current_user.id).find params[:id]
  rescue ActiveRecord::RecordNotFound
    flash.notice = "This record does not exist"
    redirect_to tasks_url
  end

end
