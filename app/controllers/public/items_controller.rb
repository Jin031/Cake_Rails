class Public::ItemsController < ApplicationController
 def index
  @items = Item.all.page(params[:page])
 end

 def show
   @item = Item.find(params[:id])
 end

 private

 def item_params
  params.require(:item).permit(:name, :price)
 end
end
