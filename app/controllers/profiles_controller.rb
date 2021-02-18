class ProfilesController < ApplicationController

    before_action :set_profile, only: [:show, :edit, :update, :destroy]

    def index
        @profiles = Profile.all
    end

    def show 
    end

    def new
        @profile = Profile.new
    end 
  
    def create
      @profile = Profile.new(profile_params)

      if @profile.valid?
        @profile.save
        redirect_to user_path(@profile.user_id)
      else 
        flash[:errors] = @user.errors.full_messages 
        redirect_to new_profile_path
      end 
    end 

    def edit
    end  

    def update
        @profile.update(profile_params)
        if @profile.valid?
            @profile.save
            redirect_to user_path(@profile.user_id)
        else
            flash[:errors] = @profile.errors.full_messages
            render :edit
        end
    end
  
    
    def destroy
        @profile.destroy
        redirect_to user_path(@profile.user_id)
    end

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_profile
        @profile = Profile.find_by(id: params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def profile_params
        params.require(:profile).permit(:pet_id, :user_id)
      end
    
end
