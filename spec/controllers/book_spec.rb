require "rails_helper"
require 'shared_contexts'

RSpec.describe BooksController, :type => :controller do
    describe "Controller routes" do
        before(:each) do
            @user = User.create(username: "abstruct", email: "test@example.com", password: "foobar", password_confirmation: "foobar")
            sign_in(@user)

            @book = Book.create!(title: "Harry Potter", author: "JK Rowling", rating: 0)
        end

        it "Successfully gets the index with 200 HTTP code" do
            get :index
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "Successfully gets the edit with 200 HTTP code" do
            get :edit, params: { id: @book.id }
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "Successfully gets the show with 200 HTTP code" do
            get :show, params: { id: @book.id }
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end
        
        it "Successfully creates a new book" do
            post :new, params: { id: @book.id, title: @book.title, author: @book.author, rating: @book.rating }

            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "Successfully updates a book" do
            put :update, params: { id: @book.id, book: { title: @book.title, author: @book.author, rating: @book.rating } }
            @book.reload

            expect(response).to redirect_to @book
            expect(@book.author).to eq("JK Rowling")
            expect(@book.title).to eq("Harry Potter")
        end

        it "Succesfully deletes a book" do
            delete :destroy, params: { id: @book.id }
            
            expect(response).to redirect_to books_path
            expect{Book.find(@book.id)}.to raise_error(ActiveRecord::RecordNotFound)
        end
    end

end