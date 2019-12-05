class SchedulesController < ApplicationController

  def new
      @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(in: params[:sch], user_id: schedule_params[:user_id])
    @schedule.save
    respond_to do |format|
      format.html {redirect_to ("/")}
      format.json
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(out: params[:sch], user_id: schedule_params[:user_id])
    @schedule.save
    respond_to do |format|
      format.html {redirect_to ("/")}
      format.json
    end
  end

  def index
    @schedules = Schedule.where(schedule_params)
    @schedules.each do |schedule|
      puts schedule.in
      puts schedule.out
      puts schedule.user_id
      
    # binding.pry
    end
  end



  private
  def schedule_params
    params.permit(:in, :out, :user_id)
  end


end
