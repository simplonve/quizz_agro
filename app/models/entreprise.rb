require 'curl'

class Entreprise < ActiveRecord::Base
	def naf_translated()
		curl = CURL.new
		adresse = "http://recherche-naf.insee.fr/SIRENET_ClassesNaf/"+self.naf+".htm"
		page = curl.get(adresse)
		page_array = page.split("title")
		page_sous = page_array[1].split("Sous-classe - ")
		page_sous[1]
	end
end
