require 'spec_helper'

describe User do

  before(:each) do
    @user = Factory.build(:john)
  end

  it "should not be created without username" do
    @user.username = nil
    @user.should_not be_valid
  end

  it "should not be created with a username with spaces" do
    @user.username = "tes t"
    @user.should_not be_valid
  end

  it "should not be created with a username with special characters" do
    @user.username = "test@%"
    @user.should_not be_valid
  end

  it "should require username to be unique" do
    Factory.create(:john)
    @user.email = "paul@beatles.com"
    @user.should_not be_valid
  end

  it "should not be created without name" do
    @user.name = nil
    @user.should_not be_valid
  end

  it "should not be created without email" do
    @user.email = nil
    @user.should_not be_valid
  end

  it "should require email to be unique" do
    Factory.create(:john)
    @user.username = "paul"
    @user.should_not be_valid
  end

  it "should not be created without password" do
    @user.password = nil
    @user.should_not be_valid
  end

  it "should not be created if password and password_confirmation not equal" do
    @user.password_confirmation = "passwd"
    @user.should_not be_valid
  end

  it "should be created with all requiments" do
    @user.should be_valid
  end

end

