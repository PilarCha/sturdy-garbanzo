class FriendsController < ApplicationController
  def friend_request
    @user=User.find(session[:id])
    @request=User.find(params[:id])
    @user.friend_request(@request)
    redirect_to '/all'
  end

  def accept
    @user=User.find(session[:id])
    @request=User.find(params[:id])
    @user.accept_request(@request)
    redirect_to :back
  end
  def ignore
    @user=User.find(session[:id])
    @request=User.find(params[:id])
    @user.decline_request(@request)
    redirect_to :back
  end
end
