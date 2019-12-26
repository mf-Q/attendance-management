class SchedulesController < ApplicationController 

  def index
    @schedules = Schedule.where(schedule_params)
    @schedules.each do |schedule|
      @sch = schedule.user_id
    end
    @user = User.find(@sch)
  end

  def new
      @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(in: params[:sch], user_id: schedule_params[:user_id])
    @schedule.save!
    respond_to do |format|
      format.html {redirect_to ("/")}
      format.json
    end
  end

  def edit
    user = User.find(schedule_params[:user_id])
    @schedule = Schedule.find(user.schedules.ids.sort.last)
    @schedule.update(out: params[:sch])
    respond_to do |format|
      format.html {redirect_to ("/")}
      format.json
    end
  end

  def show
    @user = User.find(params[:user_id])
    @schedule = Schedule.find(params[:id])
  end


  def update
    @user = User.find(params[:user_id])
    @schedule = Schedule.find(params[:id])
    @schedule.update!(update_params)
    redirect_to action: 'index'
  end

  def destroy
    # user = User.find(params[:user_id])
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to action: 'index'
  end
  
  private
  def schedule_params
    params.permit(:in, :out, :user_id)
  end

  def update_params
    params.require(:schedule).permit(:in, :out, :user_id)
  end


end
