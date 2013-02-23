old_accounts = Account.where("created_at < ?", 1.month.ago)
ImportableAccountsQuery.new(old_accounts)
