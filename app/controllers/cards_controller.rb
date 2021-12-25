class CardsController < ApplicationController
  before_action :set_user
  before_action :user_auth
  
  def new

  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:card_token]
    )
    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )
    render :new unless card.valid?
    card.save
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def user_auth
    redirect_to root_path unless @user.id == current_user.id
  end
end
