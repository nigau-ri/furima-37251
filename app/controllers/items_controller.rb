class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save && @item.image.attached?
      redirect_to root_path
    else
      unless @item.image.attached?
        @item.errors.add(:image, "can't be blank")
      end
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end
end
