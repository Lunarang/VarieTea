class UsersController < ApplicationController

    #GET - Read/Show => /users/:id
    def show
        @user = current_user
        @total_favs = @user.total_favorites
        @total_created = Tea.created_by(@user.id).count
        @favorites = @user.all_favorites
    end
    
    #GET - Read/Show => /users/:id/teas
    def teas
        @user = current_user
        @teas = Tea.created_by(@user.id)
    end

    #GET - Read/Show => /users/:id/favorites
    def favorites
        @user = current_user
        @favorites = @user.all_favorites
    end

end