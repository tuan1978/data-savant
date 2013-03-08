class AddNameToInputfiles < ActiveRecord::Migration
  def change
    add_column :inputfiles, :name, :string
  end
end
