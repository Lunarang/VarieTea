class Ingredient < ApplicationRecord
    has_many :tea_ingredients
    has_many :teas, through: :tea_ingredients

    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
