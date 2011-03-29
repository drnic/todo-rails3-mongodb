class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :username
  field :name
  mount_uploader :avatar, AvatarUploader

  references_many :lists, :dependent => :destroy

  validates :username, :name, :presence => true
  validates :username, :email, :uniqueness => {:case_sensitive => false}
  validates :username, :length => {:minimum => 3}, :format => { :with => /^\w*$/ }

  attr_accessible :username, :name, :lists, :avatar, :email, 
    :password, :password_confirmation, :remember_me

end
