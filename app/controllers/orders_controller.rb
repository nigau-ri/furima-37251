class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :card_registration?

  def index
    if @item.user.id == current_user.id
      redirect_root
    else
      redirect_root if Order.exists?(item_id: @item.id)
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.order_save
      redirect_root
    else
      render :index
    end
  end 

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      customer: order_params[:token],
      currency: 'jpy'
    )
  end

  def card_registration?
    redirect_to new_user_card_path(current_user) unless current_user.cards.present?
  end
end
