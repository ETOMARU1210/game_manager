class ProductsController < ApplicationController

    def show
        @task = Task.new
        @post = Post.new
    end
end
