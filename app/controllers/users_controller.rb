class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
  end

  def index
    
    if params[:search] == nil
      @users = User.all
    elsif params[:search] == ''
      @users = User.all
    else
      #部分検索
      @users = User.where("name LIKE ? ",'%' + params[:search] + '%')
    end
   
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:username, :image) 
  end

end
