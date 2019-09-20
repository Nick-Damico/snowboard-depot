class OrderMailerPreview < ActionMailer::Preview
  def received
    order = Order.includes(:line_items).where.not(line_items: { id: nil }).last
    OrderMailer.received(order)
  end
  # def shipped(order)
  #   @order = order
  #
  #   mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  # end
end
