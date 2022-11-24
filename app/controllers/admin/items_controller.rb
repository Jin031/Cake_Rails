class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
 def new
  @item = Item.new
 end

 def index
  @items = Item.all.page(params[:page])
 end

 def create
  @item = Item.new(item_params)
  @item.save
  redirect_to admin_item_path
 end

 def show
  @item = Item.find(params[:id])
 end

 def edit
  @item = Item.find(params[:id])
 end

 def update
  @item = Item.find(params[:id])
  @item.update(item_params)
  redirect_to admin_items_path(@item.id)
 end

 private

 def item_params
  params.require(:item).permit(:name,:introduction,:image,:genre_id,:price,:is_active)
 end

end
