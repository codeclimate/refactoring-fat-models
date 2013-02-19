class User < ActiveRecord::Base
  # ...

  def active?
    email_confirmed? &&
    last_login_at > 14.days.ago
  end
end
