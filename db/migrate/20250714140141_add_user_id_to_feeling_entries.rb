class AddUserIdToFeelingEntries < ActiveRecord::Migration[8.0]
  def change
    add_reference :feeling_entries, :user, null: true, foreign_key: true
  end
end
