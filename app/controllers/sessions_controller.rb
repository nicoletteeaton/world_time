class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    elsif user
      flash[:error] = 'Your Username and Password did not match.'
      redirect_to '/login'
    else
      redirect_to '/signup'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
