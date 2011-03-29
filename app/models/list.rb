class List
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope desc(:updated_at)

  field :name, :type => String
  referenced_in :user

  validates :name, :presence => true
end
