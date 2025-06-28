class HomeController < ApplicationController

  def index
    if user_signed_in?
      @projects = current_user.projects.all
      @project = current_user.projects.build
    else
      @projects = []
      @project = Project.new
    end
  end

  # サインアップ後のリダイレクト先
  def after_sign_up_path_for(resource)
    home_path
  end

  # アクティベート待ちアカウントのサインアップ後リダイレクト先
  def after_inactive_sign_up_path_for(resource)
    home_path
  end
end
