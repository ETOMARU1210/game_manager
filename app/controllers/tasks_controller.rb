class TasksController < ApplicationController
    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path, notice: 'Task was successfully created.'
        else
            render :new
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path, notice: 'Task was successfully deleted.'
    end

    def task_params
      params.require(:task).permit(:title, :description, :waiting, :completed)
    end
end
