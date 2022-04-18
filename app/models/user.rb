class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_many :badges, dependent: :destroy
  has_many :user_teas
  has_many :teas, through: :user_teas

  after_create :add_badges

  # Public methods

  def favorite!(tea)
    tea_saved = UserTea.find_by(user_id: self.id, tea_id: tea.id)
    if tea_saved
        tea_saved.favorite = true
        tea_saved.save!
    else
        self.teas << tea
        self.save!
        tea.save!
        new_tea = UserTea.find_by(user_id: self.id, tea_id: tea.id)
        new_tea.favorite = true
        new_tea.save!
    end
  end

  def unfavorite!(tea)
      tea_saved = UserTea.find_by(user_id: self.id, tea_id: tea.id)
      if tea_saved
          tea_saved.favorite = false
          tea_saved.save!
      end
  end

  def total_favorites
    count = 0
    self.teas.each do |tea|
      tea_saved = UserTea.find_by(user_id: self.id, tea_id: tea.id)
      if tea_saved.favorite == true
        count += 1
      end
    end
    count
  end

  def all_favorites
    favorites = []
    self.teas.each do |tea|
      tea_saved = UserTea.find_by(user_id: self.id, tea_id: tea.id)
      if tea_saved.favorite == true
        favorites << tea
      end
    end
    favorites
  end

  def taste!(tea)
    tea_saved = UserTea.find_by(user_id: self.id, tea_id: tea.id)
    if tea_saved
        tea_saved.tasted = true
        tea_saved.save!
    else
        self.teas << tea
        self.save!
        tea.save!
        new_tea = UserTea.find_by(user_id: self.id, tea_id: tea.id)
        new_tea.tasted = true
        new_tea.save!
    end
  end

  def untaste!(tea)
      tea_saved = UserTea.find_by(user_id: self.id, tea_id: tea.id)
      if tea_saved
          tea_saved.tasted = false
          tea_saved.save!
      end
  end

  def total_tasted
    count = 0
    self.teas.each do |tea|
      tea_saved = UserTea.find_by(user_id: self.id, tea_id: tea.id)
      if tea_saved.tasted == true
        count += 1
      end
    end
    count
  end

  private

    def add_badges
      badges = [
        {user_id: "#{self.id}", title: "Tiny Taster", body: "You've tasted at least 1 tea!"}, 
        {user_id: "#{self.id}", title: "Taste Tester", body: "You've tasted at least 5 teas!"}, 
        {user_id: "#{self.id}", title: "I Came, I Saw, I Tasted", body: "You've tasted at least 10 teas!"}, 
        {user_id: "#{self.id}", title: "Flavor Fav", body: "You've added at least 1 tea to your favorites!"}, 
        {user_id: "#{self.id}", title: "Super Flavor Fav", body: "You've added at least 5 teas to your favorites!"}
        ]
      badges.each do |b|
        badge = Badge.create(b)
        self.badges << badge
      end
      self.save
    end

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
      end
    end

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
end
