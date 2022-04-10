class FavoritesController < ApplicationController
    before_action :set_task, only: [:create, :destroy]
  
    def create
      current_user.favorite!(@tea)
      redirect_to tea_path(@tea)
    end
  
    def destroy
        current_user.unfavorite!(@tea)
        redirect_to tea_path(@tea)
    end
  
    private
  
    def set_tea
      @tea = Tea.find(params[:id])
    end
  
  end