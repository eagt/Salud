class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.references :professional, index: true, foreign_key: true
      t.references :clinic, index: true, foreign_key: true
      t.string :creator

      t.timestamps null: false
    end
  end
end
