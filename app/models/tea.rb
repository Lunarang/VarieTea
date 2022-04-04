class Tea < ApplicationRecord
    has_many :user_teas
    has_many :users, through: :user_teas
    has_many :tea_ingredients
    has_many :ingredients, through: :tea_ingredients
    has_many :tea_benefits
    has_many :benefits, through: :tea_benefits

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :preparation, presence: true
end
