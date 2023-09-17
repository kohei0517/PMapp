class ProductMakesController < ApplicationController
  def new
    @count_day = CountDay.find(params[:count_day_id])
    @product_make = ProductMake.new
  end

  def create
    @product_make = ProductMake.new(product_make_params)
    if ProductNum.find_by(product_number: params[:product_make][:product_nums])
      @product_make.product_num_id = ProductNum.find_by(product_number: params[:product_make][:product_nums]).id
      if @product_make.save
        redirect_to root_path
      else
        render :new
      end
    else
      @alert_message = "その管理番号の材料は存在していません。"
      render :new
    end
  end

  def product_make_params
    params.require(:product_make).permit(:product_day, :count, :miss).merge(count_day_id: params[:count_day_id])
  end


end
