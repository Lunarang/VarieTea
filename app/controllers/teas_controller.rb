class TeasController < ApplicationController

    #GET - Tea.newest scope method
    def newest
        @new_teas = Tea.newest.all
    end

    #GET - Index => /teas
    def index
        @teas = Tea.all
    end

    #GET - New (render form) => /teas/new
    def new
        @tea = Tea.new
        @benefits = @tea.benefits.build
        @ingredients = @tea.ingredients.build
    end

    #POST - Create => /teas
    def create
        @tea = Tea.new(tea_params)
        respond_to do |format|
          if @tea.save
            format.html { redirect_to @tea, notice: 'Tea was successfully created.' }
            format.json { render action: 'show', status: :created, location: @tea }
          else
            format.html { render action: 'new' }
            format.json { render json: @tea.errors, status: :unprocessable_entity }
          end
        end
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
    
    private

    def tea_params
        params.require(:tea).permit(:name, :preparation, :benefit_ids => [], :benefits_attributes => [:name], :ingredient_ids => [], :ingredients_attributes => [:name])
    end

end