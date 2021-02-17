class PetsController < ApplicationController

    def index
        @pets = Pet.get_dogs
    end

    def show 
        @pet = Pet.find_by(id: params[:id])
    end

    def new
        @pet = pet.new
    end 

end
