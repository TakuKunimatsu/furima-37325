class ItemsController < ApplicationController

   def index
      @items = Item.all
   end

   def new
      @item = Item.new
   end

   def create
      @item = Item.create(item_params)
   end

   private

   def item_params
      params.require(:item).permit(:name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_id, :price, :image).merge(user_id: current_user.id)
   end
   
end

