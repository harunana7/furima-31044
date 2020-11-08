class ChangeMessagesToItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :messages, :items
  end
end
