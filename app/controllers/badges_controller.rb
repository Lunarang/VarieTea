class BadgesController < ApplicationController

    def index
        if user_signed_in?
            @user = current_user
            @badges = @user.badges
       else
           redirect root_path
       end
    end

end