class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter,:google_oauth2]

  has_many :discussions, dependent: :destroy
  has_many :channels, through: :discussions

  validates :username, uniqueness: true, presence: true, length: {maximum: 50}

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  def self.from_omniauth(auth)
    
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.name = auth.info.name # assuming the user model has a name
    user.username = auth.info.nickname # assuming the user model has a username
    #user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  
    end
  end
  def email_required?
    false
  end
  # def gravatar_url
  #   gravatar_id = Digest::MD5::hexdigest(email).downcase
  #   "https://gravatar.com/avatar/#{gravatar_id}.png"
  # end
end
