class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :chef]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  def chef
    @chef_name = @restaurant.chef_name
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating, :chef_name)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
