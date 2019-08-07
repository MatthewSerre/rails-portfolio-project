class NotesController < ApplicationController

    def index
    end

    def new
        @client = Client.find(params[:client_id])
        @note = Note.new
    end

    def create
        binding.pry
        @client = Client.find(params[:client_id])
        @note = @client.notes.create(note_params)
        redirect_to @note
    end

    def show
        @note = Note.find(params[:id])
    end

    private

    def note_params
        params.require(:note).permit(:date, :length_in_minutes, :content, :user_id, :client_id)
    end

end
