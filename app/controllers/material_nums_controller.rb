class MaterialNumsController < ApplicationController

  def index
    @material_num = MaterialNum.all
    @product_num = ProductNum.all
  end

  def new
    @material_num = MaterialNum.new
  end


  def create
    @material_num = MaterialNum.new(material_num_params)
    if @material_num.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def material_num_params
    params.require(:material_num).permit(:product_number, :name)
  end

end
