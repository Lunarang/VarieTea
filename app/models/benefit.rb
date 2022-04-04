class Benefit < ApplicationRecord
    has_many :tea_benefits
    has_many :teas, through: :tea_benefits

    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
