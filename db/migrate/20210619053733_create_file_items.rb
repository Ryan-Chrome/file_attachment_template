class CreateFileItems < ActiveRecord::Migration[6.0]
  def change
    create_table :file_items do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
