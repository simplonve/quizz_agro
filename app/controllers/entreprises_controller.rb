class EntreprisesController < ApplicationController
	def index
		@entreprises = Entreprise.all
	end
end
