class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = current_user.tweets.create(tweet_params)
    if tweet.errors.any?
      render json: tweet.errors, status: :unprocessable_entity
    else
      render json: tweet, status: :created
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
