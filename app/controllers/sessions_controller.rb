class SessionsController < ApplicationController
  def create
    begin  # begin is required!
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name}!"
      redirect_to :pages_search
        #render json: request.env['omniauth.auth'].to_json
    rescue StandardError => e
      flash[:warning] = "There was error trying to authenticate you...#{e}"
      redirect_to :pages_home #root_path
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
