class BadgesController < ApplicationController

    def index
        @user = current_user
        @badges_earned = Badge.earned(@user.id)
        @badges_not_earned = Badge.not_earned(@user.id)
    end

end