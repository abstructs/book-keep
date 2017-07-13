require "rails_helper"

RSpec.describe BooksController, :type => :controller do
    describe "GET INDEX" do
        it "Successfully gets the index with 200 HTTP code" do
            get :index
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

    end

end