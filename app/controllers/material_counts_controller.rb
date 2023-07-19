class MaterialCountsController < ApplicationController
  def new
    @count_day = CountDay.find(params[:count_day_id])
    @material_counts = MaterialCount.all
    @material_count = MaterialCount.new
    @material_num = MaterialNum.all
  end

  def create
    @material_count = MaterialCount.new(material_count_params)
    if @material_count.save
      redirect_to root_path
    else
      @material_num = MaterialNum.all
      @count_day = CountDay.find(params[:count_day_id])
      render :new
    end
#    material_count_params.each do |material|
#      MaterialCount.create(material[1])
#    end
#    @material_count = MaterialCount.create(material_count_params)
#    binding.pry

#    @material_count = MaterialCount.create(material_count_params)
#    if @material_count.all?(&:persisted?)
#      redirect_to root_path
#    else
#      render :new
#    end
#    render :new
  end

  private

  def material_count_params
    params.require(:material_count).permit(:material_num_id, :count).merge(count_day_id: params[:count_day_id])
  end

end
