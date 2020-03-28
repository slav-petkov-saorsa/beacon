class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @user = User.omniauth(auth_hash)
    session[:user_id] = @user.id
    redirect_to request.env['omniauth.origin'] || root_path,
                notice: 'Signed in!'
  end

  def new
    redirect_to '/auth/onetime'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end