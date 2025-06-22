class ProductsController < ApplicationController
    before_action :move_to_signed_in, only: [:show]

    def show
        @task = Task.new
        @post = Post.new
        @posts = current_user.posts.all
        @tasks = Task.all
    end

    def move_to_signed_in
      unless user_signed_in?
        #サインインしていないユーザーはログインページが表示される
        redirect_to  '/users/sign_in'
      end
    end
end
