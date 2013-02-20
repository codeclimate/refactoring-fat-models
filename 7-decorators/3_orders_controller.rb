class OrdersController < ApplicationController
  def create
    @order = build_order

    if @order.save
      redirect_to orders_path, notice: "Your order was placed."
    else
      render "new"
    end
  end

private

  def build_order
    order = Order.new(params[:order])
    order = WarehouseNotifier.new(order)
    order = OrderEmailNotifier.new(order)
    order
  end

end
