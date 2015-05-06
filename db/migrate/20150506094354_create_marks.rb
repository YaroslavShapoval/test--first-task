class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :description
      t.references :map, index: true

      t.timestamps null: false
    end
    add_foreign_key :marks, :maps
  end
end
