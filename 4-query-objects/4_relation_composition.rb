old_accounts = Account.where("created_at < ?", 1.month.ago)
old_importable_accounts = ImportableAccountsQuery.new(old_accounts)
