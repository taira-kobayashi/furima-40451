class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?




  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  protected
  
  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth])
  end
end
