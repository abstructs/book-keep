class NotesController < ApplicationController
    before_action :authenticate_user!

    def create
        @book = Book.find(params[:book_id])
        @user = current_user

        @note = Note.create(note_params)

        if @note.save
            redirect_to book_path(@book)
        else 
            flash[:alert] = "Something went wrong!"
            redirect_to @book
        end
        # debug
    end

    private 
        def note_params
            params.require(:note).permit(:body).merge(user_id: current_user.id)
        end
end
