class FeelingEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = current_user.feeling_entries.order(created_at: :desc)
  end

  def new
    @feeling_entry = FeelingEntry.new
  end

  def create
    @feeling_entry = current_user.feeling_entries.build(feeling_entry_params)

    if @feeling_entry.save
      GoogleSheetsWriterJob.perform_later(@feeling_entry.id)
      redirect_to feeling_entries_path, notice: "Feeling saved!"
    else
      render :new
    end
  end

  def sync
    GoogleSheetsSyncerJob.perform_now(current_user)
    redirect_to feeling_entries_path, notice: "Synchronized!"
  end

  private

  def feeling_entry_params
    params.require(:feeling_entry).permit(:mood, :note)
  end
end
