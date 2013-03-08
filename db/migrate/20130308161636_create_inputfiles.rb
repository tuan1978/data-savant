class CreateInputfiles < ActiveRecord::Migration
  def change
    create_table :inputfiles do |t|
      t.string :filename
      t.text :contents

      t.timestamps
    end
  end
end
