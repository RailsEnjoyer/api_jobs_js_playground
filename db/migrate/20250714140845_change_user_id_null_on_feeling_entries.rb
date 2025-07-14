class ChangeUserIdNullOnFeelingEntries < ActiveRecord::Migration[8.0]
  def change
    change_column_null :feeling_entries, :user_id, false
  end
end
