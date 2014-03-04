module TasksHelper

  def css_class_for_task(task)
    if task.done?
      'completed-task list-group-item'
    else
      'list-group-item'
    end
  end

end
