class List
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope desc(:updated_at)

  field :name, :type => String
  referenced_in :user

  embeds_many :tasks
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  validates :name, :presence => true

  def completed_tasks
    tasks.select { |task| task.completed? }
  end

  def pending_tasks
    tasks.select { |task| !task.completed? }
  end
end
