require "google_drive"

class GoogleSheetsSyncer
  SPREADSHEET_KEY = "1EcFQYBk_eN9J_jslHlFCkwUMonNgegIyt4vSU0BSvFU"
  SHEET_TITLE = "work1"

  def initialize(user)
    @user = user
    @session = GoogleDrive::Session.from_service_account_key("config/google_sheets_credentials.json")
  end

  def sync!
    sheet = @session.spreadsheet_by_key(SPREADSHEET_KEY).worksheet_by_title(SHEET_TITLE)

    all_rows = sheet.rows.reject(&:empty?)

    user_entries = all_rows.select { |row| row[3] == @user.email }

    structured = user_entries.map do |row|
      {
        created_at: row[0],
        mood: row[1],
        note: row[2]
      }
    end

    to_keep = structured.map { |e| [e[:created_at], e[:mood], e[:note]] }

    @user.feeling_entries.find_each do |record|
      unless to_keep.include?([record.created_at.iso8601, record.mood, record.note])
        record.destroy
      end
    end

    structured.each do |entry|
      next if @user.feeling_entries.exists?(
        created_at: Time.parse(entry[:created_at]),
        mood: entry[:mood],
        note: entry[:note]
      )

      @user.feeling_entries.create!(
        created_at: Time.parse(entry[:created_at]),
        mood: entry[:mood],
        note: entry[:note]
      )
    end
  end
end
