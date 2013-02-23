class OrderEmailNotifier
  def initialize(order)
    @order = order
  end

  def save
    @order.save &&
    OrdersMailer.receipt(@order).deliver
  end
end
