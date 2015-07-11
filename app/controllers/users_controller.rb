class UsersController < ApplicationController
    def show
        @user = current_user
        @user.email = nil unless @user.email.scan('@example.com').empty?
    end

    def edit
        @user = current_user
        @user.email = nil unless @user.email.scan('@example.com').empty?
    end

    def update
        @user = current_user
        @user.email = nil unless @user.email.scan('@example.com').empty?

        # render plain: @user.account
        if @user.update(user_params)
            # render plain: "succeed"
            redirect_to show_profile_path
        else
            # render plain: "error"
            render 'edit'
        end

        # @user=current_user
        # if @user.update_attributes(params[:user])
        #     sign_in 'user', @user, :bypass => true
        #     flash[:notice] = t('users.profile.edit.updated')
        #     respond_to do |format|
        #         format.html { redirect_to '/'}
        #     end
        # else
        #     render 'devise/profile/edit'
        # end
    end

    private
        def user_params
            params.require(:user).permit(:account, :email, :gender, :birthday, :city)
        end
end
