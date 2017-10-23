class SessionsController < ApplicationController
  skip_before_action :loggin_user, only: [:login]
  def login
    user=User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id]=user.id
      redirect_to "/professional_profile"
    else
      flash[:alert]="Invalid combination"
      redirect_to :back
    end
  end
  def destroy
    reset_session
    flash[:notice]="Successfully logged out!"
    redirect_to "/"
  end
end
