class BadgesController < ApplicationController

    def index
        if user_signed_in?
            @user = current_user
            @badges = @user.badges.all
       else
           redirect badges_path
       end
    end

end