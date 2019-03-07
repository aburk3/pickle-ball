class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destory]
  def index
    if params[:club_id]
      @meetings = Club.find(params[:club_id]).meetings
    else
      @meetings = Meetings.all
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @club = Club.find(params[:club_id])
    @meeting = @club.meetings.build
  end

  def create
    @club = Club.find(params[:club_id])
    @club.meetings.build(meeting_params)
    if @club.save
      redirect_to club_path(@club), notice: "Meeting was succesfully created."
    else
      render :new
    end
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to club_path(@meeting.club_id), notice: "Update Successful."
    else
      redirect_to club_path(@meeting.club_id), notice: "Failed to Update."
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to club_path(@meeting.club_id)
  end

  private
    def meeting_params
      params.require(:meeting).permit(
        :name,
        :description,
        :count,
        :meeting_datetime,
      )
    end

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

end
