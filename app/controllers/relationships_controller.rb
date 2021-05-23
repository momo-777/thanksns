class RelationshipsController < ApplicationController
    before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to users_path
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      
    end
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end
end