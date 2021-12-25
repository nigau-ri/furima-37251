class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(current_user.id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end

end
