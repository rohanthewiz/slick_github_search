class SessionsController < ApplicationController

  def create
    begin  # begin is required!
      user = User.from_omniauth(request.env['omniauth.auth'].deep_symbolize_keys)
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name}!"
      redirect_to :pages_search
    rescue StandardError => e
      flash[:warning] = "There was error trying to authenticate you...#{e}"
      redirect_to :pages_home
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
