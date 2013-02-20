class PasswordAuthenticator
  def initialize(user)
    @user = user
  end

  def authenticate(unencrypted_password)
    return false unless @user
    BCrypt::Password.new(@user.password_digest) == unencrypted_password
  end
end
