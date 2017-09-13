class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :context, null: false, default: " "
      t.string :userid, null: false, default: " "

      t.integer :status, null: false, default: 2
      t.integer :showable, null: false, default: 0

      t.timestamps
    end
  end
end
