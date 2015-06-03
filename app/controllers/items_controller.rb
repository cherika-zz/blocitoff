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

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Your item was marked complete."
    else
      flash[:notice] = "There was an error. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # def expire
  #   call_rake :delete_items
  #   redirect_to current_user
  # end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
