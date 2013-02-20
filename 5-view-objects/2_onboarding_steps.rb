class OnboardingSteps
  def initialize(user)
    @user = user
  end

  def message
    if !@user.confirmed_email?
      "Make sure to confirm your email address."
    elsif !@user.sent_invites?
      "Be sure to add your friends!"
    end
  end

  def progress_percent
    score = 0
    score += 1 if @user.confirmed_email?
    score += 1 if @user.sent_invites?
    (score / 2.0 * 100)
  end
end
