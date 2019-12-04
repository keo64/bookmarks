class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_and_belongs_to_many :bookmarks

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    user = where(uid: auth.uid).first_or_initialize
    user.email    = auth.info.email if user.email.blank?
    user.password = Devise.friendly_token[0,20] if user.password.nil?
    user.provider = auth.provider if user.provider.nil?
    user.token    = auth.credentials.token if user.token.nil?
    user.name     = auth.info.name if user.name.nil?
    user.image    = auth.info.image if user.image.nil?
    user.save if user.changed? || user.new_record?
    user
  end
end
