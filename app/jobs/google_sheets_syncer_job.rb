class GoogleSheetsSyncerJob < ApplicationJob
  queue_as :default

  def perform(current_user)
    GoogleSheetsSyncer.new(current_user).sync!
  end
end