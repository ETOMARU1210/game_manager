class PostsController < ApplicationController
    before_action :move_to_signed_in, only: [:create, :destroy]
    before_action :post_params, only: [:create, :destroy]

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            flash[:notice] = 'コメントを投稿しました。'
            redirect_to root_path
        else
            render "home/index"
        end
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy
        flash[:notice] = 'コメントを削除しました。'
        redirect_to root_path
    end

    def post_params
      params.require(:post).permit(:comment)
    end

    private
    def move_to_signed_in
      unless user_signed_in?
        #サインインしていないユーザーはログインページが表示される
        redirect_to  '/users/sign_in'
    end
  end
end
