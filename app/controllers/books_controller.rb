class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def create
        @book = Book.new(book_params)
        
        if @book.save!
            redirect_to @book
        else
            redirect_to "/new"
        end
    end

    def new
        @book = Book.new
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit 
        @book = Book.find(params[:id])
    end

    def update
        print(params.inspect)
        @book = Book.find(params[:id])

        if @book.update(book_params)
            redirect_to @book
        else
            redirect_to '/edit'
        end
    end
    
    def destroy
        @book = Book.find(params[:id])

        if @book.destroy
            redirect_to books_path
        else
            redirect_to @book
        end
    end

    private

        def book_params
            params.require(:book).permit(:title, :author)
        end
end
