module ApplicationHelper
    include Devise::Controllers::Helpers 

    def toggle_favorite(tea)
        tea_saved = UserTea.find_by(user_id: current_user.id, tea_id: tea.id)
        if tea_saved && tea_saved.favorite == true
          button_to "Unfavorite", favorite_path(tea), method: :delete
        else
          button_to "Favorite", favorites_path(id: tea.id), method: :post
        end
    end

end
