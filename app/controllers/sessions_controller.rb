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
    respond_to do |format|
      if user 
        session[:user_id] = user.id
        format.json { render json: user, status: :ok }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
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


