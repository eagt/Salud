class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name, index: true
      t.string :creator
       t.string "email", :default => "@", :null => false     	
	  t.boolean "acc_active", :default => false, index: true
	  t.boolean "is_virtual", :default => true, index: true

      t.timestamps null: false
    end
  end
end
