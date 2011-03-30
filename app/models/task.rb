class Task
  include Mongoid::Document
  field :name, :type => String
  field :done, :type => Boolean, :default => false
  embedded_in :list, :inverse_of => :tasks
end
