class CountDaysController < ApplicationController
  def index
    @count_days = CountDay.all
  end

  def new
    @count_day = CountDay.new
  end

  def create
    @count_day = CountDay.new(count_day_params)
    if @count_day.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @material_num = MaterialNum.all
    @product_num = ProductNum.all
    @count_day = CountDay.find(params[:id])
    @material_plan = @count_day.material_plans
    @product_plan = @count_day.product_plans
    @material_count = @count_day.material_counts
    @product_count = @count_day.product_counts
    @export_plan = @count_day.export_plans
  end

  def edit
    @count_day = CountDay.find(params[:id])
  end

  def update
    @count_day = CountDay.find(params[:id])

    if @count_day.update(count_day_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    CountDay.delete(params[:id])
    redirect_to root_path
  end

  private 

  def count_day_params
    params.require(:count_day).permit(:inventory_day, :inventory_finish)
  end
end
