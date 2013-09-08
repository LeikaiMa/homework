class User < ActiveRecord::Base
  rolify
  has_many :assets
  has_many :items
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook, :github]

  validates :email, case_sensitive: false
  validates :name, presence: true

  before_create :assign_role

  def assign_role
    if User.first.nil?
  	  self.add_role :admin
    else
      self.add_role :user
    end
  end

end
