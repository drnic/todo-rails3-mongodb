require 'spec_helper'

describe List do

  def add_tasks(list)
    pending_task = Factory.build(:task)
    completed_task = Factory.build(:task)
    completed_task.completed = true
    list.tasks << pending_task
    list.tasks << completed_task
  end

  before(:each) do
    @list = Factory.build(:list)
  end

  it "should not be created without a name" do
    @list.name = nil
    @list.should_not be_valid
  end

  it "should not be created without a user" do
    @list.user = nil
    @list.should_not be_valid
  end

  it "should be created with all requirements" do
    @list.should be_valid
  end

  it "should add watcher" do
    watcher = Factory.build(:valid_user)
    @list.add_watcher(watcher)
    @list.should have(1).watchers
    watcher.should have(1).watching
  end

  it "should remove watcher" do
    watcher = Factory.build(:valid_user)
    @list.add_watcher(watcher)
    @list.remove_watcher(watcher)
    @list.should have(0).watchers
    watcher.should have(0).watching
  end

  it "should return only pending tasks" do
    add_tasks(@list)
    @list.should have(2).tasks
    @list.pending_tasks.first.completed.should_not be_true
  end

  it "should return on completed tasks" do
    add_tasks(@list)
    @list.should have(2).tasks
    @list.completed_tasks.first.completed.should be_true
  end

end

