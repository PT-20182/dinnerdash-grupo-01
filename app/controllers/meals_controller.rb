class MealsController < ApplicationController
  before_action :require_admin
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
      @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to @meal
    else
      render 'new'
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
 
  if @meal.update(meal_params)
    redirect_to @meal
  else
    render 'edit'
  end
  end

  def destroy
      @meal = Meal.find(params[:id])
      @meal.destroy
      redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price, :description, :image, :availability, :category_id)
  end

  def require_admin
    if user_signed_in?
     if current_user.admin
     else
      flash[:danger]=" Somente administradores podem acessar esta página"
      redirect_to root_path
     end
     else
      redirect_to root_path 
    end 
  end


end
