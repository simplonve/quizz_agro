class ChangeEntreprises < ActiveRecord::Migration
  def change
    change_table :entreprises do |t|
      t.rename :naf, :activities
    end
  end
end
