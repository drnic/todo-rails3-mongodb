require "spec_helper"

describe ListsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/lists" }.should route_to(:controller => "lists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/lists/new" }.should route_to(:controller => "lists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/lists/1" }.should route_to(:controller => "lists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/lists/1/edit" }.should route_to(:controller => "lists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/lists" }.should route_to(:controller => "lists", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/lists/1" }.should route_to(:controller => "lists", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/lists/1" }.should route_to(:controller => "lists", :action => "destroy", :id => "1")
    end

  end
end
