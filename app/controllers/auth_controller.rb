class AuthController < ApplicationController
  allow_unauthenticated_access only: %i[email_sign_in email_sign_up provider_callback]

  def email_sign_in
    user_authentication = UserAuthentication.find_by(provider: "email", external_id: params[:email])

    if user_authentication&.user&.authenticate(params[:password])
      start_new_session_for(user_authentication)
    else
      flash[:alert] = "Wrong email or password."

      redirect_to join_path
    end
  end

  def email_sign_up
    user_authentication = nil

    ApplicationRecord.transaction do
      user = User.create!(password: params[:password])
      user_authentication = user.user_authentications.create!(provider: "email", external_id: params[:email])
    end

    start_new_session_for(user_authentication)
  rescue
    flash[:alert] = "Something went wrong."

    redirect_to join_path
  end

  def provider_callback
    auth = request.env["omniauth.auth"]
    provider = auth.provider
    external_id = auth.uid

    user_authentication = UserAuthentication.find_by(provider:, external_id:)

    if user_authentication
      start_new_session_for(user_authentication)
    else
      ApplicationRecord.transaction do
        user = User.create!
        user_authentication = user.user_authentications.create!(provider:, external_id:)

        start_new_session_for(user_authentication)
      end
    end
  end

  def logout
    terminate_session
  end
end
