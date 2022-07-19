class CreateTalks < ActiveRecord::Migration[7.0]
  def change
    create_table :talks do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :message

      t.timestamps
    end
  end
end
