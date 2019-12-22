class User < ApplicationRecord 
  mount_uploader :avatar, AvatarUploader
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter,:google_oauth2]

  has_many :discussions, dependent: :destroy
  has_many :channels, through: :discussions

  has_one_attached  :avatar
  validates :username,
            uniqueness: true,
            presence: true, 
            length: {minimum: 2, maximum: 50},
            format: { with: /\A[\w-]+\z/, message: "Only contain letters, digits, dashes and underscores" }
  validate :password_requirements


  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

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
    user.username = auth.info.name# assuming the user model has a username
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  
    end
  end
  def email_required?
    false
  end

  def password_requirements
    rules = {
      " must contain at least one lowercase letter"  => /[a-z]+/,
      " must contain at least one uppercase letter"  => /[A-Z]+/,
      " must contain at least one digit"             => /\d+/,
      " must contain at least one special character" => /[^A-Za-z0-9]+/
    }
  
    rules.each do |message, regex|
      errors.add( :password, message ) unless password.match( regex )
    end
  end

  def gravatar_url
    # if image!=""
    #   image
    # else
      gravatar_id = Digest::MD5::hexdigest(email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    # end
  end
end
