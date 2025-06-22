class PostsController < ApplicationController
    before_action :move_to_signed_in, only: [:create, :destroy]
    before_action :post_params, only: [:create, :destroy]

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to tasks_path, notice: 'Task was successfully created.'
        else
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to tasks_path, notice: 'Post was successfully deleted.'
    end

    def post_params
      params.require(:user).permit(:username, :comment)
    end

    private
    def move_to_signed_in
      unless user_signed_in?
        #サインインしていないユーザーはログインページが表示される
        redirect_to  '/users/sign_in'
    end
  end
end
