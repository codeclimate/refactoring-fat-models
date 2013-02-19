class Account < ActiveRecord::Base
  # ...

  def self.abandoned_trials
    where(plan: nil, invites_count: 0)
  end

end
