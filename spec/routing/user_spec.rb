require 'rails_helper'

RSpec.describe "routing to users", :type => :routing do
    describe "Routing to actions" do
        it "routes /books/index to books#index" do
            expect(:get => "/profile").to route_to(:controller => "users", :action => "profile")
        end
    end
end