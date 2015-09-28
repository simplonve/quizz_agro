class EntreprisesController < ApplicationController
	def index
		@entreprises = Entreprise.last(3)
	end
end
