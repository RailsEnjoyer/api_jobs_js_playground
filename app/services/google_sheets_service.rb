require "google_drive"

class GoogleSheetsService
  SPREADSHEET_KEY = "1EcFQYBk_eN9J_jslHlFCkwUMonNgegIyt4vSU0BSvFU"
  SHEET_TITLE = "work1"

  def initialize
    @session = GoogleDrive::Session.from_service_account_key("config/google_sheets_credentials.json")
  end

  def fetch_entries
    sheet = @session.spreadsheet_by_key(SPREADSHEET_KEY).worksheet_by_title(SHEET_TITLE)

    sheet.rows.reject(&:empty?).map do |row|
      {
        created_at: row[0],
        mood: row[1],
        note: row[2]
      }
    end
  end

  def write(entry)
    sheet = @session.spreadsheet_by_key(SPREADSHEET_KEY).worksheet_by_title(SHEET_TITLE)

    row = sheet.rows.find_index { |r| r.compact.empty? } || sheet.num_rows + 1

    sheet[row, 1] = Time.zone.now.to_s
    sheet[row, 2] = entry.mood
    sheet[row, 3] = entry.note
    sheet[row, 4] = entry.user.email
    sheet.save
  end
end
