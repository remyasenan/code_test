require 'rails_helper'

RSpec.describe "routes for clients", :type => :routing do
  it "routes /clients to the clients controller" do
    expect(:get => "/clients").
      to route_to(:controller => "clients", :action => "new")
  end
end