# require_relative '../models/user.rb'
class Helpers
  def self.current_user(sess_h)
    User.find(sess_h[:user_id])
  end

  def self.is_logged_in? sess_h
    !!sess_h[:user_id]
  end
end