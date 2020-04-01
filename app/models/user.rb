class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :omniauthable
  validates :name,         presence: true, length: { maximum: 50 }
  validates :user_name,    presence: true, length: { maximum: 50 }
  # validates :profile_text, presence: true, length: { maximum: 500 }
  # validates :website_url,  presence: true, length: { maximum: 500 }
         
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
  
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end
end
