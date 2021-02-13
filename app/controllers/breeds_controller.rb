class BreedsController < ApplicationController

    def index
        @breeds = Breed.all
    end

    def show 
        @breed = Breed.find_by(id: params[:id])
    end

    def new
        @breed = Breed.new
    end 
    
end
