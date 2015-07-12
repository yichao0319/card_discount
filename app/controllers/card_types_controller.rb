class CardTypesController < ApplicationController
    def new
        @card_type = CardType.new
    end

    def create
        # render plain: params[:card_type].inspect
        @card_type = CardType.new(card_type_params)

        if @card_type.save
            redirect_to @card_type
        else
            render 'new'
        end
        
    end

    def show
        @card_type = CardType.find(params[:id])
    end

    def edit
        @card_type = CardType.find(params[:id])
    end

    def update
        @card_type = CardType.find(params[:id])

        if @card_type.update(card_type_params)
            redirect_to @card_type
        else
            render 'edit'
        end
    end

    def index
        @card_type = CardType.all
    end

    def destroy
        @card_type = CardType.find(params[:id])
        @card_type.destroy

        redirect_to card_types_path
    end

    private
        def card_type_params
            params.require(:card_type).permit(:name)
        end
end
