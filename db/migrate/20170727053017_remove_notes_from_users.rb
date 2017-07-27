class RemoveNotesFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:users, :notes, index: true, foreign_key: true)
  end
end
