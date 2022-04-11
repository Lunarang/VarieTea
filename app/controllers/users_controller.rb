class UsersController < ApplicationController

    #GET - Read/Show => /users/:id
    def show
        @user = current_user
        @total_favs = @user.total_favorites
    end
    
    #GET - Read/Show => /users/:id/teas
    def teas
        @user = current_user
    end

end