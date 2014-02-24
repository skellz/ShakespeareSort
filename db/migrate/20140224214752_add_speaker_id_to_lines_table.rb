class AddSpeakerIdToLinesTable < ActiveRecord::Migration
  def up 
    add_column :lines, :speaker_id, :integer
  end

  def down
    remove_column :lines, :speaker_id
  end
end
