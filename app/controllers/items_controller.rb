class ItemsController < ApplicationController

  def create
  	@item = Item.new(item_params)
    @item.user = current_user
  	if @item.save
  		flash[:notice] = "Your item was saved."
  		redirect_to current_user
  	else
  		flash[:notice] = "There was an error. Try again."
  		redirect_to current_user
  	end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
