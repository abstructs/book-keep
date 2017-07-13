require "rails_helper"

RSpec.describe BooksController, :type => :controller do
    describe "Controller routes" do
        it "Successfully gets the index with 200 HTTP code" do
            get :index
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "Successfully gets the edit with 200 HTTP code" do
            book = Book.create!(title: "Harry Potter", author: "JK Rowling")
            get :edit, params: { id: book.id }
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "Successfully gets the show with 200 HTTP code" do
            book = Book.create!(title: "Harry Potter", author: "JK Rowling")
            get :show, params: { id: book.id }
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end
        
        it "Successfully creates a new book" do
            post :new, params: { id: 1, title: "Harry Potter", author: "JK Rowling" }

            expect(response).to be_success
            expect(response).to have_http_status(200)
        end

        it "Successfully updates a book" do
            @book = Book.create!(id: 1, title: "The Slight Edge", author: "Jeff Olson")
            
            put :update, params: { id: @book.id, book: { title: "Harry Potter", author: "JK Rowling" } }
            @book.reload

            expect(response).to redirect_to @book
            expect(@book.author).to eq("JK Rowling")
            expect(@book.title).to eq("Harry Potter")
        end

        it "Succesfully deletes a book" do
            @book = Book.create!(id: 1, title: "The Slight Edge", author: "Jeff Olson")

            delete :destroy, params: { id: 1 }
            
            expect(response).to redirect_to books_path
            expect{Book.find(1)}.to raise_error(ActiveRecord::RecordNotFound)
        end
    end

end