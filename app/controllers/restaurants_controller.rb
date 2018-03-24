class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

   # POST /restaurants/:id/favorite
  def favorite
    @restaurant = Restaurant.find(params[:id])
    @restaurant.favorites.create!(user: current_user)
    # current_user.favorites.create(restaurant: @restaurant)
    redirect_back(fallback_location: root_path)
  end

  # POST /restaurants/:id/unfavorite
  def unfavorite
    @restaurant = Restaurant.find(params[:id])

    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end


end
