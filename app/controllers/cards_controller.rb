class CardsController < ApplicationController
    def new
        @card = Card.new
    end

    def create
        # render plain: params[:card].inspect
        @card = Card.new(card_params)

        if @card.save
            redirect_to @card
        else
            render 'new'
        end
        
    end

    def show
        @card = Card.find(params[:id])
    end

    def edit
        @card = Card.find(params[:id])
    end

    def update
        @card = Card.find(params[:id])

        if @card.update(card_params)
            redirect_to @card
        else
            render 'edit'
        end
    end

    def index
        @card = Card.all
        # render plain: @card.inspect
    end

    def destroy
        @card = Card.find(params[:id])
        @card.destroy

        redirect_to cards_path
    end

    private
        def card_params
            params.require(:card).permit(:name, :reference, :bank_id, :card_type_id, :card_level_id)
        end
end
