class MaterialPlansController < ApplicationController
  def new
    @count_day = CountDay.find(params[:count_day_id])
    @material_plan = MaterialPlan.new
  end

  def create
    @material_plan = MaterialPlan.new(material_plan_params)
    if MaterialNum.find_by(product_number: params[:material_plan][:material_nums])
      @material_plan.material_num_id = MaterialNum.find_by(product_number: params[:material_plan][:material_nums]).id
      if @material_plan.save
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

  def material_plan_params
    params.require(:material_plan).permit(:buy_day, :count).merge(count_day_id: params[:count_day_id])
  end

end
