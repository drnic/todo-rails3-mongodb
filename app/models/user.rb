class User
  include Mongoid::Document

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :username
  field :name
  mount_uploader :avatar, AvatarUploader

  validates :username, :name, :presence => true
  validates :username, :email, :uniqueness => {:case_sensitive => false}
  validates :username, :length => {:minimum => 3}, :format => { :with => /^\w*$/ }

  attr_accessible :username, :name, :avatar, :email, :password, :password_confirmation, :remember_me

end
