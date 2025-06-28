class PostsController < ApplicationController
  before_action :move_to_signed_in, only: [:create, :destroy]

  def create
    @project = current_user.projects.find(params[:project_id])
    @post = @project.posts.build(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = 'コメントを投稿しました。'
      redirect_to product_path(@project)
    else
      render template: "products/show"
    end
  end

  def destroy
    @project = current_user.projects.find(params[:project_id])
    @post = @project.posts.find(params[:id])
    @post.destroy
    flash[:notice] = 'コメントを削除しました。'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:comment)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
