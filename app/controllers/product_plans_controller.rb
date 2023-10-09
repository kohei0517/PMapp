class ProductPlansController < ApplicationController


  def new
    @count_day = CountDay.find(params[:count_day_id])
    @product_plan = ProductPlan.new
  end

  def create
    @product_plan = ProductPlan.new(product_plan_params)
    binding.pry
    if ProductNum.find_by(product_number: params[:product_plan][:product_nums])
      @product_plan.product_num_id = ProductNum.find_by(product_number: params[:product_plan][:product_nums]).id
      if @product_plan.save
        redirect_to root_path
      else
        render :new
      end
    else
      @alert_message = "その管理番号の材料は存在していません。"
      render :new
    end
  end

  def product_plan_params
    params.require(:product_plan).permit(:product_day, :count).merge(count_day_id: params[:count_day_id])
  end

end
