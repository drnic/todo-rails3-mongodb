class List
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope desc(:updated_at)

  field :name, :type => String
  field :public, :type => Boolean, :default => false

  referenced_in :user
  references_and_referenced_in_many :watchers, :class_name => "User", :inverse_of => :watching, :autosave => true, :dependent => :destroy

  embeds_many :tasks
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  validates :name, :user, :presence => true

  def add_watcher(user)
    watchers << user
  end

  def remove_watcher(user)
    user.watching.delete(self)
    user.save
    watchers.delete(user)
    save
  end

  def completed_tasks
    tasks.select { |task| task.completed? }
  end

  def pending_tasks
    tasks.select { |task| !task.completed? }
  end
end
