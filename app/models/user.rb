class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

	has_many :projects
	has_many :donations
	has_many :point_sources

	validates :email, presence: true, uniqueness: true
	# validates :password_digest, presence: true


  def self.from_omniauth(auth)
    if !where(email: auth.info.email).empty?
      user = where(email: auth.info.email).first
      user.uid = auth.uid          
      user.save!
      user
    else
      where(uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end
		
 end   
end
