class Badge < ApplicationRecord
    belongs_to :user

    scope :earned, ->(user_id) { where(earned: true, user_id: user_id) }
    scope :not_earned, ->(user_id) { where(earned: false, user_id: user_id) }
end
