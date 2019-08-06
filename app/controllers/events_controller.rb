class EventsController < ApplicationController

    def index
    end

    def new
        @event = Event.new
    end

    def create
        binding.pry
        @event = Event.create(event_params)
        redirect_to event_path(@event)
    end

    def show
        @event = Event.find(params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:name, :description, :date, :start_time, :end_time, :location, :category)
    end

end
