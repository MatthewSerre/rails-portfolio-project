class NotesController < ApplicationController

    def index
    end

    def new
        @note = Note.new
    end

    def create
        binding.pry
        @note = Note.create(note_params)
        redirect_to note_path(@note)
    end

    def show
        @note = Note.find(params[:id])
    end

    private

    def note_params
        params.require(:note).permit(:date, :length_in_minutes, :content, :user_id, :client_id)
    end

end
