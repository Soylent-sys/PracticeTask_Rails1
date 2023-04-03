class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @date = Date.today
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
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
    if @schedule.update(schedule_params)
      flash[:notice] = "予定が編集されました"
      redirect_to schedules_url
    else
      flash.now[:notice] = "予定の編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to schedules_url
  end

  private

    def schedule_params
      params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
    end

end
