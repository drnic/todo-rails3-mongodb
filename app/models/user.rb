class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :username
  field :name
  mount_uploader :avatar, AvatarUploader

  references_many :lists, :dependent => :destroy
  references_and_referenced_in_many :watching, :class_name => "List", :inverse_of => :watchers, :autosave => true, :dependent => :destroy

  validates :username, :name, :presence => true
  validates :username, :email, :uniqueness => {:case_sensitive => false}
  validates :username, :length => {:minimum => 3}, :format => { :with => /^\w*$/ }

  attr_accessible :username, :name, :lists, :avatar, :email, 
    :password, :password_confirmation, :remember_me

  def watching?(current_list)
    !watching.select { |list| (list._id == current_list._id) }.empty?;
  end

end
