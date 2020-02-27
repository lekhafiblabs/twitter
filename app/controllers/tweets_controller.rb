# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = Search::User.get_all_users_without_current_user(current_user.id)
    @user_tweets = Search::Tweet.get_wall_tweets_for_current_user(current_user)
  end

  def create
    tweet = current_user.tweets.new(tweet_params)
    flash[:notice] = tweet.save ?
                      MESSAGES['tweet']['success'] :
                      MESSAGES['tweet']['failure']
    redirect_to root_path
  end

  private

  def tweet_params
    params[:tweet].permit(:post)
  end
end
