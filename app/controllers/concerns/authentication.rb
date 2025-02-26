module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
    helper_method :authenticated?
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def authenticated?
    resume_session
  end

  def require_authentication
    resume_session || request_authentication
  end

  def resume_session
    Current.user_authentication ||= find_user_auth
  end

  def find_user_auth
    UserAuthentication.find_by(id: session[:auth_id])
  end

  def request_authentication
    redirect_to join_path
  end

  def start_new_session_for(user_authentication)
    Current.user_authentication = user_authentication
    session[:auth_id] = user_authentication.id
    flash[:sucess] = "Joined Successfully!"

    redirect_to root_url
  end

  def terminate_session
    session[:auth_id] = nil
    flash[:signed_out] = "Signed Out"

    redirect_to join_path
  end
end
