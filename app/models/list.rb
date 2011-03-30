class List
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope desc(:updated_at)

  field :name, :type => String
  referenced_in :user

  embeds_many :tasks
  accepts_nested_attributes_for :tasks

  validates :name, :presence => true
end
