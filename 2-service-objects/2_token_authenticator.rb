class TokenAuthenticator
  def initialize(user)
    @user = user
  end

  def authenticate(provided_token)
    return false if !@user || !@user.api_token?
    secure_compare(@user.api_token, provided_token)
  end

private

  def secure_compare(a, b)
    return false unless a.bytesize == b.bytesize
    l = a.unpack "C#{a.bytesize}"
    res = 0
    b.each_byte { |byte| res |= byte ^ l.shift }
    res == 0
  end
end
