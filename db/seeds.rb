require 'csv'
Entreprise.destroy_all
Question.destroy_all
csv_liste = File.read('./db/liste.csv')
csv_question = File.read('./db/questions.csv')

csv_entreprise = CSV.parse(csv_liste, :headers => true)
csv_entreprise.each do |row|
  entreprise = Entreprise.new
  entreprise.name = row.to_hash["Nom de l'entreprise"]
  entreprise.city = row.to_hash["Ville"]
  entreprise.ca = row.to_hash["Chiffre d'affaires
kEUR
Dernière année disp."]
  entreprise.activity = row.to_hash["Activités"]
  entreprise.employees = row.to_hash["Nombre d'employés
Dernière année disp."]
  entreprise.save
end

csv_questions = CSV.parse(csv_question, :headers => true)
csv_questions.each do |row|
	question = Question.new
	question.text = row.to_hash["text"]
	question.question_type = row.to_hash["type"]
	question.save
end
