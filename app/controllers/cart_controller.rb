class CartController < ApplicationController
  # include ActionView::Helpers::UrlHelper
  require 'time'
  before_action :require_user, only: [:index]

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
    @past_orders_aux = [{id: 10, status: "entregue", data: Time.now, user: "Nicholas", price: 10.02}]
    # @past_order = current_user.orders -> jeito certo
  end

private

  def set_cart
    session[:cart] ||= []
  end

  def require_user
    if current_user.nil?
      redirect_to root_path
    end
  end

end
