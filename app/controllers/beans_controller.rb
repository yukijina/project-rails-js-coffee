class BeansController < ApplicationController
  def index
    @beans = Bean.all
  end

  def new
    @bean = Bean.new
  end

  def create
    @bean = Bean.new(bean_params)
    @roaster = @bean.build_roaster(bean_params[:roaster_attributes])
    if @bean.save && @roaster.save
      render json: @bean, status: 200
    else
      render :new
    end
  end

  private
  def bean_params
    params.require(:bean).permit(:brand, :variety, :taste_note, :description, :organic, :fairtrade, :roaster_id, :roaster_attributes => [:roaster_name, :city, :state, :url])
  end

end
