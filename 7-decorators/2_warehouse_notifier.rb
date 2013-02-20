class WarehouseNotifier
  def initialize(order)
    @order = order
  end

  def save
    @order.save && WarehouseApi.notify(@order.sku, @order.quanity)
  end
end
