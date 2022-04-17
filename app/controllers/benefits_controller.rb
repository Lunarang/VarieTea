class BenefitsController < ApplicationController

    #GET - Index => /benefits
    def index
        @benefits = Benefit.all
    end

    #GET - New (render form) => /benefits/new
    def new
        @benefit = Benefit.new
    end

    #POST - Create => /benefits
    def create
        @benefit = Benefit.new
        @benefit.name = params[:name]
        @benefit.save
        redirect_to benefit_path(@benefit)
    end

    #GET - Edit (render form) => /benefits/:id/edit
    def edit
    end

    #PATCH - Update => /benefits/:id
    def update
    end

    #GET - Read/Show => /benefits/:id
    def show
        @benefit = Benefit.find(params[:id])
        @tea_list = Tea.with_benefit(@benefit.name)
    end

    #DELETE - Destroy => /benefits/:id
    def destroy
    end

end