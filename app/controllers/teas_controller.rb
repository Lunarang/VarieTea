class TeasController < ApplicationController

    #GET - Index => /teas
    def index
        @teas = Tea.all
    end

    #GET - New (render form) => /teas/new
    def new
        @tea = Tea.new
    end

    #POST - Create => /teas
    def create
        @tea = Tea.new
        @tea.name = params[:name]
        @tea.preparation = params[:preparation]
        @tea.save
        redirect_to tea_path(@tea)
    end

    #GET - Edit (render form) => /teas/:id/edit
    def edit
    end

    #PATCH - Update => /teas/:id
    def update
    end

    #GET - Read/Show => /teas/:id
    def show
        @tea = Tea.find(params[:id])
    end

    #DELETE - Destroy => /teas/:id
    def destroy
    end
    
end