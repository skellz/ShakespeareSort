class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.integer :speaker_id
      t.integer :scene_id
      t.integer :lines_count

      t.timestamps
    end
  end
end
