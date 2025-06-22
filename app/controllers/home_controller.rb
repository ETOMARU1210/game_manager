class HomeController < ApplicationController
    def index
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
