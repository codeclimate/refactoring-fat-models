class ImportableAccountsQuery
  def initialize(relation = Account.scoped)
    @relation = relation
  end

  def find_each(&block)
    @relation.
      where(enabled: true).
      where("failed_attempts_count <= 3").
      joins("LEFT OUTER JOIN import_attempts ON account_id = accounts.id").
      order('last_attempt_at ASC').
      preload(:credentials).
      find_each(&block)
  end
end
