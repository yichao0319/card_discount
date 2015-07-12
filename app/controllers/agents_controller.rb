class AgentsController < ApplicationController
    def new
        @agent = Agent.new
    end

    def create
        # render plain: params[:agent].inspect
        @agent = Agent.new(agent_params)

        if @agent.save
            redirect_to @agent
        else
            render 'new'
        end
        
    end

    def show
        @agent = Agent.find(params[:id])
    end

    def edit
        @agent = Agent.find(params[:id])
    end

    def update
        @agent = Agent.find(params[:id])

        if @agent.update(agent_params)
            redirect_to @agent
        else
            render 'edit'
        end
    end

    def index
        @agent = Agent.all
    end

    def destroy
        @agent = Agent.find(params[:id])
        @agent.destroy

        redirect_to agents_path
    end

    private
        def agent_params
            params.require(:agent).permit(:name)
        end
end
