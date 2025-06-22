class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  # サインアップ時に許可する追加パラメータを設定
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # アカウント更新時に許可する追加パラメータを設定
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # サインアップ後のリダイレクト先
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # アクティベート待ちアカウントのサインアップ後リダイレクト先
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end