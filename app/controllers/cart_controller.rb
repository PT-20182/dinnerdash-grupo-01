class CartController < ApplicationController

  def add_item_to_cart
    @id = params[:id]
    @quantity = params[:quantity]
    set_cart.push({id: @id, quantity: @quantity})
    redirect_to root_path
  end
  
  def remove_item_from_cart
    set_cart.delete_at(params[:id])

    redirect_to root_path
  end



private

  def set_cart
    session[:cart] ||= []
  end

end
