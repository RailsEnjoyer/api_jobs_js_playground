class CreateFeelingEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :feeling_entries do |t|
      t.string :mood
      t.text :note

      t.timestamps
    end
  end
end
