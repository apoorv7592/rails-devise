class SessionsController < ApplicationController

  def new
  end

  # def create
  #   binding.pry
  #   auth = request.env["omniauth.auth"]
  #   user = User.where(:provider => auth['provider'],
  #                     :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
  #   reset_session
  #   session[:user_id] = user.id
  #   redirect_to root_url, :notice => 'Signed in!'
  # end

  # def destroy
  #   reset_session
  #   redirect_to root_url, :notice => 'Signed out!'
  # end

  def create
  user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end


def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end
