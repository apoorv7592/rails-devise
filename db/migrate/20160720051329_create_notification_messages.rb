class CreateNotificationMessages < ActiveRecord::Migration
  def change
    create_table :notification_messages do |t|
      t.string :message_title
      t.text :message_content
      t.datetime :message_time
      t.timestamps null: false
    end
  end
end
