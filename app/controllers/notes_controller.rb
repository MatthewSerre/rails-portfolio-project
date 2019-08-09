class NotesController < ApplicationController
    before_action :require_login
    
    def index
        @client = Client.find(params[:client_id])
        @notes = @client.notes
    end

    def new
        @client = Client.find(params[:client_id])
        @note = Note.new
    end

    def create
        @client = Client.find(params[:client_id])
        @note = @client.notes.new(note_params)
        @note.user_id = current_user.id
        @note.save
        if @note.errors.any?
            render :new
        else
            redirect_to client_note_url(@client, @note)
        end
    end

    def show
        @client = Client.find(params[:client_id])
        @note = @client.notes.find(params[:id])
    end

    def edit
        @client = Client.find(params[:client_id])
        @note = Note.find(params[:id])
        if authorized(@note.user)
            render :edit
        else
            flash[:error] = "You cannot edit another user's note."
            redirect_to client_note_url(@client, @note)
        end
    end

    def update
        @client = Client.find(params[:client_id])
        @note = Note.find(params[:id])
        if authorized(@note.user)
            @note.update(note_params)
            redirect_to client_note_url(@client, @note)
        else
            flash[:error] = "You cannot update another user's note."
            redirect_to client_note_url(@client, @note)
        end
    end

    def destroy
        @client = Client.find(params[:client_id])
        @note = Note.find(params[:id])
        if authorized(@note.user)
            @note.delete
            redirect_to client_notes_url(@client)
        else
            flash[:error] = "You cannot delete another user's note."
            redirect_to client_note_url(@client, @note)
        end
    end

    private

    def note_params
        params.require(:note).permit(:date, :length_in_minutes, :content, :user_id, :client_id)
    end

end
