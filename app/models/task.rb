class Task
  include Mongoid::Document

  field :name, :type => String
  field :completed, :type => Boolean, :default => false
  embedded_in :list, :inverse_of => :tasks

  def change_status
    update_attributes(:completed => !completed?)
  end

end

