class GoogleSheetsWriterJob < ApplicationJob
  queue_as :default

  def perform(entry_id)
    entry = FeelingEntry.find(entry_id)
    GoogleSheetsService.new.write(entry)
  end
end
