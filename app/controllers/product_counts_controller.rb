class ProductCountsController < ApplicationController
  def new
    @count_day = CountDay.find(params[:count_day_id])
    @product_counts = ProductCount.all
    @product_count = ProductCount.new
    @product_num = ProductNum.all
  end

  def create
    @product_count = ProductCount.new(product_count_params)
    if @product_count.save
      redirect_to root_path
    else
      @product_num = ProductNum.all
      @count_day = CountDay.find(params[:count_day_id])
      render :new
    end
  end

  private

  def product_count_params
    params.require(:product_count).permit(:product_num_id, :count).merge(count_day_id: params[:count_day_id])
  end
end
