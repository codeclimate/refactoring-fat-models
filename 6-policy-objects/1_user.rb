class User < ActiveRecord::Base
  # ...

  def deliver_notification?(notification_type, project = nil)
    !hard_bounce? &&
    receive_notification_type?(notification_type) &&
    (!project || receives_notifications_for?(project))
  end

end
