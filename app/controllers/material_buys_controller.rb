class MaterialBuysController < ApplicationController
  def new
    @count_day = CountDay.find(params[:count_day_id])
    @material_buy = MaterialBuy.new
  end

  def create
    @material_buy = MaterialBuy.new(material_buy_params)
    if MaterialNum.find_by(product_number: params[:material_buy][:material_nums])
      @material_buy.material_num_id = MaterialNum.find_by(product_number: params[:material_buy][:material_nums]).id
      if @material_buy.save
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

  def material_buy_params
    params.require(:material_buy).permit(:buy_day, :count).merge(count_day_id: params[:count_day_id])
  end

end
