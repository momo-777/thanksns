class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string :mention
      t.text :content

      t.timestamps
    end
  end
end
