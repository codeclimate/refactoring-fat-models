class Account < ActiveRecord::Base
  # ...

  def self.importable_accounts
    where(enabled: true).
      where("failed_attempts_count <= 3").
      joins("LEFT JOIN import_attempts ON account_id = accounts.id").
      order('last_attempt_at ASC').
      preload(:credentials)
  end

  def self.import_failed_accounts
    where("failed_attempts_count >= 3")
      joins("LEFT JOIN import_attempts ON account_id = accounts.id")
      order('failed_attempts_count DESC').
      preload(:credentials)
  end
end
