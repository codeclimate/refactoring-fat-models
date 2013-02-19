class NotifyAbandonedTrials < Job
  def run
    AbandonedTrialQuery.new.find_each do |account|
      account.send_offer_for_support
    end
  end
end
