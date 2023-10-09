class ExportPlansController < ApplicationController


  def new
    @count_day = CountDay.find(params[:count_day_id])
    @export_plan = ExportPlan.new
  end

  def create
    @export_plan = ExportPlan.new(export_plan_params)
    if ProductNum.find_by(product_number: params[:export_plan][:product_nums])
      @export_plan.product_num_id = ProductNum.find_by(product_number: params[:export_plan][:product_nums]).id
      if @export_plan.save
        redirect_to root_path
      else
        render :new
      end
    else
      @alert_message = "その管理番号の材料は存在していません。"
      render :new
    end
  end

  def export_plan_params
    params.require(:export_plan).permit(:export_day, :count).merge(count_day_id: params[:count_day_id])
  end

end
