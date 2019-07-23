class BeansController < ApplicationController
  def index
    @beans = Bean.all
  end

  def new
    @bean = Bean.new
  end

  def create
    @bean = Bean.new(bean_params)

    if !params[:bean][:roaster_id].empty?
      roaster = Roaster.find_by(id: params[:bean][:roaster_id])
      @bean.roaster_id = roaster.id
    else
      @bean.build_roaster(bean_params[:roaster_attributes])
    end

    if @bean.save
      render json: @bean, status: 200
    else
      render :new
    end
  end

  private
  def bean_params
    params.require(:bean).permit(:brand, :variety, :taste_note, :description, :organic, :fairtrade, :origin_1, :roaster_id, :roaster_attributes => [:roaster_name, :city, :state, :description, :url])
  end

end
