class CartController < ApplicationController
  # include ActionView::Helpers::UrlHelper

  
  def add_item_to_cart
    @id = params[:id]
    @quantity = params[:quantity]
    set_cart.push({id: @id, quantity: @quantity})
    redirect_to root_path
  end
  
  def remove_item_from_cart_main
    set_cart.delete_if {|x| x["id"] == params[:id]}

    redirect_to root_path
  end

  def remove_item_from_cart_checkout
    set_cart.delete_if {|x| x["id"] == params[:id]}

    redirect_to cart_path
  end

  def index
    @meals = Meal.all
  end

private

  def set_cart
    session[:cart] ||= []
  end

end
