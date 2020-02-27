# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :authenticate_user!

  def follow
    following_id = params[:id]
    if following_id
      if Validation::Follow.check_if_already_following(current_user, following_id)
        message = MESSAGES['follow']['already_following']
      else
        message = if FollowService.follow_user(current_user, following_id)
                    MESSAGES['follow']['success']
                  else
                    MESSAGES['follow']['failure']
                  end
      end
    else
      message = MESSAGES['follow']['failure']
    end
    flash[:notice] = message
    redirect_to root_path
  end

  def unfollow
    unfollowing_id = params[:id]
    message = if unfollowing_id
                if FollowService.unfollow_user(current_user, unfollowing_id)
                  MESSAGES['unfollow']['success']
                else
                  MESSAGES['unfollow']['failure']
                          end
              else
                MESSAGES['unfollow']['failure']
              end
    flash[:notice] = message
    redirect_to root_path
  end
end
