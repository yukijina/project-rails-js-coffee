class RoastersController < ApplicationController

  def index
    @roasters = Roaster.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @roasters }
    end
  end


end
