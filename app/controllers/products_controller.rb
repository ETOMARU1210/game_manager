class ProductsController < ApplicationController

    def show
        @task = Task.new
        @post = Post.new
        @posts = Post.all
        @tasks = Task.all
    end
end
