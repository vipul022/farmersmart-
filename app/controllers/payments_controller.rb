class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  def success
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)

    user = User.find(payment.metadata.user_id)
    cart = user.cart
    # destroying the cart after the payment has been made successfully
    cart.destroy

    head 200
  end

  def get_stripe_id
    cart = current_user.cart
    # storing all the listings in cart in listings variable
    listings = cart.listings
    # iterating through listings and storing its's value as an array of hashes in line_items to use that in session_id below
    line_items = listings.map do |listing|
      {
        name: listing.title,
        description: listing.description,
        amount: listing.price * 100,
        currency: "aud",
        quantity: 1,

      }
    end
    # Creating a session for Stripe
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,

      line_items: line_items,
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          cart_id: cart.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&cartId=#{cart.id}",
      cancel_url: "#{root_url}listings"
    ).id
    render :json => { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
    end
end
