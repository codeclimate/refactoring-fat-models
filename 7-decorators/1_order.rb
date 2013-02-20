class Order < ActiveRecord::Base
  # ...
  attr_accessor :placed_online

  after_create :notify_warehouse
  after_create :email_receipt, if: :placed_online
  after_create :post_to_facebook, if: :send_to_facebook?

private

  def notify_warehouse
    WarehouseApi.notify(sku, quanity)
  end

  def email_receipt
    OrdersMailer.receipt(self).deliver
  end

  def send_to_facebook?
    placed_online && customer.facebook_enabled?
  end

  def post_to_facebook
    FacebookApi.post_to_wall("I just bought #{product_name} from MyStoreCo!")
  end
end
