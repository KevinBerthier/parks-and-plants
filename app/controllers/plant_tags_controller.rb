class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    params[:plant_tag][:tag].each do |tag_id|
      @plant_tag = PlantTag.new(tag_id: tag_id, plant: @plant)
      @plant_tag.save
    end
    if @plant_tag.save
      redirect_to @plant.garden
    else
      render :new
    end
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
