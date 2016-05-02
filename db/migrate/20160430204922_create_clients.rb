class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :clinic, index: true, foreign_key: true
      t.string :name
      t.string :creator

      t.timestamps null: false
    end
  end
end
