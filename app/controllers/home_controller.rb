class HomeController < ApplicationController
  def top
    @q = Item.ransack(params[:q])
    @items = @q.result.includes(:user).order('created_at DESC').first(8)
  end
end
