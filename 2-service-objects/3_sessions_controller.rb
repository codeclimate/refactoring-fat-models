class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    authenticator = PasswordAuthenticator.new(user)

    if authenticator.authenticate(params[:password])
      self.current_user = user
      redirect_to dashboard_path
    else
      redirect_to login_path, alert: "Login failed."
    end
  end
end
