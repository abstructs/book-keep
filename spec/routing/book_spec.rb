require 'rails_helper'

RSpec.describe "routing to books", :type => :routing do
    describe "Routing to actions" do
        it "routes /books/index to books#index" do
            expect(:get => "/books").to route_to(:controller => "books", :action => "index")
        end

        it "routes /books/new to books#new" do
            expect(:get => "/books/new").to route_to(:controller => "books", :action => "new")
        end

        it "routes /books/:id/edit to books#edit" do
            expect(:get => "/books/1/edit").to route_to(:controller => "books", :action => "edit", id: "1")
        end

        it "routes /books/:id to books#show" do
            expect(:get => "/books/1").to route_to(:controller => "books", :action => "show", id: "1")
        end
    end
end