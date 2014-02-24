class AddDataToDataFiles < ActiveRecord::Migration
  def change
    add_column :data_files, :data, :string
  end
end
