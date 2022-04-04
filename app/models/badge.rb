class Badge < ApplicationRecord
    belongs_to :user

    validates :title, uniqueness: { case_sensitive: false }

    scope :earned, -> { where("earned = ?", true) }
end
