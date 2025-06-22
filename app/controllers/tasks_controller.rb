class TasksController < ApplicationController

    before_action :move_to_signed_in, only: [:create, :destroy]
    before_action :task_params, only: [:create, :destroy]

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            flash[:notice] = 'タスクを作成いたしました。'
            redirect_to root_path
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
      params.require(:task).permit(:title, :description)
    end

    private
    def move_to_signed_in
      unless user_signed_in?
        #サインインしていないユーザーはログインページが表示される
        redirect_to  '/users/sign_in'
      end
    end
end
