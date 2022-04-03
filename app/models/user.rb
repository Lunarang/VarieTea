class User < ApplicationRecord
  # :omniauthable adds the following to Devise:
  # omniauth_providers: Which providers are available to this model. It expects an array:
  # devise :database_authenticatable, :omniauthable, omniauth_providers: [:twitter]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]
end
