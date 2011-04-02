require 'spec_helper'

describe Task do
 
  before(:each) do
    @list = Factory.build(:list)
    @task = @list.tasks.build
  end

  it "should be created as a pending task" do
    @task.completed.should_not be_true
  end

  it "should change status from pending to completed task" do
    @task.change_status
    @task.completed.should be_true
  end

  it "should change status from completed to pending task" do
    @task.completed = true
    @task.change_status
    @task.completed.should_not be_true
  end

end
