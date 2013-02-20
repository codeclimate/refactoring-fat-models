class User < ActiveRecord::Base
  # ...

  def onboarding_message
    if !confirmed_email?
      "Make sure to confirm your email address."
    elsif !sent_invites?
      "Be sure to add your friends!"
    end
  end

  def onboarding_progress_percent
    score = 0
    score += 1 if @user.confirmed_email?
    score += 1 if @user.sent_invites?
    (score / 2.0 * 100)
  end

end
