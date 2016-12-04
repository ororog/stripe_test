# checkout controller
class CheckoutController < ApplicationController
  def new
    @amount = 500
  end

  def success
  end

  def create
    customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken])

    Stripe::Charge.create(
        customer: customer.id,
        amount: params[:amount],
        description: 'Checkout Sample',
        currency: 'jpy')

    redirect_to :action => 'success'
  end
end
