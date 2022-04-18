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
        @tea = Tea.create(tea_params)
        respond_to do |format|
          if @tea.save
            current_user.teas << @tea
            format.html { redirect_to @tea, notice: "Tea was successfully created."}
            format.json { render :show, status: :created, location: @tea }
          else
            format.html { render :new }
            format.json { render json: @tea.errors.full_messages, status: :unproccessable_entity }
          end
        end
    end

    #GET - Edit (render form) => /teas/:id/edit
    def edit
        @tea = Tea.find(params[:id])
        @benefits = @tea.benefits.build
        @ingredients = @tea.ingredients.build
    end

    #PATCH - Update => /teas/:id
    def update
        @tea = Tea.find(params[:id])
        @tea.update(tea_params)
        respond_to do |format|
            if @tea.save
              format.html { redirect_to @tea, notice: 'Tea was successfully updated.' }
              format.json { render action: 'show', status: :created, location: @tea }
            else
              format.html { render action: 'edit' }
              format.json { render json: @tea.errors, status: :unprocessable_entity }
            end
        end
    end

    #GET - Read/Show => /teas/:id
    def show
        if user_signed_in?
            @tea = Tea.find(params[:id])
        else
            redirect_to teas_path, notice: "You must be signed in to view any tea profiles!"
        end
    end

    #DELETE - Destroy => /teas/:id
    def destroy
        @tea = Tea.find(params[:id])
        @tea.users.clear
        @tea.ingredients.clear
        @tea.benefits.clear
        @tea.destroy
        redirect_to user_teas_path(current_user.id), notice: "Tea successfully deleted!"
    end
    
    private

    def tea_params
        params.require(:tea).permit(:name, :preparation, :user_id, :benefit_ids => [], :benefits_attributes => [:name], :ingredient_ids => [], :ingredients_attributes => [:name])
    end

end