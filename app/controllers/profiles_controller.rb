class ProfilesController < ApplicationController

    def index
        @profiles = Profile.all
    end

    def show 
        @profile = Profile.find_by(id: params[:id])
    end

    def new
        @profile = Profile.new
    end 
    
end
