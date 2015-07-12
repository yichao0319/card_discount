class AdminController < ApplicationController
    before_action :require_admin
    
    def list_users
        @admin = current_user
        @users = User.all
    end

    def show_user
        @admin = current_user
        @user = User.find(params[:format])
    end

    def edit_user
        @admin = current_user
        @user = User.find(params[:id])
    end

    def update_user
        @admin = current_user
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to admin_show_user_path(@user)
        else
            render 'edit_user'
            # render admin_edit_user_path(@user)
            # render admin_show_user_path(@user)
            # render plain: @user.errors.full_messages
        end
    end


    private
        def user_params
            params.require(:user).permit(:account, :email, :gender, :birthday, :city, :privilege)
        end

        def require_admin
            unless current_user.privilege >= 4
                flash[:error] = "You must have admin privilege to access!"
                redirect_to show_profile_path
            end
        end
end
