class CardRatingsController < ApplicationController
    def create
        @card = Card.find(params[:card_id])
        # @user = Card.find(params[:user_id])
        
        @card_rating_params = card_rating_params
        @card_rating_params["user_id"] = current_user.id
        @rating = @card.card_ratings.create(@card_rating_params)
        redirect_to card_path(@card)
    end

    def destroy
        # render plain: params.inspect
        @card = Card.find(params[:card_id])
        @card_rating = @card.card_ratings.find(params[:id])
        
        @card_rating.destroy
        redirect_to card_path(@card)
    end

    private
        def card_rating_params
            params.require(:card_rating).permit(:card_id, :user_id, :rating, :comment)
        end
end
