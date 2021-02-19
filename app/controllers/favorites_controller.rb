class FavoritesController < ApplicationController
    
    def create
    @favorite = current_user.favorites.create(car_id: params[:car_id])
    redirect_back(fallback_location: root_path)
    end
    
    def destroy
    @car = Car.find(params[:car_id])
    @favorite = current_user.favorites.find_by(car_id: @car.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
    
    end
end