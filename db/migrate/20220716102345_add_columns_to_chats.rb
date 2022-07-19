class AddColumnsToChats < ActiveRecord::Migration[7.0]
  def change
    add_reference :chats, :users, null: false, foreign_key: true
    add_column :chats, :partner_id, :integer
    add_column :chats, :sentence, :string
  end
end
