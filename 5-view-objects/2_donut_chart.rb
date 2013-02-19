class DonutChart
  def initialize(snapshot)
    @snapshot = snapshot
  end

  def cache_key
    @snapshot.id.to_s
  end

  def data
    # pull data from @snapshot and turn it into a JSON structure
  end
end
