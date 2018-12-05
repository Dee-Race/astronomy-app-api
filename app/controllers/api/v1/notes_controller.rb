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
    render json: @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  private

    # helper method
    def set_note
      @note = Note.find_by(id: params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :date, :content, :submitted_by)
    end
end
end 
