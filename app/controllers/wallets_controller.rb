class WalletsController < ApplicationController
    def new
        ## not used
        redirect_to show_profile_path
    end

    def create
        ## not used
        redirect_to show_profile_path
    end

    def show
        ## not used
        redirect_to show_profile_path
    end

    def edit
        @user = current_user
        @cards = Card.all
    end

    def update
        # render plain: params[:card_ids].inspect
        @user = current_user

        if params[:card_ids].nil?
            @user.cards = []
        else
            @card_ids = Card.find(params[:card_ids])
            @user.cards = @card_ids
        end
        
        redirect_to show_profile_path
    end

    def index
        ## not used
        redirect_to show_profile_path
    end

    def destroy
        ## not used
        redirect_to show_profile_path
    end

    # private
    #     def wallet_params
    #         params.require(:wallet).permit(:title, :text)
    #     end
end
