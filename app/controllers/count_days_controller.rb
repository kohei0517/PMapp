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
    @count_day = CountDay.find(params[:id])
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
