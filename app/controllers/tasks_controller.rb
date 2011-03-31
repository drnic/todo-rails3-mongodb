class TasksController < ApplicationController

  respond_to :html, :js

  before_filter :authenticate_user!

  def update
    @list = List.find(params[:id])
    task = @list.tasks.find(params[:task_id])
    task.update_attributes(:completed => !task.completed?)
    respond_with(current_user, @list)
  end

end
