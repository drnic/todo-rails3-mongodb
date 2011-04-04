require 'spec_helper'

describe List do

  def add_tasks(list)
    list.tasks << Factory.build(:pending_task)
    list.tasks << Factory.build(:completed_task)
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

 it "should not add watcher to private list" do
    watcher = Factory.build(:paul)
    @list.add_watcher(watcher)
    @list.should have(0).watchers
    watcher.should have(0).watching
  end

  it "should add watcher to public list" do
    @list.update_attributes(:public => true)
    watcher = Factory.build(:paul)
    @list.add_watcher(watcher)
    @list.should have(1).watchers
    watcher.should have(1).watching
  end

  it "should remove watcher" do
    watcher = Factory.build(:paul)
    @list.add_watcher(watcher)
    @list.remove_watcher(watcher)
    @list.should have(0).watchers
    watcher.should have(0).watching
  end

  it "should remove watchers if list is no more public" do
    @list.public = true
    @list.watchers << Factory.create(:paul)
    @list.save
    @list.should have(1).watchers
    @list.update_attributes(:public => false)
    @list.should have(0).watchers
  end

  it "should create list tasks with name" do
    @list.tasks.build(Factory.attributes_for(:pending_task))
    @list.tasks.build(Factory.attributes_for(:pending_task_with_empty_name))
    @list.save
    @list.should have(1).tasks
  end
end

