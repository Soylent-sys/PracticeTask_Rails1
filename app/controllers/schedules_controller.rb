class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @date = Date.today
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "新しい予定を登録しました"
      redirect_to schedules_url
    else
      flash.now[:notice] = "予定の登録に失敗しました"
      render 'new'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "予定が編集されました"
      redirect_to schedules_url
    else
      flash.now[:notice] = "予定の編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
  end
end
