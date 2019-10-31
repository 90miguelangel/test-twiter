class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def feed
    sorting = params[:sorting] == 'ASC' ? 'ASC' : 'DESC'
    following_ids = current_user.following.pluck(:user_id)
    render json: Tweet.where(user_id: following_ids)
      .order("created_at #{sorting}")
  end

  def followers
    render json: User.find(params[:user_id]).followers.map{ |f| f.follower }
  end

  def following
    render json: User.find(params[:user_id]).following.map{ |f| f.user }
  end

  def tweets
    render json: User.find(params[:user_id]).tweets
  end
end
