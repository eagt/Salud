class CreateAppointClienships < ActiveRecord::Migration
  def change
    create_table :appoint_clienships do |t|
      t.references :appointment, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.string :creator

      t.timestamps null: false
    end
  end
end
