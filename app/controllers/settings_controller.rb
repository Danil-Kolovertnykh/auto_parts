class SettingsController < ApplicationController
  def index
    @settings = Setting.all
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    @setting.update(value: params[:setting][:value])
    redirect_to settings_path
  end
end