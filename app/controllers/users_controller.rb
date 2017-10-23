class UsersController < ApplicationController
  skip_before_action :loggin_user, only: [:create,:index]
  def index
  end
  def create
    user=User.new(user_params)
    if user.save
      flash[:notice]="You have been registered. Please log in"
      redirect_to :back
    else
      flash[:errors]=user.errors.full_messages
      redirect_to :back
    end
  end

  def main
    @user=User.find(session[:id])
    @friends=@user.friends
    @requested=@user.requested_friends

  end

  def show
    @user=User.find(params[:id])
  end

  def all
    @all=User.all
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
    end
end
