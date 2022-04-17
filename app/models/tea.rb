class Tea < ApplicationRecord
    has_many :user_teas
    has_many :users, through: :user_teas
    has_many :tea_ingredients
    has_many :ingredients, through: :tea_ingredients
    has_many :tea_benefits
    has_many :benefits, through: :tea_benefits

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates_presence_of :preparation

    accepts_nested_attributes_for :benefits, :ingredients

    scope :newest, -> { order(created_at: :desc).limit(3) }
    scope :with_ingredient, ->(ingredient_name) { includes(:ingredients).where(ingredients: { name: ingredient_name }) }
    scope :with_benefit, ->(benefit_name) { includes(:benefits).where(benefits: { name: benefit_name }) }
    scope :created_by, ->(user_id) { where(user_id: user_id) }

    def benefits_attributes=(benefit_attributes)
      benefit_attributes.values.each do |benefit_attribute|
        if benefit_attribute["name"].present?
          benefit = Benefit.find_or_create_by(benefit_attribute)
          self.benefits << benefit
        end
      end
    end

    def ingredients_attributes=(ingredient_attributes)
      ingredient_attributes.values.each do |ingredient_attribute|
        if ingredient_attribute["name"].present?
          ingredient = Ingredient.find_or_create_by(ingredient_attribute)
          self.ingredients << ingredient
        end
      end
    end
end
