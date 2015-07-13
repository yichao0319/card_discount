class CardLevelsController < ApplicationController
    def new
        if current_user.nil?
            redirect_to card_levels_path
        end

        @card_level = CardLevel.new
        @agents = Agent.all
    end

    def create
        # render plain: params[:card_level].inspect
        @card_level = CardLevel.new(card_level_params)

        if @card_level.save
            redirect_to @card_level
        else
            render 'new'
        end
        
    end

    def show
        @card_level = CardLevel.find(params[:id])
    end

    def edit
        if current_user.nil?
            redirect_to card_levels_path
        end
        
        @card_level = CardLevel.find(params[:id])
        @agents = Agent.all
    end

    def update
        @card_level = CardLevel.find(params[:id])

        if @card_level.update(card_level_params)
            redirect_to @card_level
        else
            render 'edit'
        end
    end

    def index
        @card_level = CardLevel.all
    end

    def destroy
        @card_level = CardLevel.find(params[:id])
        @card_level.destroy

        redirect_to card_levels_path
    end

    private
        def card_level_params
            params.require(:card_level).permit(:level, :name, :agent_id)
        end
end
