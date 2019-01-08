module Api::V1

  class NotesController < ApplicationController
    before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: Note.find_by(id: params[:id])
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note
    else
      render json: { message: @note.errors }, status: 400 
    end
  end

  def update 
    if @note.update(note_params)
      render json: @note
    else 
      render json: { message: @note.errors }, status: 400
    end
  end 

  def destroy 
    if @note.destroy
      render status: 204
    else 
      render json: { message: "Unable to remove this note"}, status: 400
    end 
  end 

    private

      # helper method
      def set_note
       @note = Note.find_by(id: params[:id])
      end

      def note_params
       params.require(:note).permit(:title, :date, :content, :submitted_by, :likes)
      end

  end
end 

