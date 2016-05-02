class CreateClientProfessionals < ActiveRecord::Migration
  def change
    create_table :client_professionals do |t|
      t.references :professional, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      
      t.string :creator

      t.timestamps null: false
    end
  end
end
