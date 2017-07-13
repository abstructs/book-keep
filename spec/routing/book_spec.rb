require 'rails_helper'

RSpec.describe "routing to books", :type => :routing do
  it "routes /books/index to books#index" do
    expect(:get => "/books").to route_to(
      :controller => "books",
      :action => "index"
    )
  end

    it "routes /books/new to books#new" do
    expect(:get => "/books/new").to route_to(
      :controller => "books",
      :action => "new"
    )
  end
end