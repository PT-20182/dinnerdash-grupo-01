class OrderMealsController < ApplicationController
    def create
        @order = Order.find(params[:order_id])
        @order_meal = @order.order_meal.create(order_meal_params)
        redirect_to order_path(@order)
      end
     
      private
        def order_meal_params
          params.require(:order_meal).permit(:quantity, :order_id, :meal_id)
        end
end
