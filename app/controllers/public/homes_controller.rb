class Public::HomesController < ApplicationController
 def top
  @items = Item.all
  #byebug
 end

 def about
 end
end
