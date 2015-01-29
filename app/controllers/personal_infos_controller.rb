class PersonalInfosController < ApplicationController
  before_action :set_personal_info, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @personal_infos = PersonalInfo.all
    respond_with(@personal_infos)
  end

  def show
    respond_with(@personal_info)
  end

  def new
    @personal_info = PersonalInfo.new
    respond_with(@personal_info)
  end

  def edit
  end

  def create
    @personal_info = current_user.personal_infos.build(personal_info_params)
    if @personal_info.save
      redirect_to tasks_path, :notice => "your info saved."
    else
      render "new"
    end
  end

  def update
    @personal_info.update(personal_info_params)
    respond_with(@personal_info)
  end

  def destroy
    @personal_info.destroy
    respond_with(@personal_info)
  end

  private
    def set_personal_info
      @personal_info = PersonalInfo.find(params[:id])
    end

    def personal_info_params
      params.require(:personal_info).permit(:first_name, :last_name, :date_of_birth, :gender, :user_id)
    end
end
