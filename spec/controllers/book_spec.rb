require "rails_helper"

RSpec.describe BooksController, :type => :controller do
    describe "Index" do
        it "Successfully gets the index with 200 HTTP code" do
            get :index
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "Successfully gets the edit with 200 HTTP code" do
            @book = Book.create!(title: "Harry Potter", author: "JK Rowling")
            get :edit, params: { id: @book.id }
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "Successfully gets the show with 200 HTTP code" do
            @book = Book.create!(title: "Harry Potter", author: "JK Rowling")
            get :show, params: { id: @book.id }
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end
        
        it "Successfully creates a new book" do
            post :new, params: { id: 1, title: "Harry Potter", author: "JK Rowling" }

            expect(response).to be_success
            expect(response).to have_http_status(200)
        end
    end

end