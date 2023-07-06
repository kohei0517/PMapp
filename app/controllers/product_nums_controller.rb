class ProductNumsController < ApplicationController
  def new
    @product_num = ProductNum.new
  end

  def create
    @product_num = ProductNum.new(product_params)
    if MaterialNum.find_by(product_number: params[:product_num][:product_nums])
      @product_num.material_num_id = MaterialNum.find_by(product_number: params[:product_num][:product_nums]).id
      if @product_num.save
        redirect_to root_path
      else
        render :new
      end
    else
      @alert_message = "その管理番号の材料は存在していません。"
      render :new
    end

  end


  private

  def product_params
    params.require(:product_num).permit(:product_number, :name, :material_count)
  end
end
