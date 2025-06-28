class ProjectsController < ApplicationController
    before_action :move_to_signed_in, only: [:create, :destroy]
    before_action :project_params, only: [:create, :destroy]

    def create
        @project = current_user.projects.build(project_params)
        if @project.save
            redirect_to root_path
        else
            render "layouts/home"
        end
    end

    def destroy
        @project = current_user.projects.find(params[:id])
        if @project.destroy
            flash[:notice] = 'プロジェクトを削除しました。'
            redirect_to root_path
        else
            flash[:alert] = 'プロジェクトの削除に失敗しました。'
            redirect_to root_path
        end
    end

    def project_params
        params.require(:project).permit(:name, :description)
    end

    private
    def move_to_signed_in
      unless user_signed_in?
        #サインインしていないユーザーはログインページが表示される
        redirect_to  '/users/sign_in'
      end
    end
end
