class PetsController < ApplicationController

    def index
        @pets_by_species = Pet.preload(:breed).group_by { |pet| pet.breed.species }
    end

    def show 
        @pet = Pet.find_by(id: params[:id])
    end

    def new
        @pet = pet.new
    end 

end
