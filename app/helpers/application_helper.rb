module ApplicationHelper
  include Devise::Controllers::Helpers 

  def toggle_favorite(tea)
      tea_saved = UserTea.find_by(user_id: current_user.id, tea_id: tea.id)
      if tea_saved && tea_saved.favorite == true
        button_to "Unfavorite", favorite_path(tea), method: :delete, class:"btn btn-outline-danger"
      else
        button_to "Favorite", favorites_path(id: tea.id), method: :post, class:"btn btn-outline-danger"
      end
  end

  def toggle_tasted(tea)
    tea_saved = UserTea.find_by(user_id: current_user.id, tea_id: tea.id)
    if tea_saved && tea_saved.tasted == true
      button_to "Untaste", tasted_path(tea), method: :delete, class:"btn btn-outline-primary"
    else
      button_to "Taste", tasted_index_path(id: tea.id), method: :post, class:"btn btn-outline-primary"
    end
  end

end
