class CreateAssaigments < ActiveRecord::Migration
  def change
    create_table :assaigments do |t|
      t.references :appointment, index: true, foreign_key: true
      t.references :professional, index: true, foreign_key: true
      t.string :creator

      t.timestamps null: false
    end
  end
end
