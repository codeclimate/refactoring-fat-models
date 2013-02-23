class Order < ActiveRecord::Base
  # ...
  attr_accessor :placed_online

  after_create :email_receipt, if: :placed_online

private

  def email_receipt
    OrdersMailer.receipt(self).deliver
  end
end
