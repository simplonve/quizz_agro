class CreateEntreprises < ActiveRecord::Migration
  def change
    create_table :entreprises do |t|
      t.string :name
      t.string :city
      t.string :ca
      t.string :activity
      t.string :employees

      t.timestamps null: false
    end
  end
end
