require 'csv'
Entreprise.destroy_all
csv_text = File.read('./db/liste.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  entreprise = Entreprise.new
  entreprise.name = row.to_hash["Nom de l'entreprise"]
  entreprise.city = row.to_hash["Ville"] 
  entreprise.ca = row.to_hash["Chiffre d'affaires
kEUR
Dernière année disp."] 
  entreprise.naf = row.to_hash["Activités"] 
  entreprise.employees = row.to_hash["Nombre d'employés
Dernière année disp."] 
  entreprise.save
end