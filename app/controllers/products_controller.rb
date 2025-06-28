class ProductsController < ApplicationController
  before_action :move_to_signed_in, only: [:show]

  def show
    @project = current_user.projects.find(params[:id])
    @posts = @project.posts.order(created_at: :asc)
    @task = @project.tasks.build
    @post = @project.posts.build
    @tasks = @project.tasks.order(created_at: :asc)
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
