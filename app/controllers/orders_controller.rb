class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end
  def new
  @order = Order.new
  end

  def create
    #session[:cart] = [{id: 3, quantity: 10}, ...]
    @order = Order.new(order_params)
    session[:cart].each do |item|
      @order_meal = OrderMeal.create(meal_id: item["id"],quantity: item["quantity"], order_id: @order)
      @order_meal.save
    end 
    if @order.save
      redirect_to orders_path method: :get
    else
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(meal_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
end

  private 

  def order_params
    params.permit(:price, :user_id)
  end

  def order_meal_params
    params.require(:order_meal).permit(:quantity, :order_id, :meal_id)
  end
end
