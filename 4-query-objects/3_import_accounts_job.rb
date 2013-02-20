class ImportAccountsJob < Job
  def run
    ImportableAccountsQuery.new.find_each do |account|
      AccountImporter.new(account).run
    end
  end
end
