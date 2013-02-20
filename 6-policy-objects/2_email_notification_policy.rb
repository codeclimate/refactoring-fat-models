class EmailNotificationPolicy

  def initialize(user, notification_type, project = nil)
    @user = user
    @notification_type = notification_type
    @project = project
  end

  def email?
    !@user.hard_bounce? &&
    @user.receive_notification_type?(notification_type) &&
    receives_project_emails?
  end

private

  def receives_project_emails?
    (!@project || @user.receives_notifications_for?(@project))
  end

end
