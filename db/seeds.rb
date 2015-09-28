require 'csv'
Entreprise.destroy_all
csv_text = File.read('./db/liste.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  entreprise = Entreprise.new
  entreprise.name = row.to_hash["Nom"]
  entreprise.city = row.to_hash["Ville"] 
  entreprise.ca = row.to_hash["CA"] 
  entreprise.naf = row.to_hash["NAF"] 
  entreprise.employees = row.to_hash["employees"] 
  entreprise.save
end