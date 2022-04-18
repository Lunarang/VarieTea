class TastedController < ApplicationController
    before_action :set_tea, only: [:create, :destroy]
  
    def create
      current_user.taste!(@tea)
      redirect_to tea_path(@tea)
    end
  
    def destroy
        current_user.untaste!(@tea)
        redirect_to tea_path(@tea)
    end
  
    private
  
    def set_tea
      @tea = Tea.find(params[:id])
    end
  
  end