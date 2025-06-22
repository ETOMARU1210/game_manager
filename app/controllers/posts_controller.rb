class PostsController < ApplicationController
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
end
