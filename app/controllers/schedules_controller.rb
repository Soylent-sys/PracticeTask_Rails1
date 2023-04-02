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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
