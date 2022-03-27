class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

end
