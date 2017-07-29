class UsersController < ApplicationController
    def profile

        if user_signed_in?            
            @user = current_user
        else
            flash[:alert] = "Please log in to view your profile"
            redirect_to new_user_registration_path and return
        end
    end
end
