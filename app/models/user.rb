class User < ActiveRecord::Base
  after_initialize :default_values

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

	has_many :projects
	has_many :donations
	has_many :point_sources
  has_many :comments
  has_many :likes

	validates :email, presence: true
	# validates :password_digest, presence: true

  def init
      self.total_points  ||= 0           #will set the default value only if it's nil
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  private
    def default_values
      self.total_points ||= 0
    end

end
