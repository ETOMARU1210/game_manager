class TasksController < ApplicationController

    before_action :move_to_signed_in, only: [:create, :destroy]
    before_action :task_params, only: [:create, :destroy]

    def new
        @project = current_user.projects.find(params[:project_id])
        @task = @project.tasks.new
    end

    def create
        @project = current_user.projects.find(params[:project_id])
        @task = @project.tasks.build(task_params)
        @tasks = @project.tasks.order(created_at: :asc)
        @post = @project.posts.build
        @posts = @project.posts.order(created_at: :asc)
        if @task.save
            flash[:notice] = 'タスクを作成いたしました。'
            redirect_to product_path(@project)
        else
            render template: "products/show" 
        end
    end

    def destroy
        @task = Task.find(params[:id])
        flash[:notice] = 'タスクを削除しました。'
        @task.destroy
        redirect_to tasks_path
    end

    private

    def task_params
      params.require(:task).permit(:title, :description)
    end

    def move_to_signed_in
      unless user_signed_in?
        redirect_to '/users/sign_in'
      end
    end
end
