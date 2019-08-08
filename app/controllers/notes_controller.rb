class NotesController < ApplicationController
    before_action :require_login
    
    def index
        @client = Client.find(params[:client_id])
    end

    def new
        @client = Client.find(params[:client_id])
        @note = Note.new
    end

    def create
        @client = Client.find(params[:client_id])
        @note = @client.notes.create(note_params)
        @note.user_id = current_user.id
        @note.save
        redirect_to client_note_url(@client, @note)
    end

    def show
        @client = Client.find(params[:client_id])
        @note = @client.notes.find(params[:id])
    end

    def edit
        @client = Client.find(params[:client_id])
        @note = Note.find(params[:client_id])
    end

    def update

    end

    private

    def note_params
        params.require(:note).permit(:date, :length_in_minutes, :content, :user_id, :client_id)
    end

end
