class ImportAccountsJob < Job
  def run
    query = ImportableAccountsQuery.new
    query.find_each do |account|
      AccountImporter.new(account).run
    end
  end
end
