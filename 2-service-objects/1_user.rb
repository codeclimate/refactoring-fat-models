class User < ActiveRecord::Base
  # ...

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(password_digest) == unencrypted_password
      self
    else
      false
    end
  end
end
