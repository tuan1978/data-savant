class RenameNameInputfiles < ActiveRecord::Migration
  def up
    rename_column :inputfiles, :name, :title
  end

  def down
  end
end
