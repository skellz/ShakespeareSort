class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :speech_id
      t.text :line

      t.timestamps
    end
  end
end
