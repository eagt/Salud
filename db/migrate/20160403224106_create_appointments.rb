class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :clinic, index: true, foreign_key: true
      t.text :comment
      t.datetime :date
      t.string :creator

      t.timestamps null: false
    end
  end
end
