# frozen_string_literal: true

class Search::User
  def self.get_all_users_without_current_user(current_user_id)
    User.where.not(id: current_user_id)
  end

  def self.get_all_user_following_id(current_user, _following_id)
    current_user.following_mapping.pluck(:following_id)
  end
end
