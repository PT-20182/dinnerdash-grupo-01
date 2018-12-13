class OrderMealsController < ApplicationController
    def create
        @order = Order.find(params[:order_id])
        @meal = Meal.find(params[:meal_id])
        @order_meal = @table.order_meal.create(order_meal_params)
        redirect_to order_path(@order)
      end


      protected

    def table
        @table ||=
            if params[:order_id]
                Order.find(params[:order_id])
            elsif params[:meal_id]
                Meal.find(params[:meal_id])
            end
    end
     
      private
        def order_meal_params
          params.require(:order_meal).permit(:quantity, :order_id, :meal_id)
        end
end
