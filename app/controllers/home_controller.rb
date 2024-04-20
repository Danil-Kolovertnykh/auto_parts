class HomeController < ApplicationController

  def index
    if params[:oem].present? && params[:brand].present?
      @result = PartsSoftService.get_offers_by_oem_and_make_name(params[:oem], params[:brand])
      @result = @result.select { |item| item["make_name"] == params[:brand] &&
        item["oem"] == params[:oem]} if @result.present?
    elsif params[:oem].present?
      @result = PartsSoftService.get_brands_by_oem(params[:oem])
    else
      @result = nil
    end
  end
end


