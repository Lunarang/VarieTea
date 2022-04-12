class UsersController < ApplicationController

    #GET - Read/Show => /users/:id
    def show
        @user = current_user
        @total_favs = @user.total_favorites
        @favorites = @user.all_favorites
    end
    
    #GET - Read/Show => /users/:id/teas
    def teas
        @user = current_user
        @teas = @user.all_teas
    end

    #GET - Read/Show => /users/:id/favorites
    def favorites
        @user = current_user
        @favorites = @user.all_favorites
    end

end