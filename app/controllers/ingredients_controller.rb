class IngredientsController < ApplicationController

    #GET - Index => /ingredients
    def index
        @ingredients = Ingredient.all
    end

    #GET - New (render form) => /ingredients/new
    def new
        @ingredient = Ingredient.new
    end

    #POST - Create => /ingredients
    def create
        @ingredient = Ingredient.new
        @ingredient.name = params[:name]
        @ingredient.save
        redirect_to ingredient_path(@ingredient)
    end

    #GET - Edit (render form) => /ingredients/:id/edit
    def edit
    end

    #PATCH - Update => /ingredients/:id
    def update
    end

    #GET - Read/Show => /ingredients/:id
    def show
        @ingredient = Ingredient.find(params[:id])
        @tea_list = Tea.with_ingredient(@ingredient.name)
    end

    #DELETE - Destroy => /ingredients/:id
    def destroy
    end
    
end