class StaticController < ApplicationController
    skip_before_action :authenticate_user! 
    
    def home
    end
  
    def badges
    end
end
