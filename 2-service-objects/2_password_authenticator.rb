class PasswordAuthenticator
  def initialize(user)
    @user = user
  end

  def authenticate(unencrypted_password)
    @user && bcrypt_password == unencrypted_password
  end

private

  def bcrypt_password
    BCrypt::Password.new(@user.password_digest)
  end
end
